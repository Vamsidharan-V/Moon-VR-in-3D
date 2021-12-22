// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

#warning Upgrade NOTE: unity_Scale shader variable was removed; replaced 'unity_Scale.w' with '1.0'
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_LightmapInd', a built-in variable
// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:True,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:33897,y:32563,varname:node_1,prsc:2|diff-26-OUT,spec-327-OUT,gloss-293-OUT,normal-65-RGB;n:type:ShaderForge.SFN_Tex2d,id:2,x:32708,y:31966,ptovrint:False,ptlb:Diffuse Main,ptin:_DiffuseMain,varname:node_8160,prsc:2,tex:64b9f69352048aa47af2ff83c82cd72a,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Multiply,id:26,x:33222,y:32248,varname:node_26,prsc:2|A-2-RGB,B-49-RGB;n:type:ShaderForge.SFN_Tex2d,id:49,x:32708,y:32158,ptovrint:False,ptlb:Diffuse Detail,ptin:_DiffuseDetail,varname:node_9684,prsc:2,tex:ae62ad679e726574199a02eeb1e68217,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:65,x:33415,y:32831,ptovrint:False,ptlb:Normal Detail,ptin:_NormalDetail,varname:node_9506,prsc:2,tex:1a32c2d1345220f449d351d85d18c1f5,ntxv:3,isnm:True;n:type:ShaderForge.SFN_ValueProperty,id:293,x:33465,y:32683,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_9615,prsc:2,glob:False,v1:0.05;n:type:ShaderForge.SFN_ValueProperty,id:327,x:33187,y:32521,ptovrint:False,ptlb:Specular Intensity,ptin:_SpecularIntensity,varname:node_9088,prsc:2,glob:False,v1:1;proporder:2-49-65-327-293;pass:END;sub:END;*/

Shader "ManyWorlds/Mobile/BumpedDetailSingleBump" {
    Properties {
        _DiffuseMain ("Diffuse Main", 2D) = "black" {}
        _DiffuseDetail ("Diffuse Detail", 2D) = "white" {}
        _NormalDetail ("Normal Detail", 2D) = "bump" {}
        _SpecularIntensity ("Specular Intensity", Float ) = 1
        _Gloss ("Gloss", Float ) = 0.05
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
            #define SHOULD_SAMPLE_SH_PROBE ( defined (LIGHTMAP_OFF) )
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
            uniform sampler2D _DiffuseMain; uniform float4 _DiffuseMain_ST;
            uniform sampler2D _DiffuseDetail; uniform float4 _DiffuseDetail_ST;
            uniform sampler2D _NormalDetail; uniform float4 _NormalDetail_ST;
            uniform float _Gloss;
            uniform float _SpecularIntensity;
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
                #elif SHOULD_SAMPLE_SH_PROBE
                    float3 shLight : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                #if SHOULD_SAMPLE_SH_PROBE
                    o.shLight = ShadeSH9(float4(mul(unity_ObjectToWorld, float4(v.normal,0)).xyz * 1.0,1)) * 0.5;
                #endif
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
                float3 _NormalDetail_var = UnpackNormal(tex2D(_NormalDetail,TRANSFORM_TEX(i.uv0, _NormalDetail)));
                float3 normalLocal = _NormalDetail_var.rgb;
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
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_SpecularIntensity,_SpecularIntensity,_SpecularIntensity);
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
                #if SHOULD_SAMPLE_SH_PROBE
                    indirectDiffuse += i.shLight; // Per-Vertex Light Probes / Spherical harmonics
                #endif
                float4 _DiffuseMain_var = tex2D(_DiffuseMain,TRANSFORM_TEX(i.uv0, _DiffuseMain));
                float4 _DiffuseDetail_var = tex2D(_DiffuseDetail,TRANSFORM_TEX(i.uv0, _DiffuseDetail));
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_DiffuseMain_var.rgb*_DiffuseDetail_var.rgb);
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
            #define SHOULD_SAMPLE_SH_PROBE ( defined (LIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _DiffuseMain; uniform float4 _DiffuseMain_ST;
            uniform sampler2D _DiffuseDetail; uniform float4 _DiffuseDetail_ST;
            uniform sampler2D _NormalDetail; uniform float4 _NormalDetail_ST;
            uniform float _Gloss;
            uniform float _SpecularIntensity;
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
                float3 _NormalDetail_var = UnpackNormal(tex2D(_NormalDetail,TRANSFORM_TEX(i.uv0, _NormalDetail)));
                float3 normalLocal = _NormalDetail_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_SpecularIntensity,_SpecularIntensity,_SpecularIntensity);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _DiffuseMain_var = tex2D(_DiffuseMain,TRANSFORM_TEX(i.uv0, _DiffuseMain));
                float4 _DiffuseDetail_var = tex2D(_DiffuseDetail,TRANSFORM_TEX(i.uv0, _DiffuseDetail));
                float3 diffuse = directDiffuse * (_DiffuseMain_var.rgb*_DiffuseDetail_var.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Bumped Specular"

}
