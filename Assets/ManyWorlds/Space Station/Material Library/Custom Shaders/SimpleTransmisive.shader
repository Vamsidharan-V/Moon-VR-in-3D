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
/*SF_DATA;ver:0.34;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32447,y:33022|diff-22-OUT,spec-2-OUT,gloss-36-OUT,lwrap-61-OUT;n:type:ShaderForge.SFN_Multiply,id:2,x:33206,y:32856|A-16-A,B-29-OUT,C-30-RGB;n:type:ShaderForge.SFN_Multiply,id:3,x:33189,y:32653|A-5-RGB,B-16-RGB;n:type:ShaderForge.SFN_Color,id:5,x:33396,y:32520,ptlb:Color,ptin:_Color,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:16,x:33430,y:32688,ptlb:Texture,ptin:_Texture,tex:88f50d34757baaf4ab367d979385b639,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:22,x:33007,y:32665|A-5-RGB,B-3-OUT,T-23-OUT;n:type:ShaderForge.SFN_Slider,id:23,x:33045,y:32555,ptlb:Diffuse Power,ptin:_DiffusePower,min:0,cur:1,max:2;n:type:ShaderForge.SFN_ValueProperty,id:29,x:33387,y:32904,ptlb:Specular level,ptin:_Specularlevel,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:30,x:33387,y:32975,ptlb:Specular Color,ptin:_SpecularColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:36,x:32928,y:32815,ptlb:Gloss,ptin:_Gloss,min:0,cur:0.6,max:1;n:type:ShaderForge.SFN_Fresnel,id:42,x:33167,y:33376|EXP-44-OUT;n:type:ShaderForge.SFN_Color,id:43,x:33004,y:33219,ptlb:SS Color,ptin:_SSColor,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:44,x:33167,y:33516,ptlb:Fresnel,ptin:_Fresnel,glob:False,v1:2;n:type:ShaderForge.SFN_SwitchProperty,id:47,x:33004,y:33387,ptlb:Invert Fresnel,ptin:_InvertFresnel,on:False|A-42-OUT,B-50-OUT;n:type:ShaderForge.SFN_RemapRange,id:50,x:33004,y:33533,frmn:0,frmx:1,tomn:1,tomx:0|IN-42-OUT;n:type:ShaderForge.SFN_Multiply,id:61,x:32825,y:33372|A-43-RGB,B-47-OUT,C-72-OUT;n:type:ShaderForge.SFN_ValueProperty,id:72,x:32825,y:33532,ptlb:SS Level,ptin:_SSLevel,glob:False,v1:1;proporder:5-16-23-29-30-36-44-47-43-72;pass:END;sub:END;*/

Shader "ManyWorlds/Basic/SimpleSS" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Texture ("Texture", 2D) = "white" {}
        _DiffusePower ("Diffuse Power", Range(0, 2)) = 1
        _Specularlevel ("Specular level", Float ) = 1
        _SpecularColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
        _Gloss ("Gloss", Range(0, 1)) = 0.6
        _Fresnel ("Fresnel", Float ) = 2
        [MaterialToggle] _InvertFresnel ("Invert Fresnel", Float ) = 0
        _SSColor ("SS Color", Color) = (0.5,0.5,0.5,1)
        _SSLevel ("SS Level", Float ) = 1
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _DiffusePower;
            uniform float _Specularlevel;
            uniform float4 _SpecularColor;
            uniform float _Gloss;
            uniform float4 _SSColor;
            uniform float _Fresnel;
            uniform fixed _InvertFresnel;
            uniform float _SSLevel;
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
                float3 normalDirection =  i.normalDir;
                #ifndef LIGHTMAP_OFF
                    float4 lmtex = UNITY_SAMPLE_TEX2D(unity_Lightmap,i.uvLM);
                    #ifndef DIRLIGHTMAP_OFF
                        float3 lightmap = DecodeLightmap(lmtex);
                        float3 scalePerBasisVector = DecodeLightmap(UNITY_SAMPLE_TEX2D_SAMPLER(unity_LightmapInd,unity_Lightmap,i.uvLM));
                        UNITY_DIRBASIS
                        half3 normalInRnmBasis = saturate (mul (unity_DirBasis, float3(0,0,1)));
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
                float node_42 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnel);
                float3 w = (_SSColor.rgb*lerp( node_42, (node_42*-1.0+1.0), _InvertFresnel )*_SSLevel)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                #ifndef LIGHTMAP_OFF
                    float3 diffuse = lightmap.rgb;
                #else
                    float3 diffuse = forwardLight * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
                #endif
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float2 node_85 = i.uv0;
                float4 node_16 = tex2D(_Texture,TRANSFORM_TEX(node_85.rg, _Texture));
                float3 specularColor = (node_16.a*_Specularlevel*_SpecularColor.rgb);
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
                finalColor += diffuseLight * lerp(_Color.rgb,(_Color.rgb*node_16.rgb),_DiffusePower);
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
            uniform float4 _Color;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _DiffusePower;
            uniform float _Specularlevel;
            uniform float4 _SpecularColor;
            uniform float _Gloss;
            uniform float4 _SSColor;
            uniform float _Fresnel;
            uniform fixed _InvertFresnel;
            uniform float _SSLevel;
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
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float node_42 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnel);
                float3 w = (_SSColor.rgb*lerp( node_42, (node_42*-1.0+1.0), _InvertFresnel )*_SSLevel)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 diffuse = forwardLight * attenColor;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float2 node_86 = i.uv0;
                float4 node_16 = tex2D(_Texture,TRANSFORM_TEX(node_86.rg, _Texture));
                float3 specularColor = (node_16.a*_Specularlevel*_SpecularColor.rgb);
                float3 specular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * lerp(_Color.rgb,(_Color.rgb*node_16.rgb),_DiffusePower);
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"

}
