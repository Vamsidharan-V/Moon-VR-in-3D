// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'PositionFog()' with multiply of UNITY_MATRIX_MVP by position
// Upgrade NOTE: replaced 'V2F_POS_FOG' with 'float4 pos : SV_POSITION'

// Upgrade NOTE: replaced 'glstate.matrix.mvp' with 'UNITY_MATRIX_MVP'

/// Based off of O'Neil's atmospheric scattering articles

Shader "atmosScattering" {
	Properties {
	  _StarTex("Star Texture", 2D) = "white" {}
	  _v4CameraPos("Camera Position",Vector) = (0,0,0,0)
	  _v4LightDir("Light Direction",Vector) = (0,0,0,0)
	  _cInvWaveLength("Inverse WaveLength",Vector) = (0,0,0)
	  _fCameraHeight("Camera Height",Float) = 0
	  _fCameraHeight2("Camera Height2",Float) = 0
	  _fOuterRadius("Outer Radius",Float) = 0
	  _fOuterRadius2("Outer Radius 2",Float) = 0
	  _fInnerRadius("Inner Radius",Float) = 0
	  _fInnerRadius2("Inner Radius 2",Float) = 0
	  _fKrESun("KrESun",Float) = 0
	  _fKmESun("KmESun",Float) = 0
	  _fKr4PI("Kr4PI",Float) = 0
	  _fKm4PI("Km4PI",Float) = 0
	  _fScale("Scale",Float) = 0
	  _fScaleDepth("Scale Depth",Float) = 0
	  _fScaleOverScaleDepth("Scale Over Scale Depth",Float) = 0
	  _Samples("Samples",Float) = 0
	  _G("G",Float) = 0
	  _G2("G2",Float) = 0
	  _Exposure("Exposure", Float) = 0
	  _OffsetTransform("Offset Transform", Vector) = (0,0,0)
	  _SkyBloomThreshold("Sky Bloom Threshold", Float) = 0
	  _SunColor("Sun Color", Vector) = (0,0,0)
	  _FogDensity("Fog Density", float) = 0
	}
	
	SubShader {
      Pass {
	  
	   Tags {"Queue" = "Overlay" }
      	Cull Back
		Blend One OneMinusSrcAlpha
		ZWrite Off
		Fog { Density [_FogDensity] Color [_SunColor] }

CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma target 3.0
#include "UnityCG.cginc"
		
sampler2D _StarTex;		
float4 _v4CameraPos;
float4 _v4LightDir;
float3 _cInvWaveLength;
float _fCameraHeight;
float _fCameraHeight2;	  
float _fOuterRadius;
float _fOuterRadius2;	  
float _fInnerRadius;
float _fInnerRadius2;
float _fKrESun;
float _fKmESun;
float _fKr4PI;
float _fKm4PI;
float _fScale;
float _fScaleDepth;
float _fScaleOverScaleDepth;
float _Samples;
float _G;
float _G2;
float _Exposure;
float3 _OffsetTransform;
float _SkyBloomThreshold;
float3 _SunColor;
float _FogDensity;

 struct vertout
{
//	float4 pos : POSITION;		// Transformed vertex position
	float4 pos : SV_POSITION;
	float4 c0 : COLOR0;			// The Rayleigh color
	float4 c1 : COLOR1;			// The Mie color
	float3 t0 : TEXCOORD0;
	float3 texCoord : TEXCOORD1;
};

float scale(float fCos)
{
	float x = 1.0 - fCos;
	return _fScaleDepth * exp(-0.00287f + x*(0.459f + x*(3.83f + x*(-6.80f + x*5.25f))));
}

 float3 ContrastSaturationBrightness(float3 color, float brt, float sat, float con)
{
  float3 LumCoeff = float3(0.2125, 0.7154, 0.0721);
  
  float3 AvgLumin = float3(0.5, 0.5, 0.5);
  float3 brtColor = color * brt;
  float3 intensity = float3(dot(brtColor, LumCoeff));
  float3 satColor = lerp(intensity, brtColor, sat);
  float3 conColor = lerp(AvgLumin, satColor, con);
  
  return conColor;
}
	
// VERTEX PROG ****************************

vertout vert(appdata_base i)
{
	_v4CameraPos.x -= _OffsetTransform.x;
	_v4CameraPos.z -= _OffsetTransform.z;
	
	float3 v3Pos = mul(i.vertex, unity_ObjectToWorld);
	
	float3 v3Ray = v3Pos - _v4CameraPos;
	float fFar = length(v3Ray);
	v3Ray /= fFar;
	float3 v3Start = _v4CameraPos;
	float fHeight = length(v3Start);
	
	float fDepth = exp(_fScaleOverScaleDepth * (_fInnerRadius + ((1.0f-_v4LightDir.y)*700) - _fCameraHeight));
	
	float fStartAngle = dot(v3Ray, v3Start) / fHeight;
	float fStartOffset = fDepth*scale(fStartAngle);
	// Initialize the scattering loop variables
	float fSampleLength = fFar / _Samples;
	float fScaledLength = fSampleLength * _fScale;
	float3 v3SampleRay = v3Ray * fSampleLength;
	float3 v3SamplePoint = v3Start + v3SampleRay * 0.5f;

	float3 v3FrontColor = float3(0.0, 0.0, 0.0);
	
	for(int i=0; i<3; i++)
	{
		fHeight = length(v3SamplePoint);
		fDepth = exp(_fScaleOverScaleDepth * (_fInnerRadius - fHeight));
		
		float fLightAngle = dot(_v4LightDir, v3SamplePoint) / fHeight;
		float fCameraAngle = dot(v3Ray, v3SamplePoint) / fHeight;
		float fScatter = (fStartOffset + fDepth*(scale(fLightAngle) - scale(fCameraAngle)));
		
		float3 v3Attenuate = exp(-fScatter * (_cInvWaveLength * _fKr4PI + _fKm4PI));
		v3FrontColor += v3Attenuate * (fDepth * fScaledLength);
		v3SamplePoint += v3SampleRay;
	}

	vertout OUT;
	
	OUT.pos = UnityObjectToClipPos (i.vertex/ 5);
	
//	OUT.pos = mul(UNITY_MATRIX_MVP, i.vertex);
	
	OUT.c0.rgb = v3FrontColor * (_cInvWaveLength * _fKrESun);
	OUT.c1.rgb = v3FrontColor * _fKmESun; 
	
	OUT.c0.a = _SkyBloomThreshold;
	OUT.c1.a = _SkyBloomThreshold;

	OUT.t0 = _v4CameraPos - v3Pos;
	
	OUT.texCoord = i.texcoord * 70;

	return OUT;
}


// FRAGMENT PROG ************************s

float4 frag (vertout INPUT) : COLOR
{
	float fCos = dot(_v4LightDir, INPUT.t0) / length(INPUT.t0);
	float fCos2 = fCos*fCos;
	
	float rayleighPhase =  1.75 + 0.75*fCos2;
	float miePhase = 1.5f * ((1.0f - _G2) / (2.0f + _G2)) * (1.0f + fCos2) / pow(1.0f + _G2 - 2.0f*_G*fCos, 1.5f);
		
	if(_v4LightDir.y < 0.7)
	{
		rayleighPhase *= lerp(2, 1, clamp(_v4LightDir.y*4, 0, 1));
		miePhase *= lerp(40, 1, clamp(_v4LightDir.y*4, 0 ,1));
	}
	
    float4 stars = lerp(tex2D(_StarTex, float2(INPUT.texCoord.x, INPUT.texCoord.y)), 0, _v4LightDir.y);
	
	float4 color = 1 - exp((-_Exposure - (1.0f-_v4LightDir.y)) * (rayleighPhase * INPUT.c0 + miePhase * INPUT.c1));

	// fade the stars out with distance
	stars *= 2.0f - ((length(INPUT.t0)*length(INPUT.t0))/70000000 * 1);
	
	stars.rgb /= 5.5f;
					
	color.rgb += stars.rgb;
	color.rgb = ContrastSaturationBrightness(color.rgb, 1, 1-_FogDensity * 500, 1);
	
	return color;
}

ENDCG
		}
	}
// FallBack "None"
}