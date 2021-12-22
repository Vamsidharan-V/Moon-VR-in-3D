Shader "Detail Bumped Specular" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Specular Color", Color) = (0.5, 0.5, 0.5, 1)
    _Shininess ("Shininess", Range (0.03, 1)) = 0.078125
_MainTex ("Base (RGB)", 2D) = "white" {}
_Detail ("Detail (RGB)", 2D) = "gray" {}
_BumpMap ("Normalmap", 2D) = "bump" {}
 
_SpecTex ("Spec (RGB)", 2D) = "white" {}
}
 
SubShader {
Tags { "RenderType"="Opaque" }
LOD 250
 
CGPROGRAM
#pragma surface surf Lambert
 
sampler2D _MainTex;
sampler2D _Detail;
sampler2D _BumpMap;
sampler2D _SpecTex;
fixed4 _Color;
float _Shininess;
 
struct Input {
float2 uv_MainTex;
float2 uv_Detail;
float2 uv_BumpMap;
};
 
void surf (Input IN, inout SurfaceOutput o) {
fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
c.rgb *= tex2D(_Detail,IN.uv_Detail).rgb*2;
half4 spectex = tex2D(_SpecTex, IN.uv_MainTex);
    _SpecColor = spectex;
o.Albedo = c.rgb;
o.Specular = _Shininess;
o.Alpha = c.a;
o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
}
ENDCG
}
 
Fallback "Diffuse"
}