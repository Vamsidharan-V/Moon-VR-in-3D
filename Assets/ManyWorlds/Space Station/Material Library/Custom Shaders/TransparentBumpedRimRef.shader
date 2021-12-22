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
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:Reflective/Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32150,y:32629|diff-8-OUT,spec-726-OUT,gloss-45-OUT,normal-51-RGB,emission-725-OUT,transm-747-OUT,amdfl-113-OUT,alpha-647-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33024,y:32372,ptlb:Base,ptin:_Base,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8,x:32778,y:32344|A-2-RGB,B-17-RGB;n:type:ShaderForge.SFN_Color,id:17,x:33024,y:32569,ptlb:Color Tint,ptin:_ColorTint,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:28,x:32823,y:32638|A-35-RGB,B-29-OUT;n:type:ShaderForge.SFN_Slider,id:29,x:33197,y:32391,ptlb:Specular Level,ptin:_SpecularLevel,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Tex2d,id:35,x:33197,y:32539,ptlb:Specular (RGB) Gloss (A),ptin:_SpecularRGBGlossA,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:43,x:33179,y:32729,ptlb:Gloss Level,ptin:_GlossLevel,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:45,x:32823,y:32800|A-35-A,B-43-OUT;n:type:ShaderForge.SFN_Tex2d,id:51,x:32982,y:32871,ptlb:Normal Map,ptin:_NormalMap,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Fresnel,id:78,x:33323,y:32984|EXP-102-OUT;n:type:ShaderForge.SFN_Color,id:84,x:33308,y:33144,ptlb:Rim Color,ptin:_RimColor,glob:False,c1:0.9926471,c2:0.9926471,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Slider,id:102,x:33443,y:33079,ptlb:Rim Level,ptin:_RimLevel,min:0,cur:2.805166,max:10;n:type:ShaderForge.SFN_Blend,id:113,x:33102,y:33071,blmd:1,clmp:True|SRC-78-OUT,DST-84-RGB;n:type:ShaderForge.SFN_Fresnel,id:162,x:32984,y:33462|EXP-166-OUT;n:type:ShaderForge.SFN_Cubemap,id:163,x:33132,y:33320,ptlb:Reflection Cube,ptin:_ReflectionCube,cube:a596436b21c6d484bb9b3b6385e3e666,pvfc:0;n:type:ShaderForge.SFN_Color,id:164,x:32970,y:33149,ptlb:Color Reflection,ptin:_ColorReflection,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:166,x:33253,y:33443,ptlb:Reflection Fresnel,ptin:_ReflectionFresnel,min:0,cur:2.255639,max:10;n:type:ShaderForge.SFN_Blend,id:185,x:32831,y:33207,blmd:1,clmp:True|SRC-163-RGB,DST-164-RGB;n:type:ShaderForge.SFN_Multiply,id:216,x:32792,y:33012|A-162-OUT,B-185-OUT;n:type:ShaderForge.SFN_Blend,id:227,x:32620,y:32914,blmd:1,clmp:True|SRC-35-A,DST-234-OUT;n:type:ShaderForge.SFN_Multiply,id:234,x:32605,y:33107|A-216-OUT,B-237-OUT;n:type:ShaderForge.SFN_Slider,id:237,x:32538,y:33305,ptlb:Reflection Ammount,ptin:_ReflectionAmmount,min:0,cur:1,max:10;n:type:ShaderForge.SFN_SwitchProperty,id:638,x:32316,y:33147,ptlb:Custom Alpha,ptin:_CustomAlpha,on:False|A-2-A,B-639-A;n:type:ShaderForge.SFN_Tex2d,id:639,x:32354,y:33334,ptlb:Custom Alpha Map,ptin:_CustomAlphaMap,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:647,x:32128,y:33147|A-638-OUT,B-648-OUT;n:type:ShaderForge.SFN_ValueProperty,id:648,x:32185,y:33324,ptlb:Alpha Intensity,ptin:_AlphaIntensity,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:725,x:32470,y:32771|A-227-OUT,B-647-OUT;n:type:ShaderForge.SFN_Multiply,id:726,x:32543,y:32585|A-28-OUT,B-647-OUT;n:type:ShaderForge.SFN_Multiply,id:738,x:31721,y:32824|A-739-OUT,B-740-RGB;n:type:ShaderForge.SFN_Slider,id:739,x:31591,y:32642,ptlb:Trans Itens,ptin:_TransItens,min:0,cur:1,max:3;n:type:ShaderForge.SFN_Color,id:740,x:31751,y:32987,ptlb:Trans Color,ptin:_TransColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Fresnel,id:746,x:31891,y:33022;n:type:ShaderForge.SFN_Multiply,id:747,x:31948,y:32833|A-738-OUT,B-748-OUT;n:type:ShaderForge.SFN_Slider,id:748,x:31774,y:32744,ptlb:Trans Fresnel,ptin:_TransFresnel,min:0,cur:1,max:3;proporder:17-2-51-638-639-648-35-29-43-84-102-163-237-164-166-739-740-748;pass:END;sub:END;*/

Shader "ManyWorlds/Transparent/BumpedRimRef" {
    Properties {
        _ColorTint ("Color Tint", Color) = (0.5,0.5,0.5,1)
        _Base ("Base", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "bump" {}
        [MaterialToggle] _CustomAlpha ("Custom Alpha", Float ) = 1
        _CustomAlphaMap ("Custom Alpha Map", 2D) = "white" {}
        _AlphaIntensity ("Alpha Intensity", Float ) = 1
        _SpecularRGBGlossA ("Specular (RGB) Gloss (A)", 2D) = "white" {}
        _SpecularLevel ("Specular Level", Range(0, 10)) = 0
        _GlossLevel ("Gloss Level", Range(0, 10)) = 0
        _RimColor ("Rim Color", Color) = (0.9926471,0.9926471,0.9926471,1)
        _RimLevel ("Rim Level", Range(0, 10)) = 2.805166
        _ReflectionCube ("Reflection Cube", Cube) = "_Skybox" {}
        _ReflectionAmmount ("Reflection Ammount", Range(0, 10)) = 1
        _ColorReflection ("Color Reflection", Color) = (0.5,0.5,0.5,1)
        _ReflectionFresnel ("Reflection Fresnel", Range(0, 10)) = 2.255639
        _TransItens ("Trans Itens", Range(0, 3)) = 1
        _TransColor ("Trans Color", Color) = (0.5,0.5,0.5,1)
        _TransFresnel ("Trans Fresnel", Range(0, 3)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _Base; uniform float4 _Base_ST;
            uniform float4 _ColorTint;
            uniform float _SpecularLevel;
            uniform sampler2D _SpecularRGBGlossA; uniform float4 _SpecularRGBGlossA_ST;
            uniform float _GlossLevel;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float4 _RimColor;
            uniform float _RimLevel;
            uniform samplerCUBE _ReflectionCube;
            uniform float4 _ColorReflection;
            uniform float _ReflectionFresnel;
            uniform float _ReflectionAmmount;
            uniform fixed _CustomAlpha;
            uniform sampler2D _CustomAlphaMap; uniform float4 _CustomAlphaMap_ST;
            uniform float _AlphaIntensity;
            uniform float _TransItens;
            uniform float4 _TransColor;
            uniform float _TransFresnel;
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
                #ifndef LIGHTMAP_OFF
                    float2 uvLM : TEXCOORD5;
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
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_762 = i.uv0;
                float3 normalLocal = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_762.rg, _NormalMap))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
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
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float3 backLight = max(0.0, -NdotL ) * ((_TransItens*_TransColor.rgb)*_TransFresnel);
                #ifndef LIGHTMAP_OFF
                    float3 diffuse = lightmap.rgb;
                #else
                    float3 diffuse = (forwardLight+backLight) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
                #endif
////// Emissive:
                float4 node_35 = tex2D(_SpecularRGBGlossA,TRANSFORM_TEX(node_762.rg, _SpecularRGBGlossA));
                float4 node_2 = tex2D(_Base,TRANSFORM_TEX(node_762.rg, _Base));
                float node_647 = (lerp( node_2.a, tex2D(_CustomAlphaMap,TRANSFORM_TEX(node_762.rg, _CustomAlphaMap)).a, _CustomAlpha )*_AlphaIntensity);
                float3 emissive = (saturate((node_35.a*((pow(1.0-max(0,dot(normalDirection, viewDirection)),_ReflectionFresnel)*saturate((texCUBE(_ReflectionCube,viewReflectDirection).rgb*_ColorReflection.rgb)))*_ReflectionAmmount)))*node_647);
///////// Gloss:
                float gloss = (node_35.a*_GlossLevel);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = ((node_35.rgb*_SpecularLevel)*node_647);
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
                diffuseLight += saturate((pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimLevel)*_RimColor.rgb)); // Diffuse Ambient Light
                finalColor += diffuseLight * (node_2.rgb*_ColorTint.rgb);
                finalColor += specular;
                finalColor += emissive;
/// Final Color:
                return fixed4(finalColor,node_647);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _Base; uniform float4 _Base_ST;
            uniform float4 _ColorTint;
            uniform float _SpecularLevel;
            uniform sampler2D _SpecularRGBGlossA; uniform float4 _SpecularRGBGlossA_ST;
            uniform float _GlossLevel;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform samplerCUBE _ReflectionCube;
            uniform float4 _ColorReflection;
            uniform float _ReflectionFresnel;
            uniform float _ReflectionAmmount;
            uniform fixed _CustomAlpha;
            uniform sampler2D _CustomAlphaMap; uniform float4 _CustomAlphaMap_ST;
            uniform float _AlphaIntensity;
            uniform float _TransItens;
            uniform float4 _TransColor;
            uniform float _TransFresnel;
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
                float2 node_763 = i.uv0;
                float3 normalLocal = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_763.rg, _NormalMap))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float3 backLight = max(0.0, -NdotL ) * ((_TransItens*_TransColor.rgb)*_TransFresnel);
                float3 diffuse = (forwardLight+backLight) * attenColor;
///////// Gloss:
                float4 node_35 = tex2D(_SpecularRGBGlossA,TRANSFORM_TEX(node_763.rg, _SpecularRGBGlossA));
                float gloss = (node_35.a*_GlossLevel);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float4 node_2 = tex2D(_Base,TRANSFORM_TEX(node_763.rg, _Base));
                float node_647 = (lerp( node_2.a, tex2D(_CustomAlphaMap,TRANSFORM_TEX(node_763.rg, _CustomAlphaMap)).a, _CustomAlpha )*_AlphaIntensity);
                float3 specularColor = ((node_35.rgb*_SpecularLevel)*node_647);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (node_2.rgb*_ColorTint.rgb);
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * node_647,0);
            }
            ENDCG
        }
    }
    FallBack "Reflective/Bumped Specular"

}
