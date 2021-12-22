// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

#warning Upgrade NOTE: unity_Scale shader variable was removed; replaced 'unity_Scale.w' with '1.0'
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_LightmapInd', a built-in variable
// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:True,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32042,y:32563|diff-26-OUT,spec-328-OUT,gloss-293-OUT,normal-8-RGB,emission-583-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33383,y:31997,ptlb:Diffuse Main,ptin:_DiffuseMain,tex:64b9f69352048aa47af2ff83c82cd72a,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8,x:32774,y:32705,ptlb:Normal Main,ptin:_NormalMain,tex:16df1d59e033c024ea09f9f999461a88,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Color,id:25,x:33071,y:32068,ptlb:Color Tint,ptin:_ColorTint,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:26,x:32704,y:32205|A-25-RGB,B-48-OUT;n:type:ShaderForge.SFN_Blend,id:48,x:33017,y:32338,blmd:1,clmp:True|SRC-2-RGB,DST-49-RGB;n:type:ShaderForge.SFN_Tex2d,id:49,x:33327,y:32235,ptlb:Diffuse Detail,ptin:_DiffuseDetail,tex:ae62ad679e726574199a02eeb1e68217,ntxv:0,isnm:False|UVIN-441-OUT;n:type:ShaderForge.SFN_ValueProperty,id:293,x:32745,y:32508,ptlb:Gloss,ptin:_Gloss,glob:False,v1:0.05;n:type:ShaderForge.SFN_ValueProperty,id:327,x:33323,y:32753,ptlb:Specular Intensity,ptin:_SpecularIntensity,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:328,x:32940,y:32601|A-400-OUT,B-327-OUT;n:type:ShaderForge.SFN_Multiply,id:400,x:33603,y:32470|A-2-A,B-49-A;n:type:ShaderForge.SFN_TexCoord,id:429,x:33901,y:32878,uv:0;n:type:ShaderForge.SFN_Multiply,id:441,x:33583,y:32794|A-429-UVOUT,B-443-OUT;n:type:ShaderForge.SFN_ValueProperty,id:443,x:33881,y:33106,ptlb:Tiling_Detail,ptin:_Tiling_Detail,glob:False,v1:1;n:type:ShaderForge.SFN_Fresnel,id:580,x:32849,y:32954|EXP-581-OUT;n:type:ShaderForge.SFN_ValueProperty,id:581,x:33039,y:33040,ptlb:Rim Level,ptin:_RimLevel,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:582,x:32837,y:33106,ptlb:Rim Color,ptin:_RimColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:583,x:32508,y:32949|A-400-OUT,B-580-OUT,C-582-RGB,D-584-OUT;n:type:ShaderForge.SFN_ValueProperty,id:584,x:32627,y:33207,ptlb:Rim Power,ptin:_RimPower,glob:False,v1:1;proporder:25-2-8-49-443-327-293-581-582-584;pass:END;sub:END;*/

Shader "ManyWorlds/Mobile/BumpedDetail" {
    Properties {
        _ColorTint ("Color Tint", Color) = (1,1,1,1)
        _DiffuseMain ("Diffuse Main", 2D) = "black" {}
        _NormalMain ("Normal Main", 2D) = "bump" {}
        _DiffuseDetail ("Diffuse Detail", 2D) = "white" {}
        _Tiling_Detail ("Tiling_Detail", Float ) = 1
        _SpecularIntensity ("Specular Intensity", Float ) = 1
        _Gloss ("Gloss", Float ) = 0.05
        _RimLevel ("Rim Level", Float ) = 1
        _RimColor ("Rim Color", Color) = (0.5,0.5,0.5,1)
        _RimPower ("Rim Power", Float ) = 1
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
            uniform sampler2D _DiffuseMain; uniform float4 _DiffuseMain_ST;
            uniform sampler2D _NormalMain; uniform float4 _NormalMain_ST;
            uniform float4 _ColorTint;
            uniform sampler2D _DiffuseDetail; uniform float4 _DiffuseDetail_ST;
            uniform float _Gloss;
            uniform float _SpecularIntensity;
            uniform float _Tiling_Detail;
            uniform float _RimLevel;
            uniform float4 _RimColor;
            uniform float _RimPower;
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
                #else
                    float3 shLight : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                #ifdef LIGHTMAP_OFF
                    o.shLight = ShadeSH9(float4(mul(unity_ObjectToWorld, float4(v.normal,0)).xyz * 1.0,1)) * 0.5;
                #endif
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
                float2 node_588 = i.uv0;
                float3 node_8 = UnpackNormal(tex2D(_NormalMain,TRANSFORM_TEX(node_588.rg, _NormalMain)));
                float3 normalLocal = node_8.rgb;
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
                #ifndef LIGHTMAP_OFF
                    float3 diffuse = lightmap.rgb;
                #else
                    float3 diffuse = max( 0.0, NdotL) * attenColor;
                #endif
////// Emissive:
                float4 node_2 = tex2D(_DiffuseMain,TRANSFORM_TEX(node_588.rg, _DiffuseMain));
                float2 node_429 = i.uv0;
                float2 node_441 = (node_429.rg*_Tiling_Detail);
                float4 node_49 = tex2D(_DiffuseDetail,TRANSFORM_TEX(node_441, _DiffuseDetail));
                float node_400 = (node_2.a*node_49.a);
                float3 emissive = (node_400*pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimLevel)*_RimColor.rgb*_RimPower);
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_328 = (node_400*_SpecularIntensity);
                float3 specularColor = float3(node_328,node_328,node_328);
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
                #ifdef LIGHTMAP_OFF
                    diffuseLight += i.shLight; // Per-Vertex Light Probes / Spherical harmonics
                #endif
                float3 node_26 = (_ColorTint.rgb*saturate((node_2.rgb*node_49.rgb)));
                finalColor += diffuseLight * node_26;
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
            uniform sampler2D _DiffuseMain; uniform float4 _DiffuseMain_ST;
            uniform sampler2D _NormalMain; uniform float4 _NormalMain_ST;
            uniform float4 _ColorTint;
            uniform sampler2D _DiffuseDetail; uniform float4 _DiffuseDetail_ST;
            uniform float _Gloss;
            uniform float _SpecularIntensity;
            uniform float _Tiling_Detail;
            uniform float _RimLevel;
            uniform float4 _RimColor;
            uniform float _RimPower;
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
                float2 node_589 = i.uv0;
                float3 node_8 = UnpackNormal(tex2D(_NormalMain,TRANSFORM_TEX(node_589.rg, _NormalMain)));
                float3 normalLocal = node_8.rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float4 node_2 = tex2D(_DiffuseMain,TRANSFORM_TEX(node_589.rg, _DiffuseMain));
                float2 node_429 = i.uv0;
                float2 node_441 = (node_429.rg*_Tiling_Detail);
                float4 node_49 = tex2D(_DiffuseDetail,TRANSFORM_TEX(node_441, _DiffuseDetail));
                float node_400 = (node_2.a*node_49.a);
                float node_328 = (node_400*_SpecularIntensity);
                float3 specularColor = float3(node_328,node_328,node_328);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float3 node_26 = (_ColorTint.rgb*saturate((node_2.rgb*node_49.rgb)));
                finalColor += diffuseLight * node_26;
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Bumped Specular"

}
