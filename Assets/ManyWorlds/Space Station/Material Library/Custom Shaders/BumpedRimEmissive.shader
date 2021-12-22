// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_LightmapInd', a built-in variable
// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:Reflective/Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:33082,y:32620,varname:node_1,prsc:2|diff-8-OUT,spec-28-OUT,gloss-45-OUT,normal-51-RGB,emission-249-OUT,transm-123-OUT,amdfl-113-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:32087,y:32372,ptovrint:False,ptlb:Base,ptin:_Base,varname:node_1440,prsc:2,ntxv:0,isnm:False|UVIN-320-OUT;n:type:ShaderForge.SFN_Multiply,id:8,x:32333,y:32344,varname:node_8,prsc:2|A-2-RGB,B-17-RGB;n:type:ShaderForge.SFN_Color,id:17,x:32087,y:32569,ptovrint:False,ptlb:Color Tint,ptin:_ColorTint,varname:node_9064,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:28,x:32347,y:32562,varname:node_28,prsc:2|A-35-RGB,B-29-OUT;n:type:ShaderForge.SFN_Slider,id:29,x:31757,y:32391,ptovrint:False,ptlb:Specular Level,ptin:_SpecularLevel,varname:node_3106,prsc:2,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Tex2d,id:35,x:31914,y:32539,ptovrint:False,ptlb:Specular (RGB) Gloss (A),ptin:_SpecularRGBGlossA,varname:node_7105,prsc:2,ntxv:0,isnm:False|UVIN-320-OUT;n:type:ShaderForge.SFN_Slider,id:43,x:31788,y:32871,ptovrint:False,ptlb:Gloss Level,ptin:_GlossLevel,varname:node_5989,prsc:2,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:45,x:32279,y:32743,varname:node_45,prsc:2|A-7760-OUT,B-43-OUT;n:type:ShaderForge.SFN_Tex2d,id:51,x:32129,y:32871,ptovrint:False,ptlb:Normal Map,ptin:_NormalMap,varname:node_2638,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Fresnel,id:78,x:31788,y:32984,varname:node_78,prsc:2|EXP-102-OUT;n:type:ShaderForge.SFN_Color,id:84,x:31803,y:33144,ptovrint:False,ptlb:Rim Color,ptin:_RimColor,varname:node_9771,prsc:2,glob:False,c1:0.9926471,c2:0.9926471,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Slider,id:102,x:31511,y:33079,ptovrint:False,ptlb:Rim Level,ptin:_RimLevel,varname:node_9843,prsc:2,min:0,cur:2.805166,max:10;n:type:ShaderForge.SFN_Blend,id:113,x:32009,y:33071,varname:node_113,prsc:2,blmd:1,clmp:True|SRC-78-OUT,DST-84-RGB;n:type:ShaderForge.SFN_Blend,id:123,x:32478,y:33112,varname:node_123,prsc:2,blmd:10,clmp:True|SRC-124-RGB,DST-125-OUT;n:type:ShaderForge.SFN_Color,id:124,x:32279,y:33037,ptovrint:False,ptlb:Transmission Color,ptin:_TransmissionColor,varname:node_2831,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Fresnel,id:125,x:32277,y:33234,varname:node_125,prsc:2|EXP-176-OUT;n:type:ShaderForge.SFN_NormalVector,id:153,x:32117,y:33131,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:176,x:32020,y:33352,ptovrint:False,ptlb:Transmission Fresnel,ptin:_TransmissionFresnel,varname:node_2508,prsc:2,min:0,cur:0.06429847,max:1;n:type:ShaderForge.SFN_Tex2d,id:187,x:32522,y:33278,ptovrint:False,ptlb:Emissive Map,ptin:_EmissiveMap,varname:node_9736,prsc:2,ntxv:0,isnm:False|UVIN-320-OUT;n:type:ShaderForge.SFN_Blend,id:188,x:33081,y:33153,varname:node_188,prsc:2,blmd:3,clmp:True|SRC-206-OUT,DST-189-OUT;n:type:ShaderForge.SFN_Slider,id:189,x:33012,y:33370,ptovrint:False,ptlb:Emissive Power,ptin:_EmissivePower,varname:node_9483,prsc:2,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Color,id:205,x:32311,y:33625,ptovrint:False,ptlb:Emissive Color,ptin:_EmissiveColor,varname:node_653,prsc:2,glob:False,c1:0.8088235,c2:0.8088235,c3:0.8088235,c4:1;n:type:ShaderForge.SFN_Multiply,id:206,x:32596,y:33606,varname:node_206,prsc:2|A-218-OUT,B-205-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:218,x:32874,y:33827,ptovrint:False,ptlb:Inverse,ptin:_Inverse,varname:node_3699,prsc:2,on:False|A-187-RGB,B-238-OUT;n:type:ShaderForge.SFN_OneMinus,id:238,x:32913,y:33621,varname:node_238,prsc:2|IN-187-RGB;n:type:ShaderForge.SFN_Multiply,id:249,x:33464,y:33341,varname:node_249,prsc:2|A-188-OUT,B-251-OUT;n:type:ShaderForge.SFN_Slider,id:251,x:33228,y:33513,ptovrint:False,ptlb:Emission Multiply,ptin:_EmissionMultiply,varname:node_4858,prsc:2,min:0,cur:1,max:4;n:type:ShaderForge.SFN_Sin,id:263,x:33462,y:33833,varname:node_263,prsc:2|IN-296-OUT;n:type:ShaderForge.SFN_Pi,id:264,x:33182,y:33780,varname:node_264,prsc:2;n:type:ShaderForge.SFN_Time,id:281,x:33076,y:33976,varname:node_281,prsc:2;n:type:ShaderForge.SFN_Multiply,id:282,x:33642,y:33843,varname:node_282,prsc:2|A-263-OUT,B-303-OUT;n:type:ShaderForge.SFN_Panner,id:283,x:33642,y:33655,varname:node_283,prsc:2,spu:1,spv:1|DIST-282-OUT;n:type:ShaderForge.SFN_Multiply,id:296,x:33270,y:33899,varname:node_296,prsc:2|A-264-OUT,B-281-T;n:type:ShaderForge.SFN_ValueProperty,id:303,x:33401,y:34081,ptovrint:False,ptlb:Move Intensity,ptin:_MoveIntensity,varname:node_7677,prsc:2,glob:False,v1:0.01;n:type:ShaderForge.SFN_SwitchProperty,id:320,x:32311,y:33439,ptovrint:False,ptlb:Movement,ptin:_Movement,varname:node_8851,prsc:2,on:False|A-321-UVOUT,B-283-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:321,x:32077,y:33497,varname:node_321,prsc:2,uv:0;n:type:ShaderForge.SFN_SwitchProperty,id:7760,x:32095,y:32725,ptovrint:False,ptlb:CustomGloss,ptin:_CustomGloss,varname:node_7760,prsc:2,on:False|A-35-A,B-6744-A;n:type:ShaderForge.SFN_Tex2d,id:6744,x:31825,y:32728,ptovrint:False,ptlb:Gloss Cust,ptin:_GlossCust,varname:node_6744,prsc:2,ntxv:0,isnm:False|UVIN-320-OUT;proporder:17-2-51-29-35-7760-6744-43-84-102-124-176-187-218-189-251-205-320-303;pass:END;sub:END;*/

Shader "ManyWorlds/Bumped/BumpedRimEmissive" {
    Properties {
        _ColorTint ("Color Tint", Color) = (0.5,0.5,0.5,1)
        _Base ("Base", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _SpecularLevel ("Specular Level", Range(0, 10)) = 0
        _SpecularRGBGlossA ("Specular (RGB) Gloss (A)", 2D) = "white" {}
        [MaterialToggle] _CustomGloss ("CustomGloss", Float ) = 1
        _GlossCust ("Gloss Cust", 2D) = "white" {}
        _GlossLevel ("Gloss Level", Range(0, 1)) = 0
        _RimColor ("Rim Color", Color) = (0.9926471,0.9926471,0.9926471,1)
        _RimLevel ("Rim Level", Range(0, 10)) = 2.805166
        _TransmissionColor ("Transmission Color", Color) = (0.5,0.5,0.5,1)
        _TransmissionFresnel ("Transmission Fresnel", Range(0, 1)) = 0.06429847
        _EmissiveMap ("Emissive Map", 2D) = "white" {}
        [MaterialToggle] _Inverse ("Inverse", Float ) = 1
        _EmissivePower ("Emissive Power", Range(0, 2)) = 1
        _EmissionMultiply ("Emission Multiply", Range(0, 4)) = 1
        _EmissiveColor ("Emissive Color", Color) = (0.8088235,0.8088235,0.8088235,1)
        [MaterialToggle] _Movement ("Movement", Float ) = 0
        _MoveIntensity ("Move Intensity", Float ) = 0.01
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
            uniform float4 _TimeEditor;
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
            uniform float4 _TransmissionColor;
            uniform float _TransmissionFresnel;
            uniform sampler2D _EmissiveMap; uniform float4 _EmissiveMap_ST;
            uniform float _EmissivePower;
            uniform float4 _EmissiveColor;
            uniform fixed _Inverse;
            uniform float _EmissionMultiply;
            uniform float _MoveIntensity;
            uniform fixed _Movement;
            uniform fixed _CustomGloss;
            uniform sampler2D _GlossCust; uniform float4 _GlossCust_ST;
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
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
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
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
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
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 node_281 = _Time + _TimeEditor;
                float2 _Movement_var = lerp( i.uv0, (i.uv0+(sin((3.141592654*node_281.g))*_MoveIntensity)*float2(1,1)), _Movement );
                float4 _SpecularRGBGlossA_var = tex2D(_SpecularRGBGlossA,TRANSFORM_TEX(_Movement_var, _SpecularRGBGlossA));
                float4 _GlossCust_var = tex2D(_GlossCust,TRANSFORM_TEX(_Movement_var, _GlossCust));
                float gloss = (lerp( _SpecularRGBGlossA_var.a, _GlossCust_var.a, _CustomGloss )*_GlossLevel);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = (_SpecularRGBGlossA_var.rgb*_SpecularLevel);
                #if !defined(LIGHTMAP_OFF) && defined(DIRLIGHTMAP_OFF)
                    float3 directSpecular = float3(0,0,0);
                #else
                    float3 directSpecular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                #endif
                float3 specular = directSpecular * specularColor;
                #ifndef LIGHTMAP_OFF
                    #ifndef DIRLIGHTMAP_OFF
                        specular *= lightmap;
                    #else
                        specular *= (floor(attenuation) * _LightColor0.xyz);
                    #endif
                #else
                    specular *= (floor(attenuation) * _LightColor0.xyz);
                #endif
/////// Diffuse:
                NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float3 backLight = max(0.0, -NdotL ) * saturate(( pow(1.0-max(0,dot(normalDirection, viewDirection)),_TransmissionFresnel) > 0.5 ? (1.0-(1.0-2.0*(pow(1.0-max(0,dot(normalDirection, viewDirection)),_TransmissionFresnel)-0.5))*(1.0-_TransmissionColor.rgb)) : (2.0*pow(1.0-max(0,dot(normalDirection, viewDirection)),_TransmissionFresnel)*_TransmissionColor.rgb) ));
                float3 indirectDiffuse = float3(0,0,0);
                #ifndef LIGHTMAP_OFF
                    float3 directDiffuse = float3(0,0,0);
                #else
                    float3 directDiffuse = (forwardLight+backLight) * attenColor;
                #endif
                #ifndef LIGHTMAP_OFF
                    #ifdef SHADOWS_SCREEN
                        #if (defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)) && defined(SHADER_API_MOBILE)
                            directDiffuse += min(lightmap.rgb, attenuation);
                        #else
                            directDiffuse += max(min(lightmap.rgb,attenuation*lmtex.rgb), lightmap.rgb*attenuation*0.5);
                        #endif
                    #else
                        directDiffuse += lightmap.rgb;
                    #endif
                #endif
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += saturate((pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimLevel)*_RimColor.rgb)); // Diffuse Ambient Light
                float4 _Base_var = tex2D(_Base,TRANSFORM_TEX(_Movement_var, _Base));
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Base_var.rgb*_ColorTint.rgb);
////// Emissive:
                float4 _EmissiveMap_var = tex2D(_EmissiveMap,TRANSFORM_TEX(_Movement_var, _EmissiveMap));
                float3 emissive = (saturate(((lerp( _EmissiveMap_var.rgb, (1.0 - _EmissiveMap_var.rgb), _Inverse )*_EmissiveColor.rgb)+_EmissivePower-1.0))*_EmissionMultiply);
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
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
            uniform float4 _TimeEditor;
            uniform sampler2D _Base; uniform float4 _Base_ST;
            uniform float4 _ColorTint;
            uniform float _SpecularLevel;
            uniform sampler2D _SpecularRGBGlossA; uniform float4 _SpecularRGBGlossA_ST;
            uniform float _GlossLevel;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float4 _TransmissionColor;
            uniform float _TransmissionFresnel;
            uniform sampler2D _EmissiveMap; uniform float4 _EmissiveMap_ST;
            uniform float _EmissivePower;
            uniform float4 _EmissiveColor;
            uniform fixed _Inverse;
            uniform float _EmissionMultiply;
            uniform float _MoveIntensity;
            uniform fixed _Movement;
            uniform fixed _CustomGloss;
            uniform sampler2D _GlossCust; uniform float4 _GlossCust_ST;
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
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 node_281 = _Time + _TimeEditor;
                float2 _Movement_var = lerp( i.uv0, (i.uv0+(sin((3.141592654*node_281.g))*_MoveIntensity)*float2(1,1)), _Movement );
                float4 _SpecularRGBGlossA_var = tex2D(_SpecularRGBGlossA,TRANSFORM_TEX(_Movement_var, _SpecularRGBGlossA));
                float4 _GlossCust_var = tex2D(_GlossCust,TRANSFORM_TEX(_Movement_var, _GlossCust));
                float gloss = (lerp( _SpecularRGBGlossA_var.a, _GlossCust_var.a, _CustomGloss )*_GlossLevel);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = (_SpecularRGBGlossA_var.rgb*_SpecularLevel);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float3 backLight = max(0.0, -NdotL ) * saturate(( pow(1.0-max(0,dot(normalDirection, viewDirection)),_TransmissionFresnel) > 0.5 ? (1.0-(1.0-2.0*(pow(1.0-max(0,dot(normalDirection, viewDirection)),_TransmissionFresnel)-0.5))*(1.0-_TransmissionColor.rgb)) : (2.0*pow(1.0-max(0,dot(normalDirection, viewDirection)),_TransmissionFresnel)*_TransmissionColor.rgb) ));
                float3 directDiffuse = (forwardLight+backLight) * attenColor;
                float4 _Base_var = tex2D(_Base,TRANSFORM_TEX(_Movement_var, _Base));
                float3 diffuse = directDiffuse * (_Base_var.rgb*_ColorTint.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Reflective/Bumped Specular"

}
