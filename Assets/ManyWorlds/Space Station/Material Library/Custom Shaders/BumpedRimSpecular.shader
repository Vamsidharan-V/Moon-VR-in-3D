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
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32594,y:32798|diff-2-OUT,spec-24-OUT,gloss-126-OUT,normal-15-OUT,emission-143-OUT,transm-90-OUT,lwrap-90-OUT,amdfl-28-OUT;n:type:ShaderForge.SFN_Multiply,id:2,x:32888,y:32695|A-25-OUT,B-12-OUT;n:type:ShaderForge.SFN_Color,id:3,x:33286,y:32731,ptlb:Color,ptin:_Color,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5,x:33565,y:32848,ptlb:Specular,ptin:_Specular,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6,x:33826,y:33155,ptlb:Normal,ptin:_Normal,tex:29faa7048bb4960479dc3f73bd161611,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:7,x:32350,y:32920,ptlb:AOclussion,ptin:_AOclussion,tex:b3fe2e708c008b94d92f5585466cacea,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:8,x:32350,y:33077,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:9,x:32350,y:33158,ptlb:Oclussion Power,ptin:_OclussionPower,glob:False,v1:1;n:type:ShaderForge.SFN_Lerp,id:12,x:33058,y:32650|A-3-RGB,B-14-RGB,T-13-OUT;n:type:ShaderForge.SFN_ValueProperty,id:13,x:33087,y:32509,ptlb:Diffuse Power,ptin:_DiffusePower,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:14,x:33286,y:32551,ptlb:Difuse,ptin:_Difuse,tex:216b168d396e98d44a063a9347467250,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:15,x:33604,y:33213|A-6-RGB,B-16-OUT,T-17-OUT;n:type:ShaderForge.SFN_Vector3,id:16,x:33826,y:33310,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_ValueProperty,id:17,x:33826,y:33429,ptlb:Normal Smooth,ptin:_NormalSmooth,glob:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:22,x:33565,y:33028,ptlb:Specular Level,ptin:_SpecularLevel,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:23,x:33565,y:32683,ptlb:Specular Color,ptin:_SpecularColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:24,x:33338,y:32924|A-23-RGB,B-5-A,C-22-OUT,D-25-OUT;n:type:ShaderForge.SFN_Multiply,id:25,x:32129,y:33097|A-26-OUT,B-27-OUT;n:type:ShaderForge.SFN_Lerp,id:26,x:32129,y:32955|A-8-OUT,B-7-A,T-9-OUT;n:type:ShaderForge.SFN_ValueProperty,id:27,x:32350,y:33228,ptlb:Oclussion Exp,ptin:_OclussionExp,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:28,x:32781,y:33517|A-29-RGB,B-25-OUT,C-30-OUT;n:type:ShaderForge.SFN_AmbientLight,id:29,x:32997,y:33436;n:type:ShaderForge.SFN_ValueProperty,id:30,x:32997,y:33578,ptlb:Scene Ambient,ptin:_SceneAmbient,glob:False,v1:1;n:type:ShaderForge.SFN_Fresnel,id:88,x:33378,y:33390|EXP-115-OUT;n:type:ShaderForge.SFN_Multiply,id:89,x:33198,y:33417|A-88-OUT,B-113-RGB,C-114-OUT,D-25-OUT;n:type:ShaderForge.SFN_Multiply,id:90,x:33023,y:33048|A-25-OUT,B-93-OUT,C-104-RGB;n:type:ShaderForge.SFN_ValueProperty,id:93,x:33212,y:33095,ptlb:Transmisive,ptin:_Transmisive,glob:False,v1:0.4;n:type:ShaderForge.SFN_Color,id:104,x:33212,y:33169,ptlb:Trans Color,ptin:_TransColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:113,x:33379,y:33528,ptlb:Rim Color,ptin:_RimColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:114,x:33379,y:33696,ptlb:Rim Power,ptin:_RimPower,glob:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:115,x:33379,y:33770,ptlb:Rim Fresnel,ptin:_RimFresnel,glob:False,v1:2;n:type:ShaderForge.SFN_SwitchProperty,id:116,x:32914,y:33254,ptlb:Rim Enable,ptin:_RimEnable,on:True|A-117-OUT,B-89-OUT;n:type:ShaderForge.SFN_Vector1,id:117,x:33167,y:33332,v1:0;n:type:ShaderForge.SFN_SwitchProperty,id:123,x:33887,y:32808,ptlb:use GlossMap,ptin:_useGlossMap,on:False|A-125-OUT,B-124-A;n:type:ShaderForge.SFN_Tex2d,id:124,x:34077,y:32692,ptlb:Gloss Map,ptin:_GlossMap,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:125,x:34077,y:32856,v1:1;n:type:ShaderForge.SFN_Multiply,id:126,x:33887,y:32937|A-123-OUT,B-127-OUT;n:type:ShaderForge.SFN_Slider,id:127,x:34040,y:32997,ptlb:Gloss Power,ptin:_GlossPower,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Multiply,id:143,x:32852,y:33120|A-116-OUT,B-113-RGB;proporder:3-14-13-6-17-23-5-22-127-123-124-7-9-27-30-93-104-116-113-114-115;pass:END;sub:END;*/

Shader "ManyWorlds/Bumped/BumpedRimTransAO" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Difuse ("Difuse", 2D) = "white" {}
        _DiffusePower ("Diffuse Power", Float ) = 1
        _Normal ("Normal", 2D) = "bump" {}
        _NormalSmooth ("Normal Smooth", Float ) = 0
        _SpecularColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
        _Specular ("Specular", 2D) = "white" {}
        _SpecularLevel ("Specular Level", Float ) = 1
        _GlossPower ("Gloss Power", Range(0, 1)) = 0.5
        [MaterialToggle] _useGlossMap ("use GlossMap", Float ) = 1
        _GlossMap ("Gloss Map", 2D) = "white" {}
        _AOclussion ("AOclussion", 2D) = "white" {}
        _OclussionPower ("Oclussion Power", Float ) = 1
        _OclussionExp ("Oclussion Exp", Float ) = 1
        _SceneAmbient ("Scene Ambient", Float ) = 1
        _Transmisive ("Transmisive", Float ) = 0.4
        _TransColor ("Trans Color", Color) = (0.5,0.5,0.5,1)
        [MaterialToggle] _RimEnable ("Rim Enable", Float ) = 0
        _RimColor ("Rim Color", Color) = (0.5,0.5,0.5,1)
        _RimPower ("Rim Power", Float ) = 1
        _RimFresnel ("Rim Fresnel", Float ) = 2
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
            uniform float4 _Color;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _AOclussion; uniform float4 _AOclussion_ST;
            uniform float _OclussionPower;
            uniform float _DiffusePower;
            uniform sampler2D _Difuse; uniform float4 _Difuse_ST;
            uniform float _NormalSmooth;
            uniform float _SpecularLevel;
            uniform float4 _SpecularColor;
            uniform float _OclussionExp;
            uniform float _SceneAmbient;
            uniform float _Transmisive;
            uniform float4 _TransColor;
            uniform float4 _RimColor;
            uniform float _RimPower;
            uniform float _RimFresnel;
            uniform fixed _RimEnable;
            uniform fixed _useGlossMap;
            uniform sampler2D _GlossMap; uniform float4 _GlossMap_ST;
            uniform float _GlossPower;
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
                float2 node_165 = i.uv0;
                float3 normalLocal = lerp(UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_165.rg, _Normal))).rgb,float3(0,0,1),_NormalSmooth);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
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
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float node_25 = (lerp(1.0,tex2D(_AOclussion,TRANSFORM_TEX(node_165.rg, _AOclussion)).a,_OclussionPower)*_OclussionExp);
                float3 node_90 = (node_25*_Transmisive*_TransColor.rgb);
                float3 w = node_90*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * node_90;
                #ifndef LIGHTMAP_OFF
                    float3 diffuse = lightmap.rgb;
                #else
                    float3 diffuse = (forwardLight+backLight) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
                #endif
////// Emissive:
                float3 emissive = (lerp( 0.0, (pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimFresnel)*_RimColor.rgb*_RimPower*node_25), _RimEnable )*_RimColor.rgb);
///////// Gloss:
                float gloss = (lerp( 1.0, tex2D(_GlossMap,TRANSFORM_TEX(node_165.rg, _GlossMap)).a, _useGlossMap )*_GlossPower);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = (_SpecularColor.rgb*tex2D(_Specular,TRANSFORM_TEX(node_165.rg, _Specular)).a*_SpecularLevel*node_25);
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
                diffuseLight += (UNITY_LIGHTMODEL_AMBIENT.rgb*node_25*_SceneAmbient); // Diffuse Ambient Light
                finalColor += diffuseLight * (node_25*lerp(_Color.rgb,tex2D(_Difuse,TRANSFORM_TEX(node_165.rg, _Difuse)).rgb,_DiffusePower));
                finalColor += specular;
                finalColor += emissive;
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
            uniform float4 _Color;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _AOclussion; uniform float4 _AOclussion_ST;
            uniform float _OclussionPower;
            uniform float _DiffusePower;
            uniform sampler2D _Difuse; uniform float4 _Difuse_ST;
            uniform float _NormalSmooth;
            uniform float _SpecularLevel;
            uniform float4 _SpecularColor;
            uniform float _OclussionExp;
            uniform float _Transmisive;
            uniform float4 _TransColor;
            uniform float4 _RimColor;
            uniform float _RimPower;
            uniform float _RimFresnel;
            uniform fixed _RimEnable;
            uniform fixed _useGlossMap;
            uniform sampler2D _GlossMap; uniform float4 _GlossMap_ST;
            uniform float _GlossPower;
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
                float2 node_166 = i.uv0;
                float3 normalLocal = lerp(UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_166.rg, _Normal))).rgb,float3(0,0,1),_NormalSmooth);
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float node_25 = (lerp(1.0,tex2D(_AOclussion,TRANSFORM_TEX(node_166.rg, _AOclussion)).a,_OclussionPower)*_OclussionExp);
                float3 node_90 = (node_25*_Transmisive*_TransColor.rgb);
                float3 w = node_90*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 backLight = max(float3(0.0,0.0,0.0), -NdotLWrap + w ) * node_90;
                float3 diffuse = (forwardLight+backLight) * attenColor;
///////// Gloss:
                float gloss = (lerp( 1.0, tex2D(_GlossMap,TRANSFORM_TEX(node_166.rg, _GlossMap)).a, _useGlossMap )*_GlossPower);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = (_SpecularColor.rgb*tex2D(_Specular,TRANSFORM_TEX(node_166.rg, _Specular)).a*_SpecularLevel*node_25);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (node_25*lerp(_Color.rgb,tex2D(_Difuse,TRANSFORM_TEX(node_166.rg, _Difuse)).rgb,_DiffusePower));
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"

}
