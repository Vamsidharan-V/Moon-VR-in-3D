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
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:3,uamb:True,mssp:True,lmpd:True,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:True,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:0,x:33620,y:32843,varname:node_0,prsc:2|diff-4518-OUT,spec-393-OUT,gloss-146-OUT,normal-123-RGB,amspl-162-OUT;n:type:ShaderForge.SFN_Tex2d,id:123,x:33183,y:33122,ptovrint:False,ptlb:BumpMap,ptin:_BumpMap,varname:_Normal,prsc:2,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:138,x:32804,y:32643,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_Diffuse,prsc:2,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:144,x:32384,y:33104,ptovrint:False,ptlb:Shininess,ptin:_Shininess,varname:_Gloss,prsc:2,min:0,cur:0.3675219,max:1;n:type:ShaderForge.SFN_Slider,id:145,x:32918,y:32798,ptovrint:False,ptlb:Specular,ptin:_Specular,varname:_Specular,prsc:2,min:0,cur:0.3076933,max:1;n:type:ShaderForge.SFN_Multiply,id:146,x:33183,y:32945,varname:node_146,prsc:2|A-147-OUT,B-144-OUT;n:type:ShaderForge.SFN_Power,id:147,x:33011,y:32882,varname:node_147,prsc:2|VAL-138-R,EXP-148-OUT;n:type:ShaderForge.SFN_Vector1,id:148,x:32826,y:32916,varname:node_148,prsc:2,v1:2;n:type:ShaderForge.SFN_Cubemap,id:156,x:32993,y:33373,ptovrint:False,ptlb:Specular IBL,ptin:_SpecularIBL,varname:_SpecularIBL,prsc:2,cube:f466cf7415226e046b096197eb7341aa,pvfc:0|MIP-176-OUT;n:type:ShaderForge.SFN_Multiply,id:162,x:33183,y:33373,cmnt:RGBM Decode,varname:node_162,prsc:2|A-156-RGB,B-156-A,C-7319-OUT;n:type:ShaderForge.SFN_RemapRange,id:176,x:32815,y:33373,varname:node_176,prsc:2,frmn:0,frmx:1,tomn:6,tomx:0|IN-144-OUT;n:type:ShaderForge.SFN_Multiply,id:4518,x:33344,y:32717,varname:node_4518,prsc:2|A-2015-RGB,B-138-RGB;n:type:ShaderForge.SFN_Color,id:2015,x:33224,y:32563,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_2015,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:7319,x:33054,y:33609,ptovrint:False,ptlb:Specular IBL Power,ptin:_SpecularIBLPower,varname:node_7319,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Multiply,id:393,x:33373,y:32856,varname:node_393,prsc:2|A-109-RGB,B-145-OUT;n:type:ShaderForge.SFN_Color,id:109,x:33075,y:32653,ptovrint:False,ptlb:SpecColor,ptin:_SpecColor,varname:node_109,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:2015-138-123-144-145-156-7319-109;pass:END;sub:END;*/

Shader "ManyWorlds/IBLShader" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _BumpMap ("BumpMap", 2D) = "bump" {}
        _Shininess ("Shininess", Range(0, 1)) = 0.3675219
        _Specular ("Specular", Range(0, 1)) = 0.3076933
        _SpecularIBL ("Specular IBL", Cube) = "_Skybox" {}
        _SpecularIBLPower ("Specular IBL Power", Float ) = 4
        _SpecColor ("SpecColor", Color) = (0.5,0.5,0.5,1)
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
            #pragma exclude_renderers gles xbox360 ps3 flash 
            #pragma target 3.0
            #pragma glsl
            #ifndef LIGHTMAP_OFF
                // float4 unity_LightmapST;
                // sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    // sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Shininess;
            uniform float _Specular;
            uniform samplerCUBE _SpecularIBL;
            uniform float4 _Color;
            uniform float _SpecularIBLPower;
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
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
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
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float gloss = (pow(_MainTex_var.r,2.0)*_Shininess);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 _SpecularIBL_var = texCUBElod(_SpecularIBL,float4(viewReflectDirection,(_Shininess*-6.0+6.0)));
                float3 specularColor = (_SpecColor.rgb*_Specular);
                float specularMonochrome = dot(specularColor,float3(0.3,0.59,0.11));
                float HdotL = max(0.0,dot(halfDirection,lightDirection));
                float3 fresnelTerm = specularColor + ( 1.0 - specularColor ) * pow((1.0 - HdotL),5);
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float3 fresnelTermAmb = specularColor + ( 1.0 - specularColor ) * ( pow((1.0 - NdotV),5) / (4-3*gloss) );
                float alpha = 1.0 / ( sqrt( (Pi/4.0) * specPow + Pi/2.0 ) );
                float visTerm = ( NdotL * ( 1.0 - alpha ) + alpha ) * ( NdotV * ( 1.0 - alpha ) + alpha );
                visTerm = 1.0 / visTerm;
                float normTerm = (specPow + 8.0 ) / (8.0 * Pi);
                #if !defined(LIGHTMAP_OFF) && defined(DIRLIGHTMAP_OFF)
                    float3 directSpecular = float3(0,0,0);
                #else
                    float3 directSpecular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow)*fresnelTerm*visTerm*normTerm;
                #endif
                float3 indirectSpecular = (0 + (_SpecularIBL_var.rgb*_SpecularIBL_var.a*_SpecularIBLPower)) * fresnelTermAmb;
                float3 specular = (directSpecular + indirectSpecular) * specularColor;
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
                    float3 directDiffuse = max( 0.0, NdotL)*InvPi * attenColor;
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
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb*2; // Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Color.rgb*_MainTex_var.rgb);
                diffuse *= 1-specularMonochrome;
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
            #pragma exclude_renderers gles xbox360 ps3 flash 
            #pragma target 3.0
            #pragma glsl
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Shininess;
            uniform float _Specular;
            uniform float4 _Color;
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
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float gloss = (pow(_MainTex_var.r,2.0)*_Shininess);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = (_SpecColor.rgb*_Specular);
                float specularMonochrome = dot(specularColor,float3(0.3,0.59,0.11));
                float HdotL = max(0.0,dot(halfDirection,lightDirection));
                float3 fresnelTerm = specularColor + ( 1.0 - specularColor ) * pow((1.0 - HdotL),5);
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float alpha = 1.0 / ( sqrt( (Pi/4.0) * specPow + Pi/2.0 ) );
                float visTerm = ( NdotL * ( 1.0 - alpha ) + alpha ) * ( NdotV * ( 1.0 - alpha ) + alpha );
                visTerm = 1.0 / visTerm;
                float normTerm = (specPow + 8.0 ) / (8.0 * Pi);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*fresnelTerm*visTerm*normTerm;
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL)*InvPi * attenColor;
                float3 diffuse = directDiffuse * (_Color.rgb*_MainTex_var.rgb);
                diffuse *= 1-specularMonochrome;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"

}
