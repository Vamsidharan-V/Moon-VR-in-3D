// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

#warning Upgrade NOTE: unity_Scale shader variable was removed; replaced 'unity_Scale.w' with '1.0'
// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_LightmapInd', a built-in variable
// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D
// Upgrade NOTE: replaced tex2D unity_LightmapInd with UNITY_SAMPLE_TEX2D_SAMPLER

// Shader created with Shader Forge Beta 0.34 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:True,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32678,y:32735|diff-26-OUT,spec-328-OUT,gloss-293-OUT,normal-134-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33289,y:32249,ptlb:Diffuse Main,ptin:_DiffuseMain,tex:64b9f69352048aa47af2ff83c82cd72a,ntxv:2,isnm:False|UVIN-157-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8,x:33099,y:33220,ptlb:Normal Main,ptin:_NormalMain,tex:16df1d59e033c024ea09f9f999461a88,ntxv:3,isnm:True|UVIN-157-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:14,x:34118,y:32462,ptlb:Specular,ptin:_Specular,tex:8c5a0de67e3e64547bc1200b6deb1a56,ntxv:0,isnm:False|UVIN-157-UVOUT;n:type:ShaderForge.SFN_Color,id:25,x:32943,y:32305,ptlb:Color Tint,ptin:_ColorTint,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:26,x:32943,y:32475|A-25-RGB,B-48-OUT;n:type:ShaderForge.SFN_Blend,id:48,x:33125,y:32393,blmd:3,clmp:True|SRC-2-RGB,DST-49-RGB;n:type:ShaderForge.SFN_Tex2d,id:49,x:33277,y:32471,ptlb:Diffuse Detail,ptin:_DiffuseDetail,tex:5a8fa2ae31374584baaca3618c8e08ba,ntxv:0,isnm:False|UVIN-157-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:65,x:33351,y:33144,ptlb:Normal Detail,ptin:_NormalDetail,tex:1a32c2d1345220f449d351d85d18c1f5,ntxv:3,isnm:True|UVIN-157-UVOUT;n:type:ShaderForge.SFN_NormalBlend,id:134,x:32934,y:33006|BSE-8-RGB,DTL-65-RGB;n:type:ShaderForge.SFN_Multiply,id:141,x:33894,y:32320|A-299-RGB,B-14-RGB;n:type:ShaderForge.SFN_Parallax,id:157,x:33201,y:32847|UVIN-158-OUT,HEI-160-A,DEP-269-OUT;n:type:ShaderForge.SFN_Multiply,id:158,x:33615,y:32963|A-167-UVOUT,B-168-OUT;n:type:ShaderForge.SFN_Tex2d,id:160,x:33771,y:32653,ptlb:HeightMap,ptin:_HeightMap,tex:8c5a0de67e3e64547bc1200b6deb1a56,ntxv:0,isnm:False|UVIN-158-OUT;n:type:ShaderForge.SFN_TexCoord,id:167,x:33785,y:32896,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:168,x:33794,y:33091,ptlb:Tiling,ptin:_Tiling,glob:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:269,x:33422,y:32952,ptlb:Height value,ptin:_Heightvalue,glob:False,v1:0.05;n:type:ShaderForge.SFN_ValueProperty,id:293,x:32988,y:32654,ptlb:Gloss,ptin:_Gloss,glob:False,v1:0.05;n:type:ShaderForge.SFN_Color,id:299,x:34118,y:32265,ptlb:Specular Tint,ptin:_SpecularTint,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:327,x:33903,y:32530,ptlb:Specular Intensity,ptin:_SpecularIntensity,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:328,x:33736,y:32401|A-141-OUT,B-327-OUT;proporder:8-14-25-49-65-2-160-168-269-293-299-327;pass:END;sub:END;*/

Shader "ManyWorlds/ParallaxDetail" {
    Properties {
        _NormalMain ("Normal Main", 2D) = "bump" {}
        _Specular ("Specular", 2D) = "white" {}
        _ColorTint ("Color Tint", Color) = (1,1,1,1)
        _DiffuseDetail ("Diffuse Detail", 2D) = "white" {}
        _NormalDetail ("Normal Detail", 2D) = "bump" {}
        _DiffuseMain ("Diffuse Main", 2D) = "black" {}
        _HeightMap ("HeightMap", 2D) = "white" {}
        _Tiling ("Tiling", Float ) = 1
        _Heightvalue ("Height value", Float ) = 0.05
        _Gloss ("Gloss", Float ) = 0.05
        _SpecularTint ("Specular Tint", Color) = (1,1,1,1)
        _SpecularIntensity ("Specular Intensity", Float ) = 1
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
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform float4 _ColorTint;
            uniform sampler2D _DiffuseDetail; uniform float4 _DiffuseDetail_ST;
            uniform sampler2D _NormalDetail; uniform float4 _NormalDetail_ST;
            uniform sampler2D _HeightMap; uniform float4 _HeightMap_ST;
            uniform float _Tiling;
            uniform float _Heightvalue;
            uniform float _Gloss;
            uniform float4 _SpecularTint;
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
                float2 node_158 = (i.uv0.rg*_Tiling);
                float2 node_157 = (_Heightvalue*(tex2D(_HeightMap,TRANSFORM_TEX(node_158, _HeightMap)).a - 0.5)*mul(tangentTransform, viewDirection).xy + node_158);
                float3 node_134_nrm_base = UnpackNormal(tex2D(_NormalMain,TRANSFORM_TEX(node_157.rg, _NormalMain))).rgb + float3(0,0,1);
                float3 node_134_nrm_detail = UnpackNormal(tex2D(_NormalDetail,TRANSFORM_TEX(node_157.rg, _NormalDetail))).rgb * float3(-1,-1,1);
                float3 node_134_nrm_combined = node_134_nrm_base*dot(node_134_nrm_base, node_134_nrm_detail)/node_134_nrm_base.z - node_134_nrm_detail;
                float3 node_134 = node_134_nrm_combined;
                float3 normalLocal = node_134;
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
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = ((_SpecularTint.rgb*tex2D(_Specular,TRANSFORM_TEX(node_157.rg, _Specular)).rgb)*_SpecularIntensity);
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
                finalColor += diffuseLight * (_ColorTint.rgb*saturate((tex2D(_DiffuseMain,TRANSFORM_TEX(node_157.rg, _DiffuseMain)).rgb+tex2D(_DiffuseDetail,TRANSFORM_TEX(node_157.rg, _DiffuseDetail)).rgb-1.0)));
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
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform float4 _ColorTint;
            uniform sampler2D _DiffuseDetail; uniform float4 _DiffuseDetail_ST;
            uniform sampler2D _NormalDetail; uniform float4 _NormalDetail_ST;
            uniform sampler2D _HeightMap; uniform float4 _HeightMap_ST;
            uniform float _Tiling;
            uniform float _Heightvalue;
            uniform float _Gloss;
            uniform float4 _SpecularTint;
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
                float2 node_158 = (i.uv0.rg*_Tiling);
                float2 node_157 = (_Heightvalue*(tex2D(_HeightMap,TRANSFORM_TEX(node_158, _HeightMap)).a - 0.5)*mul(tangentTransform, viewDirection).xy + node_158);
                float3 node_134_nrm_base = UnpackNormal(tex2D(_NormalMain,TRANSFORM_TEX(node_157.rg, _NormalMain))).rgb + float3(0,0,1);
                float3 node_134_nrm_detail = UnpackNormal(tex2D(_NormalDetail,TRANSFORM_TEX(node_157.rg, _NormalDetail))).rgb * float3(-1,-1,1);
                float3 node_134_nrm_combined = node_134_nrm_base*dot(node_134_nrm_base, node_134_nrm_detail)/node_134_nrm_base.z - node_134_nrm_detail;
                float3 node_134 = node_134_nrm_combined;
                float3 normalLocal = node_134;
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
                float3 specularColor = ((_SpecularTint.rgb*tex2D(_Specular,TRANSFORM_TEX(node_157.rg, _Specular)).rgb)*_SpecularIntensity);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * (_ColorTint.rgb*saturate((tex2D(_DiffuseMain,TRANSFORM_TEX(node_157.rg, _DiffuseMain)).rgb+tex2D(_DiffuseDetail,TRANSFORM_TEX(node_157.rg, _DiffuseDetail)).rgb-1.0)));
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Bumped Specular"

}
