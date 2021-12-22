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
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:True,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32042,y:32563|diff-451-OUT,spec-328-OUT,gloss-293-OUT,normal-134-OUT,emission-368-OUT,amdfl-462-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33383,y:31997,ptlb:Diffuse Main,ptin:_DiffuseMain,tex:64b9f69352048aa47af2ff83c82cd72a,ntxv:2,isnm:False|UVIN-428-OUT;n:type:ShaderForge.SFN_Tex2d,id:8,x:32860,y:32884,ptlb:Normal Main,ptin:_NormalMain,tex:16df1d59e033c024ea09f9f999461a88,ntxv:3,isnm:True|UVIN-428-OUT;n:type:ShaderForge.SFN_Color,id:25,x:32951,y:32050,ptlb:Color Tint,ptin:_ColorTint,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:26,x:32794,y:32265|A-25-RGB,B-48-OUT;n:type:ShaderForge.SFN_Blend,id:48,x:32997,y:32248,blmd:1,clmp:True|SRC-2-RGB,DST-49-RGB;n:type:ShaderForge.SFN_Tex2d,id:49,x:33346,y:32234,ptlb:Diffuse Detail,ptin:_DiffuseDetail,tex:ae62ad679e726574199a02eeb1e68217,ntxv:0,isnm:False|UVIN-441-OUT;n:type:ShaderForge.SFN_Tex2d,id:65,x:33045,y:32915,ptlb:Normal Detail,ptin:_NormalDetail,tex:1a32c2d1345220f449d351d85d18c1f5,ntxv:3,isnm:True|UVIN-441-OUT;n:type:ShaderForge.SFN_NormalBlend,id:134,x:32686,y:32901|BSE-8-RGB,DTL-65-RGB;n:type:ShaderForge.SFN_Multiply,id:141,x:33687,y:32429|A-299-RGB,B-400-OUT;n:type:ShaderForge.SFN_ValueProperty,id:293,x:32646,y:32765,ptlb:Gloss,ptin:_Gloss,glob:False,v1:0.05;n:type:ShaderForge.SFN_Color,id:299,x:33898,y:32363,ptlb:Specular Tint,ptin:_SpecularTint,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:327,x:33771,y:32593,ptlb:Specular Intensity,ptin:_SpecularIntensity,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:328,x:33018,y:32537|A-477-OUT,B-327-OUT;n:type:ShaderForge.SFN_Fresnel,id:340,x:32936,y:33338|EXP-351-OUT;n:type:ShaderForge.SFN_Slider,id:351,x:33120,y:33425,ptlb:Rim Level,ptin:_RimLevel,min:0,cur:3.609022,max:10;n:type:ShaderForge.SFN_Color,id:367,x:32543,y:33179,ptlb:Rim Color,ptin:_RimColor,glob:False,c1:0.3481293,c2:0.3526756,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:368,x:32423,y:32981|A-411-OUT,B-367-RGB,C-480-OUT;n:type:ShaderForge.SFN_Blend,id:396,x:32471,y:32183,blmd:1,clmp:True|SRC-26-OUT,DST-466-OUT;n:type:ShaderForge.SFN_Multiply,id:400,x:33728,y:32258|A-2-A,B-49-A;n:type:ShaderForge.SFN_Blend,id:403,x:31997,y:32052,blmd:13,clmp:True|SRC-404-OUT,DST-415-RGB;n:type:ShaderForge.SFN_Slider,id:404,x:32115,y:31952,ptlb:AO Strenght,ptin:_AOStrenght,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Blend,id:405,x:33284,y:32480,blmd:0,clmp:True|SRC-141-OUT,DST-403-OUT;n:type:ShaderForge.SFN_Blend,id:411,x:32683,y:33233,blmd:0,clmp:True|SRC-340-OUT,DST-412-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:412,x:31889,y:32518,ptlb:Affect Rim,ptin:_AffectRim,on:True|A-413-OUT,B-403-OUT;n:type:ShaderForge.SFN_Vector1,id:413,x:31957,y:32433,v1:1;n:type:ShaderForge.SFN_Tex2d,id:415,x:32461,y:32004,ptlb:Custom AO,ptin:_CustomAO,tex:8c5a0de67e3e64547bc1200b6deb1a56,ntxv:0,isnm:False|UVIN-428-OUT;n:type:ShaderForge.SFN_Multiply,id:428,x:33854,y:32752|A-429-UVOUT,B-430-OUT;n:type:ShaderForge.SFN_TexCoord,id:429,x:34075,y:32680,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:430,x:34051,y:32879,ptlb:Tiling,ptin:_Tiling,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:441,x:33827,y:32932|A-429-UVOUT,B-443-OUT;n:type:ShaderForge.SFN_ValueProperty,id:443,x:33998,y:33064,ptlb:Tiling_Detail,ptin:_Tiling_Detail,glob:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:451,x:32332,y:32430,ptlb:Affect Difuse,ptin:_AffectDifuse,on:False|A-26-OUT,B-396-OUT;n:type:ShaderForge.SFN_ValueProperty,id:462,x:32695,y:32655,ptlb:Light intensity,ptin:_Lightintensity,glob:False,v1:0;n:type:ShaderForge.SFN_Add,id:466,x:32098,y:32206|A-403-OUT,B-468-RGB;n:type:ShaderForge.SFN_Color,id:468,x:32177,y:32346,ptlb:AO Dif Atenuation,ptin:_AODifAtenuation,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:470,x:34179,y:33007,ptlb:Tiling_copy,ptin:_Tiling_copy,glob:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:472,x:34243,y:33071,ptlb:Tiling_copy_copy,ptin:_Tiling_copy_copy,glob:False,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:477,x:33180,y:32763,ptlb:Affect Specular,ptin:_AffectSpecular,on:False|A-141-OUT,B-405-OUT;n:type:ShaderForge.SFN_ValueProperty,id:480,x:32543,y:33358,ptlb:Rim Power,ptin:_RimPower,glob:False,v1:1;proporder:25-2-8-430-49-65-443-299-327-293-415-451-477-412-468-404-367-351-480-462;pass:END;sub:END;*/

Shader "ManyWorlds/BumpedDetailRimAO" {
    Properties {
        _ColorTint ("Color Tint", Color) = (1,1,1,1)
        _DiffuseMain ("Diffuse Main", 2D) = "black" {}
        _NormalMain ("Normal Main", 2D) = "bump" {}
        _Tiling ("Tiling", Float ) = 1
        _DiffuseDetail ("Diffuse Detail", 2D) = "white" {}
        _NormalDetail ("Normal Detail", 2D) = "bump" {}
        _Tiling_Detail ("Tiling_Detail", Float ) = 1
        _SpecularTint ("Specular Tint", Color) = (1,1,1,1)
        _SpecularIntensity ("Specular Intensity", Float ) = 1
        _Gloss ("Gloss", Float ) = 0.05
        _CustomAO ("Custom AO", 2D) = "white" {}
        [MaterialToggle] _AffectDifuse ("Affect Difuse", Float ) = 1
        [MaterialToggle] _AffectSpecular ("Affect Specular", Float ) = 1
        [MaterialToggle] _AffectRim ("Affect Rim", Float ) = 0
        _AODifAtenuation ("AO Dif Atenuation", Color) = (0.5,0.5,0.5,1)
        _AOStrenght ("AO Strenght", Range(0, 1)) = 0.5
        _RimColor ("Rim Color", Color) = (0.3481293,0.3526756,1,1)
        _RimLevel ("Rim Level", Range(0, 10)) = 3.609022
        _RimPower ("Rim Power", Float ) = 1
        _Lightintensity ("Light intensity", Float ) = 0
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
            uniform sampler2D _NormalDetail; uniform float4 _NormalDetail_ST;
            uniform float _Gloss;
            uniform float4 _SpecularTint;
            uniform float _SpecularIntensity;
            uniform float _RimLevel;
            uniform float4 _RimColor;
            uniform float _AOStrenght;
            uniform fixed _AffectRim;
            uniform sampler2D _CustomAO; uniform float4 _CustomAO_ST;
            uniform float _Tiling;
            uniform float _Tiling_Detail;
            uniform fixed _AffectDifuse;
            uniform float _Lightintensity;
            uniform float4 _AODifAtenuation;
            uniform fixed _AffectSpecular;
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
                float2 node_429 = i.uv0;
                float2 node_428 = (node_429.rg*_Tiling);
                float2 node_441 = (node_429.rg*_Tiling_Detail);
                float3 node_134_nrm_base = UnpackNormal(tex2D(_NormalMain,TRANSFORM_TEX(node_428, _NormalMain))).rgb + float3(0,0,1);
                float3 node_134_nrm_detail = UnpackNormal(tex2D(_NormalDetail,TRANSFORM_TEX(node_441, _NormalDetail))).rgb * float3(-1,-1,1);
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
////// Emissive:
                float3 node_403 = saturate(( _AOStrenght > 0.5 ? (tex2D(_CustomAO,TRANSFORM_TEX(node_428, _CustomAO)).rgb/((1.0-_AOStrenght)*2.0)) : (1.0-(((1.0-tex2D(_CustomAO,TRANSFORM_TEX(node_428, _CustomAO)).rgb)*0.5)/_AOStrenght))));
                float3 emissive = (saturate(min(pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimLevel),lerp( 1.0, node_403, _AffectRim )))*_RimColor.rgb*_RimPower);
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float4 node_2 = tex2D(_DiffuseMain,TRANSFORM_TEX(node_428, _DiffuseMain));
                float4 node_49 = tex2D(_DiffuseDetail,TRANSFORM_TEX(node_441, _DiffuseDetail));
                float3 node_141 = (_SpecularTint.rgb*(node_2.a*node_49.a));
                float3 specularColor = (lerp( node_141, saturate(min(node_141,node_403)), _AffectSpecular )*_SpecularIntensity);
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
                diffuseLight += float3(_Lightintensity,_Lightintensity,_Lightintensity); // Diffuse Ambient Light
                #ifdef LIGHTMAP_OFF
                    diffuseLight += i.shLight; // Per-Vertex Light Probes / Spherical harmonics
                #endif
                float3 node_26 = (_ColorTint.rgb*saturate((node_2.rgb*node_49.rgb)));
                finalColor += diffuseLight * lerp( node_26, saturate((node_26*(node_403+_AODifAtenuation.rgb))), _AffectDifuse );
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
            uniform sampler2D _NormalDetail; uniform float4 _NormalDetail_ST;
            uniform float _Gloss;
            uniform float4 _SpecularTint;
            uniform float _SpecularIntensity;
            uniform float _RimLevel;
            uniform float4 _RimColor;
            uniform float _AOStrenght;
            uniform fixed _AffectRim;
            uniform sampler2D _CustomAO; uniform float4 _CustomAO_ST;
            uniform float _Tiling;
            uniform float _Tiling_Detail;
            uniform fixed _AffectDifuse;
            uniform float4 _AODifAtenuation;
            uniform fixed _AffectSpecular;
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
                float2 node_429 = i.uv0;
                float2 node_428 = (node_429.rg*_Tiling);
                float2 node_441 = (node_429.rg*_Tiling_Detail);
                float3 node_134_nrm_base = UnpackNormal(tex2D(_NormalMain,TRANSFORM_TEX(node_428, _NormalMain))).rgb + float3(0,0,1);
                float3 node_134_nrm_detail = UnpackNormal(tex2D(_NormalDetail,TRANSFORM_TEX(node_441, _NormalDetail))).rgb * float3(-1,-1,1);
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
                float4 node_2 = tex2D(_DiffuseMain,TRANSFORM_TEX(node_428, _DiffuseMain));
                float4 node_49 = tex2D(_DiffuseDetail,TRANSFORM_TEX(node_441, _DiffuseDetail));
                float3 node_141 = (_SpecularTint.rgb*(node_2.a*node_49.a));
                float3 node_403 = saturate(( _AOStrenght > 0.5 ? (tex2D(_CustomAO,TRANSFORM_TEX(node_428, _CustomAO)).rgb/((1.0-_AOStrenght)*2.0)) : (1.0-(((1.0-tex2D(_CustomAO,TRANSFORM_TEX(node_428, _CustomAO)).rgb)*0.5)/_AOStrenght))));
                float3 specularColor = (lerp( node_141, saturate(min(node_141,node_403)), _AffectSpecular )*_SpecularIntensity);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float3 node_26 = (_ColorTint.rgb*saturate((node_2.rgb*node_49.rgb)));
                finalColor += diffuseLight * lerp( node_26, saturate((node_26*(node_403+_AODifAtenuation.rgb))), _AffectDifuse );
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Bumped Specular"

}
