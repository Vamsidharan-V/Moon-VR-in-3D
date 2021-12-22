// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:2,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32486,y:32843|diff-2-OUT,spec-5-OUT,gloss-13-OUT,normal-19-RGB,amdfl-51-OUT;n:type:ShaderForge.SFN_Multiply,id:2,x:32894,y:32701|A-3-RGB,B-4-RGB;n:type:ShaderForge.SFN_Color,id:3,x:33084,y:32624,ptlb:Color Tint,ptin:_ColorTint,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4,x:33212,y:32728,ptlb:Main Texture,ptin:_MainTexture,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5,x:32894,y:32845|A-4-A,B-6-RGB,C-42-OUT;n:type:ShaderForge.SFN_Color,id:6,x:33065,y:32877,ptlb:Specular Color,ptin:_SpecularColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:13,x:33187,y:32939,ptlb:Shininess,ptin:_Shininess,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Tex2d,id:19,x:33174,y:33139,ptlb:Normal map,ptin:_Normalmap,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Slider,id:42,x:33187,y:33028,ptlb:Specular Power,ptin:_SpecularPower,min:0,cur:1,max:3;n:type:ShaderForge.SFN_Fresnel,id:48,x:32925,y:33244|EXP-52-OUT;n:type:ShaderForge.SFN_Color,id:50,x:32925,y:33398,ptlb:Rim Color,ptin:_RimColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:51,x:32749,y:33244|A-48-OUT,B-50-RGB,C-53-OUT;n:type:ShaderForge.SFN_ValueProperty,id:52,x:33070,y:33374,ptlb:Rim Fresnel,ptin:_RimFresnel,glob:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:53,x:32925,y:33569,ptlb:Rim Exp,ptin:_RimExp,glob:False,v1:1;proporder:3-6-13-42-4-19-50-52-53;pass:END;sub:END;*/

Shader "ManyWorlds/BumpedSpecular2sided" {
    Properties {
        _ColorTint ("Color Tint", Color) = (0.5,0.5,0.5,1)
        _SpecularColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
        _Shininess ("Shininess", Range(0, 1)) = 0.5
        _SpecularPower ("Specular Power", Range(0, 3)) = 1
        _MainTexture ("Main Texture", 2D) = "white" {}
        _Normalmap ("Normal map", 2D) = "bump" {}
        _RimColor ("Rim Color", Color) = (0.5,0.5,0.5,1)
        _RimFresnel ("Rim Fresnel", Float ) = 2
        _RimExp ("Rim Exp", Float ) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _ColorTint;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float4 _SpecularColor;
            uniform float _Shininess;
            uniform sampler2D _Normalmap; uniform float4 _Normalmap_ST;
            uniform float _SpecularPower;
            uniform float4 _RimColor;
            uniform float _RimFresnel;
            uniform float _RimExp;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_57 = i.uv0;
                float3 node_19 = UnpackNormal(tex2D(_Normalmap,TRANSFORM_TEX(node_57.rg, _Normalmap)));
                float3 normalLocal = node_19.rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
///////// Gloss:
                float gloss = _Shininess;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float4 node_4 = tex2D(_MainTexture,TRANSFORM_TEX(node_57.rg, _MainTexture));
                float3 specularColor = (node_4.a*_SpecularColor.rgb*_SpecularPower);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float node_48 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimFresnel);
                diffuseLight += (node_48*_RimColor.rgb*_RimExp); // Diffuse Ambient Light
                finalColor += diffuseLight * (_ColorTint.rgb*node_4.rgb);
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _ColorTint;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float4 _SpecularColor;
            uniform float _Shininess;
            uniform sampler2D _Normalmap; uniform float4 _Normalmap_ST;
            uniform float _SpecularPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_58 = i.uv0;
                float3 node_19 = UnpackNormal(tex2D(_Normalmap,TRANSFORM_TEX(node_58.rg, _Normalmap)));
                float3 normalLocal = node_19.rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
///////// Gloss:
                float gloss = _Shininess;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float4 node_4 = tex2D(_MainTexture,TRANSFORM_TEX(node_58.rg, _MainTexture));
                float3 specularColor = (node_4.a*_SpecularColor.rgb*_SpecularPower);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (_ColorTint.rgb*node_4.rgb);
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"

}
