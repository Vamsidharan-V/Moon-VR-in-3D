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
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:0,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:2,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:0,x:34414,y:32442,varname:node_0,prsc:2|diff-8969-OUT,spec-75-OUT,gloss-76-OUT,normal-215-OUT,emission-7368-OUT,alpha-5071-OUT;n:type:ShaderForge.SFN_Tex2d,id:25,x:33737,y:32566,ptovrint:False,ptlb:Bump Map,ptin:_BumpMap,varname:_Refraction,prsc:2,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True|UVIN-27-OUT;n:type:ShaderForge.SFN_TexCoord,id:26,x:33379,y:32505,varname:node_26,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:27,x:33550,y:32566,varname:node_27,prsc:2|A-26-UVOUT,B-28-OUT;n:type:ShaderForge.SFN_Vector1,id:28,x:33379,y:32662,varname:node_28,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:75,x:34145,y:32430,varname:node_75,prsc:2,v1:6;n:type:ShaderForge.SFN_Vector1,id:76,x:34145,y:32486,varname:node_76,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Lerp,id:215,x:33975,y:32524,varname:node_215,prsc:2|A-216-OUT,B-25-RGB,T-8179-OUT;n:type:ShaderForge.SFN_Vector3,id:216,x:33737,y:32445,varname:node_216,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Fresnel,id:217,x:33819,y:32314,varname:node_217,prsc:2|EXP-2993-OUT;n:type:ShaderForge.SFN_Multiply,id:8969,x:34300,y:32265,varname:node_8969,prsc:2|A-932-RGB,B-1235-OUT;n:type:ShaderForge.SFN_Color,id:932,x:34060,y:32124,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_932,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:7368,x:34130,y:32981,varname:node_7368,prsc:2|A-574-OUT,B-7952-RGB,C-932-RGB,D-6232-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2993,x:33615,y:32327,ptovrint:False,ptlb:Fresnel Level,ptin:_FresnelLevel,varname:node_2993,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_Cubemap,id:7952,x:33845,y:32970,ptovrint:False,ptlb:Reflection,ptin:_Reflection,varname:node_7952,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:574,x:33924,y:33185,ptovrint:False,ptlb:Reflection level,ptin:_Reflectionlevel,varname:node_574,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:524,x:34159,y:32559,varname:node_524,prsc:2|A-932-A,B-1235-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1411,x:33839,y:32207,ptovrint:False,ptlb:Rim Power,ptin:_RimPower,varname:node_1411,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:9390,x:33975,y:32292,varname:node_9390,prsc:2|A-1411-OUT,B-217-OUT;n:type:ShaderForge.SFN_OneMinus,id:6232,x:34031,y:32842,varname:node_6232,prsc:2|IN-1235-OUT;n:type:ShaderForge.SFN_Clamp01,id:1235,x:34134,y:32292,varname:node_1235,prsc:2|IN-9390-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2603,x:34186,y:32753,varname:node_2603,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-215-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7866,x:33490,y:32794,ptovrint:False,ptlb:Refraction Intensity,ptin:_RefractionIntensity,varname:node_7866,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:449,x:33732,y:33415,ptovrint:False,ptlb:node_257_copy,ptin:_node_257_copy,varname:_node_257_copy,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:5040,x:33514,y:32873,varname:node_5040,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Multiply,id:8179,x:33677,y:32809,varname:node_8179,prsc:2|A-7866-OUT,B-5040-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5071,x:34043,y:32711,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_5071,prsc:2,glob:False,v1:0.3;proporder:25-932-7952-574-2993-1411-7866-5071;pass:END;sub:END;*/

Shader "ManyWorlds/Mobile/Glass" {
    Properties {
        _BumpMap ("Bump Map", 2D) = "bump" {}
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Reflection ("Reflection", Cube) = "_Skybox" {}
        _Reflectionlevel ("Reflection level", Float ) = 1
        _FresnelLevel ("Fresnel Level", Float ) = 3
        _RimPower ("Rim Power", Float ) = 1
        _RefractionIntensity ("Refraction Intensity", Float ) = 1
        _Opacity ("Opacity", Float ) = 0.3
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
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles xbox360 ps3 flash 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float4 _Color;
            uniform float _FresnelLevel;
            uniform samplerCUBE _Reflection;
            uniform float _Reflectionlevel;
            uniform float _RimPower;
            uniform float _RefractionIntensity;
            uniform float _Opacity;
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
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_27 = (i.uv0*1.0);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(node_27, _BumpMap)));
                float3 node_215 = lerp(float3(0,0,1),_BumpMap_var.rgb,(_RefractionIntensity*0.01));
                float3 normalLocal = node_215;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
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
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.8;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_75 = 6.0;
                float3 specularColor = float3(node_75,node_75,node_75);
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
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 indirectDiffuse = float3(0,0,0);
                #ifndef LIGHTMAP_OFF
                    float3 directDiffuse = float3(0,0,0);
                #else
                    float3 directDiffuse = max( 0.0, NdotL) * attenColor;
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
                float node_1235 = saturate((_RimPower*pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelLevel)));
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Color.rgb*node_1235);
////// Emissive:
                float3 emissive = (_Reflectionlevel*texCUBE(_Reflection,viewReflectDirection).rgb*_Color.rgb*(1.0 - node_1235));
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                return fixed4(finalColor,_Opacity);
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
            #pragma exclude_renderers gles xbox360 ps3 flash 
            #pragma target 3.0
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float4 _Color;
            uniform float _FresnelLevel;
            uniform samplerCUBE _Reflection;
            uniform float _Reflectionlevel;
            uniform float _RimPower;
            uniform float _RefractionIntensity;
            uniform float _Opacity;
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
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_27 = (i.uv0*1.0);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(node_27, _BumpMap)));
                float3 node_215 = lerp(float3(0,0,1),_BumpMap_var.rgb,(_RefractionIntensity*0.01));
                float3 normalLocal = node_215;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.8;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_75 = 6.0;
                float3 specularColor = float3(node_75,node_75,node_75);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float node_1235 = saturate((_RimPower*pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelLevel)));
                float3 diffuse = directDiffuse * (_Color.rgb*node_1235);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * _Opacity,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"

}
