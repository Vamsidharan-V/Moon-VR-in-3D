// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Offscreen Composite Shader" {
	Properties {
		_Framebuffer("Framebuffer", 2D) = "white" {}
		_OffscreenRT("Off screen render texture", 2D) = "white" {}
		_RTSize("Render Texture Size", Vector) = (0,0,0)
	}
	SubShader {
		Pass {
			ZTest Always 
			Cull Off 
			ZWrite Off 
			Fog { Mode Off }

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#include "UnityCG.cginc"
			
			sampler2D _Framebuffer;
			sampler2D _OffscreenRT;
			float3 _RTSize;
			
			struct appdata_v
			{
				float4	vertex : POSITION;
				float2 texcoord : TEXCOORD0;
				float3 color : COLOR0;
			};

			struct v2f 
			{
				float4	pos : POSITION;
				float2 texCoord : TEXCOORD0;
				float3 color : COLOR0;
			};
			
			v2f vert (appdata_v v)
			{
				v2f o;

				o.pos = UnityObjectToClipPos( v.vertex);
				o.texCoord.x = v.texcoord.x;
				o.texCoord.y = v.texcoord.y;

				return o;
			}
			
			half4 frag (v2f i) : COLOR
			{
				float4 framebuffer = tex2D(_Framebuffer, i.texCoord);
				float4 offscreenRT = tex2D(_OffscreenRT, i.texCoord);
				
				float4 color;
				color.rgb = (1-offscreenRT.rgb) * offscreenRT.rgb + ((offscreenRT.a) * framebuffer.rgb);
				color.a = 1;
				
				return color;
			}

			ENDCG
		}
	}
	Fallback Off
}