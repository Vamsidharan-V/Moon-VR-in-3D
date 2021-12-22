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
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:Reflective/Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:33599,y:32667,varname:node_1,prsc:2|diff-8-OUT,spec-28-OUT,gloss-43-OUT,normal-51-RGB,amdfl-4926-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33011,y:32337,ptovrint:False,ptlb:Base,ptin:_Base,varname:node_8884,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8,x:33294,y:32412,varname:node_8,prsc:2|A-2-RGB,B-17-RGB;n:type:ShaderForge.SFN_Color,id:17,x:33100,y:32159,ptovrint:False,ptlb:Color Tint,ptin:_ColorTint,varname:node_1006,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:28,x:33261,y:32598,varname:node_28,prsc:2|A-29-OUT,B-2-A;n:type:ShaderForge.SFN_Slider,id:29,x:32641,y:32497,ptovrint:False,ptlb:Specular Level,ptin:_SpecularLevel,varname:node_1674,prsc:2,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Slider,id:43,x:32676,y:32729,ptovrint:False,ptlb:Gloss Level,ptin:_GlossLevel,varname:node_4693,prsc:2,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:51,x:33574,y:32408,ptovrint:False,ptlb:Normal Map,ptin:_NormalMap,varname:node_3765,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Fresnel,id:78,x:32864,y:32889,varname:node_78,prsc:2|EXP-102-OUT;n:type:ShaderForge.SFN_Color,id:84,x:32835,y:33114,ptovrint:False,ptlb:Rim Color,ptin:_RimColor,varname:node_7541,prsc:2,glob:False,c1:0.9926471,c2:0.9926471,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Slider,id:102,x:32468,y:32945,ptovrint:False,ptlb:Rim Level,ptin:_RimLevel,varname:node_3326,prsc:2,min:0,cur:2.805166,max:10;n:type:ShaderForge.SFN_Multiply,id:4926,x:33073,y:32871,varname:node_4926,prsc:2|A-78-OUT,B-84-RGB;proporder:2-17-29-43-51-84-102;pass:END;sub:END;*/

Shader "ManyWorlds/Mobile/BumpedRim" {
    Properties {
        _Base ("Base", 2D) = "white" {}
        _ColorTint ("Color Tint", Color) = (0.5,0.5,0.5,1)
        _SpecularLevel ("Specular Level", Range(0, 10)) = 0
        _GlossLevel ("Gloss Level", Range(0, 1)) = 0
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _RimColor ("Rim Color", Color) = (0.9926471,0.9926471,0.9926471,1)
        _RimLevel ("Rim Level", Range(0, 10)) = 2.805166
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
            uniform sampler2D _Base; uniform float4 _Base_ST;
            uniform float4 _ColorTint;
            uniform float _SpecularLevel;
            uniform float _GlossLevel;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float4 _RimColor;
            uniform float _RimLevel;
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
                float gloss = _GlossLevel;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 _Base_var = tex2D(_Base,TRANSFORM_TEX(i.uv0, _Base));
                float node_28 = (_SpecularLevel*_Base_var.a);
                float3 specularColor = float3(node_28,node_28,node_28);
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
                float node_78 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimLevel);
                indirectDiffuse += (node_78*_RimColor.rgb); // Diffuse Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Base_var.rgb*_ColorTint.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
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
            uniform sampler2D _Base; uniform float4 _Base_ST;
            uniform float4 _ColorTint;
            uniform float _SpecularLevel;
            uniform float _GlossLevel;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
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
                float gloss = _GlossLevel;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 _Base_var = tex2D(_Base,TRANSFORM_TEX(i.uv0, _Base));
                float node_28 = (_SpecularLevel*_Base_var.a);
                float3 specularColor = float3(node_28,node_28,node_28);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
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
