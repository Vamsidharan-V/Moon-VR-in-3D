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
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:ManyWorlds/Mobile/Glass,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:True,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:33544,y:32665,varname:node_1,prsc:2|diff-8-OUT,spec-28-OUT,gloss-45-OUT,normal-51-RGB,emission-216-OUT,amdfl-113-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:32951,y:32347,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4697,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8,x:33197,y:32344,varname:node_8,prsc:2|A-2-RGB,B-17-RGB;n:type:ShaderForge.SFN_Color,id:17,x:33021,y:32479,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1457,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:28,x:33152,y:32646,varname:node_28,prsc:2|A-35-RGB,B-29-OUT,C-9590-RGB;n:type:ShaderForge.SFN_Slider,id:29,x:32621,y:32391,ptovrint:False,ptlb:Specular Level,ptin:_SpecularLevel,varname:node_5752,prsc:2,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Tex2d,id:35,x:32751,y:32552,ptovrint:False,ptlb:Specular,ptin:_Specular,varname:node_1893,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:43,x:32636,y:32734,ptovrint:False,ptlb:Shininess,ptin:_Shininess,varname:node_3344,prsc:2,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:45,x:33152,y:32800,varname:node_45,prsc:2|A-35-A,B-43-OUT;n:type:ShaderForge.SFN_Tex2d,id:51,x:32993,y:32871,ptovrint:False,ptlb:Bump Map,ptin:_BumpMap,varname:node_7818,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Fresnel,id:78,x:32652,y:32984,varname:node_78,prsc:2|EXP-102-OUT;n:type:ShaderForge.SFN_Color,id:84,x:32667,y:33144,ptovrint:False,ptlb:Rim Color,ptin:_RimColor,varname:node_3883,prsc:2,glob:False,c1:0.9926471,c2:0.9926471,c3:0.9926471,c4:1;n:type:ShaderForge.SFN_Slider,id:102,x:32375,y:33079,ptovrint:False,ptlb:Rim Level,ptin:_RimLevel,varname:node_8991,prsc:2,min:0,cur:2.805166,max:10;n:type:ShaderForge.SFN_Blend,id:113,x:32873,y:33071,varname:node_113,prsc:2,blmd:1,clmp:True|SRC-78-OUT,DST-84-RGB;n:type:ShaderForge.SFN_Fresnel,id:162,x:32991,y:33462,varname:node_162,prsc:2|EXP-166-OUT;n:type:ShaderForge.SFN_Cubemap,id:163,x:32843,y:33320,ptovrint:False,ptlb:Reflection Cube,ptin:_ReflectionCube,varname:node_9716,prsc:2,cube:a596436b21c6d484bb9b3b6385e3e666,pvfc:0;n:type:ShaderForge.SFN_Color,id:164,x:32667,y:33364,ptovrint:False,ptlb:Color Reflection,ptin:_ColorReflection,varname:node_5942,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:166,x:32565,y:33443,ptovrint:False,ptlb:Reflection Fresnel,ptin:_ReflectionFresnel,varname:node_5906,prsc:2,min:0,cur:2.255639,max:10;n:type:ShaderForge.SFN_Blend,id:185,x:33144,y:33207,varname:node_185,prsc:2,blmd:1,clmp:True|SRC-163-RGB,DST-164-RGB;n:type:ShaderForge.SFN_Multiply,id:216,x:33313,y:33006,varname:node_216,prsc:2|A-162-OUT,B-185-OUT,C-237-OUT,D-35-A;n:type:ShaderForge.SFN_Slider,id:237,x:33280,y:33305,ptovrint:False,ptlb:Reflection Ammount,ptin:_ReflectionAmmount,varname:node_3507,prsc:2,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Color,id:9590,x:33226,y:32494,ptovrint:False,ptlb:Spec Color,ptin:_SpecColor,varname:node_9590,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;proporder:17-2-51-35-29-43-84-102-163-237-164-166-9590;pass:END;sub:END;*/

Shader "ManyWorlds/BumpedRimReflective" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _BumpMap ("Bump Map", 2D) = "bump" {}
        _Specular ("Specular", 2D) = "white" {}
        _SpecularLevel ("Specular Level", Range(0, 10)) = 0
        _Shininess ("Shininess", Range(0, 10)) = 0
        _RimColor ("Rim Color", Color) = (0.9926471,0.9926471,0.9926471,1)
        _RimLevel ("Rim Level", Range(0, 10)) = 2.805166
        _ReflectionCube ("Reflection Cube", Cube) = "_Skybox" {}
        _ReflectionAmmount ("Reflection Ammount", Range(0, 10)) = 1
        _ColorReflection ("Color Reflection", Color) = (0.5,0.5,0.5,1)
        _ReflectionFresnel ("Reflection Fresnel", Range(0, 10)) = 2.255639
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
            uniform float _SpecularLevel;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform float _Shininess;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float4 _RimColor;
            uniform float _RimLevel;
            uniform samplerCUBE _ReflectionCube;
            uniform float4 _ColorReflection;
            uniform float _ReflectionFresnel;
            uniform float _ReflectionAmmount;
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
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 _Specular_var = tex2D(_Specular,TRANSFORM_TEX(i.uv0, _Specular));
                float gloss = (_Specular_var.a*_Shininess);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = (_Specular_var.rgb*_SpecularLevel*_SpecColor.rgb);
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
                indirectDiffuse += saturate((pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimLevel)*_RimColor.rgb)); // Diffuse Ambient Light
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_MainTex_var.rgb*_Color.rgb);
////// Emissive:
                float3 emissive = (pow(1.0-max(0,dot(normalDirection, viewDirection)),_ReflectionFresnel)*saturate((texCUBE(_ReflectionCube,viewReflectDirection).rgb*_ColorReflection.rgb))*_ReflectionAmmount*_Specular_var.a);
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
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Color;
            uniform float _SpecularLevel;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform float _Shininess;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform samplerCUBE _ReflectionCube;
            uniform float4 _ColorReflection;
            uniform float _ReflectionFresnel;
            uniform float _ReflectionAmmount;
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 _Specular_var = tex2D(_Specular,TRANSFORM_TEX(i.uv0, _Specular));
                float gloss = (_Specular_var.a*_Shininess);
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = (_Specular_var.rgb*_SpecularLevel*_SpecColor.rgb);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuse = directDiffuse * (_MainTex_var.rgb*_Color.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "ManyWorlds/Mobile/Glass"

}
