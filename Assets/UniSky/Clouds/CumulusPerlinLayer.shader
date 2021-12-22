// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Cumulus Perlin Layer" 
{
	Properties 
   {
		// Texture used to generate perlin noise
		_NoiseTexture("Noise Texture", 2D) = "white" {}
		
		// This is the calculated illumination for the clouds
		_IllumReference("Illumination Texture", 2D) = "white" {}
		
		_SunColor("Sun Color", Vector) = (0,0,0,0)
		_CloudCover("Cloud Cover", float) = 0
		_SunAngle("Sun's Angle", float) = 0
		_PrecipLevel("Precipitation Level", float) = 0
		_Speed("Cloud Speed", Vector) = (0,0,0)
		_ColorVar1("Color Variance 1", Vector) = (0,0,0)
		_ColorVar2("Color Variance 2", Vector) = (0,0,0)
		_GlowVar("Glow Variance", float) = 0
		_ViewDistance("View Distance", float) = 0
		_FogDensity("Fog Density", float) = 0
		
		// We use this for the simulated atmospheric scattering
		_v3CameraPos("Camera Position",Vector) = (0,0,0)
	}

   Subshader 
   {
	 Tags { "RenderType"="Geometry" "Queue" = "Geometry+1"}
	 Fog { Mode Off }
	  Pass 
	  {
		Blend SrcAlpha OneMinusSrcAlpha
		ZWrite Off
		Cull Back
	//	Offset 1,-10
		
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
    		#pragma target 3.0
			#include "UnityCG.cginc"
			
			#define 	ONE   1.0/128.0
			#define  ONEHALF    0.5/128.0

			sampler2D _IllumReference;
			sampler2D _NoiseTexture;
			float4 _SunColor;
			float _CloudCover;
			float Time;
			float _SunAngle;
			float _PrecipLevel;
			float3 _Speed;
			float3 _ColorVar1;
			float3 _ColorVar2;
			float _ViewDistance;
			float _GlowVar;
			float _FogDensity;
			
			float4 _v3CameraPos;

			struct appdata_v
			{
				float4	vertex : POSITION;
				float2 texcoord : TEXCOORD0;
				float3 vertPos : COLOR0;	
			};

			struct v2f 
			{
				float2 texCoord : TEXCOORD0;
				float3 vertPos : COLOR0;
				float4 pos : SV_POSITION;
				float3 t0 : TEXCOORD1;
			};
						
			float4 randNum (float2 co)
			{
				return tex2D(_NoiseTexture, co).rgba;
			}
			
			float fade(float t) 
			{
				return t*t*t*(t*(t*6.0-15.0)+10.0);
			}
			
			float Noise3D(float3 P)
			{
				float3 Pi = ONE*floor(P)+ONEHALF;
				float3 Pf = frac(P);

				float perm00 = randNum(Pi.xy).a ;
				float3  grad000 = randNum(float2(perm00, Pi.z)).rgb * 4.0 - 1.0;
				float n000 = dot(grad000, Pf);
				float3  grad001 = randNum(float2(perm00, Pi.z + ONE)).rgb * 4.0 - 1.0;
				float n001 = dot(grad001, Pf - float3(0.0, 0.0, 1.0));

				float perm01 = randNum(Pi.xy + float2(0.0, ONE)).a;
				float3 grad010 = randNum(float2(perm01, Pi.z)).rgb * 4.0 - 1.0;
				float n010 = dot(grad010, Pf - float3(0.0, 1.0, 0.0));
				float3  grad011 = randNum(float2(perm01, Pi.z + ONE)).rgb * 4.0 - 1.0;
				float n011 = dot(grad011, Pf - float3(0.0, 1.0, 1.0));

				float perm10 = randNum(Pi.xy + float2(ONE, 0.0)).a ;
				float3  grad100 = randNum(float2(perm10, Pi.z)).rgb * 4.0 - 1.0;
				float n100 = dot(grad100, Pf - float3(1.0, 0.0, 0.0));
				float3  grad101 = randNum(float2(perm10, Pi.z + ONE)).rgb * 4.0 - 1.0;
				float n101 = dot(grad101, Pf - float3(1.0, 0.0, 1.0));

				float perm11 = randNum(Pi.xy + float2(ONE, ONE)).a ;
				float3  grad110 = randNum(float2(perm11, Pi.z)).rgb * 4.0 - 1.0;
				float n110 = dot(grad110, Pf - float3(1.0, 1.0, 0.0));
				float3  grad111 = randNum(float2(perm11, Pi.z + ONE)).rgb * 4.0 - 1.0;
				float n111 = dot(grad111, Pf - float3(1.0, 1.0, 1.0));

				float4 n_x = lerp(float4(n000, n001, n010, n011),
				float4(n100, n101, n110, n111), fade(Pf.x));
				float2 n_xy = lerp(n_x.xy, n_x.zw, fade(Pf.y));
				float n_xyz = lerp(n_xy.x, n_xy.y, fade(Pf.z));

				return n_xyz;
			}

			v2f vert (appdata_v v)
			{
				v2f o;

				o.pos = UnityObjectToClipPos( v.vertex);
				o.texCoord = v.texcoord;
				o.vertPos.rg = o.texCoord;
				o.vertPos.b = 0;
				o.pos = UnityObjectToClipPos (v.vertex/20);

				o.t0 = (float3(0, 44931.74, 0) - mul(v.vertex, unity_ObjectToWorld)).xyz;

				return o;
			}
			
			half4 frag (v2f i) : COLOR
			{
				// static var - edit this variable to change the scale of the clouds
				float scale = 60;
				
				float3 vertexpos = i.vertPos.xyz;

				// var 
				float3 DSpeed = float3(_Speed.x,_Speed.y,_Speed.z);

				float clouds = 1.4f;
				clouds += Noise3D((vertexpos*scale)+(clouds*0.14)+(Time*DSpeed))*1.1;
				clouds += abs(Noise3D(((vertexpos*scale+(clouds*0.14))+(Time*DSpeed))*4.0)/4.0);
				clouds += abs(Noise3D(((vertexpos*scale+(clouds*0.18))+(Time*DSpeed))*8.0)/8.0);
				clouds += abs(Noise3D(((vertexpos*scale+(clouds*0.16))+(Time*DSpeed))*16.0)/16.0);
				clouds += abs(Noise3D(((vertexpos*scale+(clouds*0.16))+(Time*DSpeed))*32.0)/32.0);
				clouds += abs(Noise3D(((vertexpos*scale+(clouds*0.16))+(Time*DSpeed))*64.0)/64.0);

				// var
				clouds += _CloudCover;

				float4 retColor;
				retColor.a = clouds;
				
				// var (cloud color variance 1)
				retColor.rgb = _ColorVar1 - retColor.rgb;

				float3 illColor = tex2D(_IllumReference, float2(i.texCoord.x, i.texCoord.y));
				
				illColor.rgb *= _SunColor.rgb;
				
				retColor.rgb -= illColor.rgb;

				if(_SunAngle <= 0 && retColor.a > 0)
					retColor.rgb /= lerp(retColor.a, 1, - _CloudCover * (1 - abs(_SunAngle)));
					
				if(retColor.a > 0 && _SunAngle > 0)				
					retColor.rgb /= lerp(retColor.a, 1, -_CloudCover * (1 - _SunAngle));	
				
				// var (cloud color variance 2)
				retColor.rgb = lerp(float3(1,1,1), retColor.rgb, _ColorVar2);
				
				retColor.rgb *= _SunColor.rgb;
				
				// var (cloud color glow variance)
				retColor.a *= (_GlowVar-retColor.r);
				
				// var (cloud precipitation)				
				retColor.rgb = lerp(float3(0,0,0), retColor.rgb, _PrecipLevel);	
				
				// var (atmosphere visibility distance)
				if(retColor.a > 0)
					retColor.a *= 1 - ((length(i.t0)*length(i.t0))/70000000 * _ViewDistance);
				
				return retColor;
			}

			ENDCG
		}
   }
} 