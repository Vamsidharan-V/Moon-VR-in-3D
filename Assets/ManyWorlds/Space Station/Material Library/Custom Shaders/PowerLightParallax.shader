// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:False,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:748,x:32719,y:32711,varname:node_748,prsc:2|diff-5708-OUT,normal-3287-RGB,emission-1367-OUT,transm-8452-A,voffset-4020-OUT;n:type:ShaderForge.SFN_Color,id:9626,x:32143,y:32694,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_9626,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:4673,x:32286,y:32890,varname:node_4673,prsc:2|A-9626-RGB,B-4066-OUT,C-8452-A,D-3872-OUT,E-2941-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4066,x:32259,y:33079,ptovrint:False,ptlb:EmissionLM,ptin:_EmissionLM,varname:node_4066,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:5708,x:32457,y:32627,varname:node_5708,prsc:2|A-8452-RGB,B-9626-RGB;n:type:ShaderForge.SFN_Tex2d,id:3418,x:33604,y:33287,ptovrint:False,ptlb:node_257,ptin:_node_257,varname:node_3610,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9181,x:33668,y:33351,ptovrint:False,ptlb:node_257_copy,ptin:_node_257_copy,varname:_node_257_copy,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:9879,x:32271,y:33135,varname:node_9879,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:8452,x:32182,y:32496,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8452,prsc:2,ntxv:0,isnm:False|UVIN-6777-UVOUT;n:type:ShaderForge.SFN_Time,id:2171,x:31256,y:32813,varname:node_2171,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:2200,x:31382,y:32429,varname:node_2200,prsc:2,uv:0;n:type:ShaderForge.SFN_Parallax,id:6777,x:31949,y:32382,varname:node_6777,prsc:2|UVIN-3299-OUT,HEI-7139-A,DEP-7139-R;n:type:ShaderForge.SFN_Tex2d,id:7139,x:31636,y:32618,ptovrint:False,ptlb:Turbulence,ptin:_Turbulence,varname:node_7139,prsc:2,ntxv:0,isnm:False|UVIN-8113-OUT;n:type:ShaderForge.SFN_Add,id:8113,x:31299,y:32613,varname:node_8113,prsc:2|A-2200-UVOUT,B-2171-TSL;n:type:ShaderForge.SFN_Blend,id:704,x:31705,y:32349,varname:node_704,prsc:2,blmd:1,clmp:True|SRC-4481-OUT,DST-9926-OUT;n:type:ShaderForge.SFN_Multiply,id:3299,x:31770,y:32201,varname:node_3299,prsc:2|A-3872-OUT,B-704-OUT;n:type:ShaderForge.SFN_Fresnel,id:3872,x:31505,y:32092,varname:node_3872,prsc:2|EXP-8587-OUT;n:type:ShaderForge.SFN_ViewPosition,id:2964,x:30887,y:32315,varname:node_2964,prsc:2;n:type:ShaderForge.SFN_Transform,id:3599,x:31273,y:32310,varname:node_3599,prsc:2,tffrom:0,tfto:1|IN-2964-XYZ;n:type:ShaderForge.SFN_ComponentMask,id:4481,x:31466,y:32280,varname:node_4481,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-3599-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:7572,x:30793,y:32513,varname:node_7572,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:9926,x:31106,y:32526,varname:node_9926,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-7572-XYZ;n:type:ShaderForge.SFN_ValueProperty,id:289,x:31041,y:32118,ptovrint:False,ptlb:Fresnel Power,ptin:_FresnelPower,varname:node_289,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Sin,id:1085,x:31467,y:32813,varname:node_1085,prsc:2|IN-2171-T;n:type:ShaderForge.SFN_RemapRange,id:2941,x:31650,y:32813,varname:node_2941,prsc:2,frmn:-1,frmx:1,tomn:0.5,tomx:1.5|IN-1085-OUT;n:type:ShaderForge.SFN_Multiply,id:4020,x:32359,y:33225,varname:node_4020,prsc:2|A-7139-A,B-4896-OUT,C-6706-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4896,x:32026,y:33338,ptovrint:False,ptlb:offset Power,ptin:_offsetPower,varname:node_4896,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_NormalVector,id:6706,x:32116,y:33470,prsc:2,pt:False;n:type:ShaderForge.SFN_Add,id:8587,x:31273,y:32118,varname:node_8587,prsc:2|A-289-OUT,B-2941-OUT;n:type:ShaderForge.SFN_Append,id:4315,x:31073,y:32352,varname:node_4315,prsc:2|A-7572-Z,B-7572-Y,C-7572-X;n:type:ShaderForge.SFN_Clamp,id:1367,x:32483,y:32911,varname:node_1367,prsc:2|IN-4673-OUT,MIN-9879-OUT,MAX-4066-OUT;n:type:ShaderForge.SFN_Tex2d,id:3287,x:31892,y:32992,ptovrint:False,ptlb:Bump Map,ptin:_BumpMap,varname:node_3287,prsc:2,ntxv:3,isnm:True|UVIN-8113-OUT;proporder:9626-4066-8452-7139-289-4896-3287;pass:END;sub:END;*/

Shader "ManyWorlds/Self-Illumin/PowerLightEnergy" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _EmissionLM ("EmissionLM", Float ) = 1
        _MainTex ("MainTex", 2D) = "white" {}
        _Turbulence ("Turbulence", 2D) = "white" {}
        _FresnelPower ("Fresnel Power", Float ) = 4
        _offsetPower ("offset Power", Float ) = 0
        _BumpMap ("Bump Map", 2D) = "bump" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform float _EmissionLM;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Turbulence; uniform float4 _Turbulence_ST;
            uniform float _FresnelPower;
            uniform float _offsetPower;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_2171 = _Time + _TimeEditor;
                float2 node_8113 = (o.uv0+node_2171.r);
                float4 _Turbulence_var = tex2Dlod(_Turbulence,float4(TRANSFORM_TEX(node_8113, _Turbulence),0.0,0));
                v.vertex.xyz += (_Turbulence_var.a*_offsetPower*v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_2171 = _Time + _TimeEditor;
                float2 node_8113 = (i.uv0+node_2171.r);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(node_8113, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
////// Lighting:
////// Emissive:
                float node_2941 = (sin(node_2171.g)*0.5+1.0);
                float node_3872 = pow(1.0-max(0,dot(normalDirection, viewDirection)),(_FresnelPower+node_2941));
                float4 _Turbulence_var = tex2D(_Turbulence,TRANSFORM_TEX(node_8113, _Turbulence));
                float2 node_6777 = (_Turbulence_var.r*(_Turbulence_var.a - 0.5)*mul(tangentTransform, viewDirection).xy + (node_3872*saturate((mul( unity_WorldToObject, float4(_WorldSpaceCameraPos,0) ).xyz.rgb.rg*i.posWorld.rgb.r))));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_6777.rg, _MainTex));
                float3 emissive = clamp((_Color.rgb*_EmissionLM*_MainTex_var.a*node_3872*node_2941),0.0,_EmissionLM);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCollector"
            Tags {
                "LightMode"="ShadowCollector"
            }
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _Turbulence; uniform float4 _Turbulence_ST;
            uniform float _offsetPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_COLLECTOR;
                float2 uv0 : TEXCOORD5;
                float3 normalDir : TEXCOORD6;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                float4 node_2171 = _Time + _TimeEditor;
                float2 node_8113 = (o.uv0+node_2171.r);
                float4 _Turbulence_var = tex2Dlod(_Turbulence,float4(TRANSFORM_TEX(node_8113, _Turbulence),0.0,0));
                v.vertex.xyz += (_Turbulence_var.a*_offsetPower*v.normal);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                SHADOW_COLLECTOR_FRAGMENT(i)
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Cull Off
            Offset 1, 1
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _Turbulence; uniform float4 _Turbulence_ST;
            uniform float _offsetPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                float4 node_2171 = _Time + _TimeEditor;
                float2 node_8113 = (o.uv0+node_2171.r);
                float4 _Turbulence_var = tex2Dlod(_Turbulence,float4(TRANSFORM_TEX(node_8113, _Turbulence),0.0,0));
                v.vertex.xyz += (_Turbulence_var.a*_offsetPower*v.normal);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"

}
