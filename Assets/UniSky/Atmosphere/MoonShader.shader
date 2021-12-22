// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Moon Shader" 
{
	Properties
   {
      _MainTexture ("Base (RGB)", RECT) = "white" {}
	  _MoonSize("Moon Size", float) = 0
	  _CameraUp("camera up vector", Vector) = (0,0,0)
	  _CameraRight("camera right vector", Vector) = (0,0,0)
	  _v4LightDir("Sun Direction", Vector) = (0,0,0)
   }
   
   SubShader
   {
	Tags { "RenderType"="Opaque" "Queue" = "Geometry"}
	
	 Cull Off 
	 Lighting Off 
	 Fog { Mode Off }
	
     Pass
      {
		 Blend SrcAlpha OneMinusSrcAlpha

         CGPROGRAM

         #pragma multi_compile_builtin
		 #pragma vertex vert
         #pragma fragment frag
         #include "UnityCG.cginc"
			
		sampler2D _MainTexture;	
		float _MoonSize;
		float3 _CameraRight;
		float3 _CameraUp;
		float3 _v4LightDir;
		
		struct v2f 
		 {
			float4	pos : POSITION;
			float2 texCoord : TEXCOORD0;
			float2 depth : TEXCOORD1;
			float color : COLOR;
		};
		 
		
		 v2f vert (appdata_base v)
		{
			// billboarding
			float3 center = v.vertex;
			
			float3 eyeVector = ObjSpaceViewDir( v.vertex );
			
			// add a random amount here
			float3 finalPosition = center;
			
			finalPosition += (v.texcoord.x-0.5f)*_CameraRight*_MoonSize;
			finalPosition += (v.texcoord.y-0.5f)*_CameraUp*_MoonSize;
			
			float4 pos = float4(finalPosition,1);


			v2f o;
			o.pos = UnityObjectToClipPos (pos);
			o.texCoord = v.texcoord;

			return o;
		}

		 half4 frag(v2f v) : COLOR0
         {
			float4 color;
			color = tex2D(_MainTexture, v.texCoord);
			
			color.a = lerp(0, color.a, abs(_v4LightDir.y-0.3));

			return color;
         }
		 
         ENDCG
      } 
	}
}

