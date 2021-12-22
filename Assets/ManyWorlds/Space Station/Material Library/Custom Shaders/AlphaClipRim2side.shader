// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_LightmapInd', a built-in variable
// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,enco:False,frtr:True,vitr:True,dbil:True,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:1,culm:2,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32529,y:33147|diff-33-OUT,spec-103-OUT,gloss-112-OUT,normal-6-OUT,amdfl-48-OUT,clip-12-A;n:type:ShaderForge.SFN_Tex2d,id:2,x:33198,y:32720,ptlb:Difuse,ptin:_Difuse,tex:6a3a2441cd9711b4d81e56e767db5dbb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:3,x:33198,y:32551,ptlb:Color,ptin:_Color,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5,x:33560,y:32874,ptlb:Normal,ptin:_Normal,tex:b5f97d2ee870ff041a544ea50910b6e1,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:6,x:33375,y:33009|A-5-RGB,B-7-OUT,T-8-OUT;n:type:ShaderForge.SFN_Vector3,id:7,x:33560,y:33027,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_ValueProperty,id:8,x:33560,y:33142,ptlb:Smooth Normal,ptin:_SmoothNormal,glob:False,v1:0;n:type:ShaderForge.SFN_Fresnel,id:9,x:33213,y:33279|NRM-10-OUT,EXP-11-OUT;n:type:ShaderForge.SFN_NormalVector,id:10,x:33374,y:33279,pt:True;n:type:ShaderForge.SFN_ValueProperty,id:11,x:33374,y:33448,ptlb:Rim Fresnel,ptin:_RimFresnel,glob:False,v1:2;n:type:ShaderForge.SFN_Tex2d,id:12,x:32967,y:33471,ptlb:Alpha Map,ptin:_AlphaMap,tex:3363d5eaf4f237b409f9e1ab12730142,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:13,x:32781,y:33445|A-12-A,B-14-OUT;n:type:ShaderForge.SFN_ValueProperty,id:14,x:32967,y:33659,ptlb:Cutout,ptin:_Cutout,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:28,x:33023,y:32672|A-3-RGB,B-2-RGB,C-136-OUT;n:type:ShaderForge.SFN_Tex2d,id:29,x:32388,y:32943,ptlb:AOclussion,ptin:_AOclussion,tex:bc3be832b0b46824f9891a81e51b5c8a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:32,x:32377,y:33147,ptlb:AOC Power,ptin:_AOCPower,glob:False,v1:1;n:type:ShaderForge.SFN_Add,id:33,x:32844,y:32839|A-28-OUT,B-9-OUT;n:type:ShaderForge.SFN_Multiply,id:48,x:33027,y:33279|A-136-OUT,B-9-OUT,C-49-OUT,D-2-RGB,E-13-OUT;n:type:ShaderForge.SFN_ValueProperty,id:49,x:33168,y:33471,ptlb:Emission,ptin:_Emission,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:102,x:33362,y:32828,ptlb:Specular Map,ptin:_SpecularMap,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:103,x:32989,y:32986|A-102-A,B-136-OUT,C-104-OUT,D-2-RGB,E-13-OUT;n:type:ShaderForge.SFN_ValueProperty,id:104,x:33159,y:33119,ptlb:Specular Level,ptin:_SpecularLevel,glob:False,v1:1;n:type:ShaderForge.SFN_Slider,id:112,x:32410,y:32854,ptlb:Gloss,ptin:_Gloss,min:0,cur:0.2,max:1;n:type:ShaderForge.SFN_Lerp,id:136,x:32212,y:33090|A-29-A,B-137-OUT,T-32-OUT;n:type:ShaderForge.SFN_Vector1,id:137,x:32363,y:33313,v1:1;proporder:3-2-102-104-112-12-14-5-8-29-32-11-49;pass:END;sub:END;*/

Shader "ManyWorlds/Transparent/AlphaClipRim2side" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Difuse ("Difuse", 2D) = "white" {}
        _SpecularMap ("Specular Map", 2D) = "white" {}
        _SpecularLevel ("Specular Level", Float ) = 1
        _Gloss ("Gloss", Range(0, 1)) = 0.2
        _AlphaMap ("Alpha Map", 2D) = "white" {}
        _Cutout ("Cutout", Float ) = 1
        _Normal ("Normal", 2D) = "bump" {}
        _SmoothNormal ("Smooth Normal", Float ) = 0
        _AOclussion ("AOclussion", 2D) = "white" {}
        _AOCPower ("AOC Power", Float ) = 1
        _RimFresnel ("Rim Fresnel", Float ) = 2
        _Emission ("Emission", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _Difuse; uniform float4 _Difuse_ST;
            uniform float4 _Color;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _SmoothNormal;
            uniform float _RimFresnel;
            uniform sampler2D _AlphaMap; uniform float4 _AlphaMap_ST;
            uniform float _Cutout;
            uniform sampler2D _AOclussion; uniform float4 _AOclussion_ST;
            uniform float _AOCPower;
            uniform float _Emission;
            uniform sampler2D _SpecularMap; uniform float4 _SpecularMap_ST;
            uniform float _SpecularLevel;
            uniform float _Gloss;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                #ifndef LIGHTMAP_OFF
                    float2 uvLM : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                #ifndef LIGHTMAP_OFF
                    o.uvLM = v.texcoord1 * unity_LightmapST.xy + unity_LightmapST.zw;
                #endif
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_182 = i.uv0;
                float3 normalLocal = lerp(UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_182.rg, _Normal))).rgb,float3(0,0,1),_SmoothNormal);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                float4 node_12 = tex2D(_AlphaMap,TRANSFORM_TEX(node_182.rg, _AlphaMap));
                clip(node_12.a - 0.5);
                #ifndef LIGHTMAP_OFF
                    float4 lmtex = UNITY_SAMPLE_TEX2D(unity_Lightmap,i.uvLM);
                    #ifndef DIRLIGHTMAP_OFF
                        float3 lightmap = DecodeLightmap(lmtex);
                        float3 scalePerBasisVector = DecodeLightmap(UNITY_SAMPLE_TEX2D_SAMPLER(unity_LightmapInd,unity_Lightmap,i.uvLM));
                        UNITY_DIRBASIS
                        half3 normalInRnmBasis = saturate (mul (unity_DirBasis, normalLocal));
                        lightmap *= dot (normalInRnmBasis, scalePerBasisVector);
                    #else
                        float3 lightmap = DecodeLightmap(lmtex);
                    #endif
                #endif
                #ifndef LIGHTMAP_OFF
                    #ifdef DIRLIGHTMAP_OFF
                        float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                    #else
                        float3 lightDirection = normalize (scalePerBasisVector.x * unity_DirBasis[0] + scalePerBasisVector.y * unity_DirBasis[1] + scalePerBasisVector.z * unity_DirBasis[2]);
                        lightDirection = mul(lightDirection,tangentTransform); // Tangent to world
                    #endif
                #else
                    float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                #endif
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                #ifndef LIGHTMAP_OFF
                    float3 diffuse = lightmap.rgb;
                #else
                    float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb*2;
                #endif
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_136 = lerp(tex2D(_AOclussion,TRANSFORM_TEX(node_182.rg, _AOclussion)).a,1.0,_AOCPower);
                float4 node_2 = tex2D(_Difuse,TRANSFORM_TEX(node_182.rg, _Difuse));
                float node_13 = (node_12.a*_Cutout);
                float3 specularColor = (tex2D(_SpecularMap,TRANSFORM_TEX(node_182.rg, _SpecularMap)).a*node_136*_SpecularLevel*node_2.rgb*node_13);
                float3 specular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                #ifndef LIGHTMAP_OFF
                    #ifndef DIRLIGHTMAP_OFF
                        specular *= lightmap;
                    #else
                        specular *= (floor(attenuation) * _LightColor0.xyz);
                    #endif
                #else
                    specular *= (floor(attenuation) * _LightColor0.xyz);
                #endif
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float node_9 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimFresnel);
                diffuseLight += (node_136*node_9*_Emission*node_2.rgb*node_13); // Diffuse Ambient Light
                finalColor += diffuseLight * ((_Color.rgb*node_2.rgb*node_136)+node_9);
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _Difuse; uniform float4 _Difuse_ST;
            uniform float4 _Color;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _SmoothNormal;
            uniform float _RimFresnel;
            uniform sampler2D _AlphaMap; uniform float4 _AlphaMap_ST;
            uniform float _Cutout;
            uniform sampler2D _AOclussion; uniform float4 _AOclussion_ST;
            uniform float _AOCPower;
            uniform sampler2D _SpecularMap; uniform float4 _SpecularMap_ST;
            uniform float _SpecularLevel;
            uniform float _Gloss;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
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
                float2 node_183 = i.uv0;
                float3 normalLocal = lerp(UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_183.rg, _Normal))).rgb,float3(0,0,1),_SmoothNormal);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
                float4 node_12 = tex2D(_AlphaMap,TRANSFORM_TEX(node_183.rg, _AlphaMap));
                clip(node_12.a - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_136 = lerp(tex2D(_AOclussion,TRANSFORM_TEX(node_183.rg, _AOclussion)).a,1.0,_AOCPower);
                float4 node_2 = tex2D(_Difuse,TRANSFORM_TEX(node_183.rg, _Difuse));
                float node_13 = (node_12.a*_Cutout);
                float3 specularColor = (tex2D(_SpecularMap,TRANSFORM_TEX(node_183.rg, _SpecularMap)).a*node_136*_SpecularLevel*node_2.rgb*node_13);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float node_9 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimFresnel);
                finalColor += diffuseLight * ((_Color.rgb*node_2.rgb*node_136)+node_9);
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            Cull Off
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _AlphaMap; uniform float4 _AlphaMap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float2 uv0 : TEXCOORD5;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                float2 node_184 = i.uv0;
                float4 node_12 = tex2D(_AlphaMap,TRANSFORM_TEX(node_184.rg, _AlphaMap));
                clip(node_12.a - 0.5);
                SHADOW_COLLECTOR_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Cull Off
            Offset 1, 1
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _AlphaMap; uniform float4 _AlphaMap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                float2 node_185 = i.uv0;
                float4 node_12 = tex2D(_AlphaMap,TRANSFORM_TEX(node_185.rg, _AlphaMap));
                clip(node_12.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"

}
