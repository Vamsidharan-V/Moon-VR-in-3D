// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:False,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:33664,y:32774,varname:node_1,prsc:2|diff-2-OUT,spec-18-OUT,gloss-25-OUT,normal-103-OUT,emission-7262-OUT,amdfl-47-OUT,difocc-5-OUT;n:type:ShaderForge.SFN_Multiply,id:2,x:33305,y:32399,varname:node_2,prsc:2|A-12-RGB,B-5-OUT,C-11-RGB;n:type:ShaderForge.SFN_Multiply,id:3,x:34034,y:32759,varname:node_3,prsc:2|A-4-OUT,B-7-OUT;n:type:ShaderForge.SFN_Lerp,id:4,x:34034,y:32893,varname:node_4,prsc:2|A-10-OUT,B-8-A,T-9-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:5,x:34034,y:32545,ptovrint:False,ptlb:AO Active,ptin:_AOActive,varname:node_8362,prsc:2,on:False|A-6-OUT,B-230-OUT;n:type:ShaderForge.SFN_Vector1,id:6,x:33705,y:32608,varname:node_6,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:7,x:33867,y:32793,ptovrint:False,ptlb:AO Multiplier,ptin:_AOMultiplier,varname:node_2179,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:8,x:34034,y:33041,ptovrint:False,ptlb:AO Map (Alpha),ptin:_AOMapAlpha,varname:node_4987,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:9,x:33867,y:32996,ptovrint:False,ptlb:AO Burn,ptin:_AOBurn,varname:node_730,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:10,x:33705,y:32548,varname:node_10,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:11,x:33075,y:32296,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_7264,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:12,x:33075,y:32456,ptovrint:False,ptlb:Base,ptin:_Base,varname:node_4590,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:13,x:32998,y:32668,ptovrint:False,ptlb:Specular Custom Map,ptin:_SpecularCustomMap,varname:node_5339,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:14,x:33150,y:32668,ptovrint:False,ptlb:Custom Specular,ptin:_CustomSpecular,varname:node_1377,prsc:2,on:False|A-12-A,B-13-A;n:type:ShaderForge.SFN_Lerp,id:15,x:33325,y:32632,varname:node_15,prsc:2|A-10-OUT,B-14-OUT,T-17-OUT;n:type:ShaderForge.SFN_ValueProperty,id:17,x:33150,y:32830,ptovrint:False,ptlb:Spec Power,ptin:_SpecPower,varname:node_1174,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:18,x:33378,y:32784,varname:node_18,prsc:2|A-15-OUT,B-5-OUT,C-19-OUT,D-124-RGB;n:type:ShaderForge.SFN_ValueProperty,id:19,x:33150,y:32903,ptovrint:False,ptlb:Spec Burn,ptin:_SpecBurn,varname:node_5005,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:20,x:32840,y:32871,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_7270,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:21,x:33016,y:32988,varname:node_21,prsc:2|A-20-A,B-24-OUT;n:type:ShaderForge.SFN_Slider,id:24,x:32762,y:33067,ptovrint:False,ptlb:Shininess,ptin:_Shininess,varname:node_8300,prsc:2,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:25,x:33173,y:32998,ptovrint:False,ptlb:Use Gloss Map,ptin:_UseGlossMap,varname:node_88,prsc:2,on:False|A-24-OUT,B-21-OUT;n:type:ShaderForge.SFN_Fresnel,id:41,x:33446,y:33357,varname:node_41,prsc:2|EXP-45-OUT;n:type:ShaderForge.SFN_AmbientLight,id:42,x:33637,y:33508,varname:node_42,prsc:2;n:type:ShaderForge.SFN_SwitchProperty,id:43,x:33811,y:33437,ptovrint:False,ptlb:Custom Ambient,ptin:_CustomAmbient,varname:node_4116,prsc:2,on:False|A-42-RGB,B-44-OUT;n:type:ShaderForge.SFN_Multiply,id:44,x:33637,y:33357,varname:node_44,prsc:2|A-48-OUT,B-51-RGB,C-247-A;n:type:ShaderForge.SFN_ValueProperty,id:45,x:33278,y:33374,ptovrint:False,ptlb:Rim Fresnel,ptin:_RimFresnel,varname:node_3270,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:46,x:33797,y:33607,ptovrint:False,ptlb:Ambient Power,ptin:_AmbientPower,varname:node_8968,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:47,x:33967,y:33462,varname:node_47,prsc:2|A-43-OUT,B-46-OUT,C-5-OUT;n:type:ShaderForge.SFN_Multiply,id:48,x:33446,y:33219,varname:node_48,prsc:2|A-50-OUT,B-41-OUT;n:type:ShaderForge.SFN_ValueProperty,id:50,x:33278,y:33451,ptovrint:False,ptlb:Rim Power,ptin:_RimPower,varname:node_4137,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:51,x:33446,y:33508,ptovrint:False,ptlb:Rim Color,ptin:_RimColor,varname:node_5794,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:64,x:32813,y:33406,ptovrint:False,ptlb:Reflection Mask,ptin:_ReflectionMask,varname:node_191,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Cubemap,id:65,x:32622,y:33394,ptovrint:False,ptlb:Reflection,ptin:_Reflection,varname:node_5832,prsc:2,cube:a596436b21c6d484bb9b3b6385e3e666,pvfc:0;n:type:ShaderForge.SFN_Fresnel,id:66,x:32788,y:33571,varname:node_66,prsc:2|EXP-67-OUT;n:type:ShaderForge.SFN_ValueProperty,id:67,x:32606,y:33594,ptovrint:False,ptlb:Ref Fresnel Rim,ptin:_RefFresnelRim,varname:node_9924,prsc:2,glob:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:68,x:32606,y:33676,ptovrint:False,ptlb:Ref Fresnel Power,ptin:_RefFresnelPower,varname:node_2979,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:69,x:32951,y:33571,varname:node_69,prsc:2|A-66-OUT,B-68-OUT;n:type:ShaderForge.SFN_Multiply,id:70,x:33015,y:33438,varname:node_70,prsc:2|A-65-RGB,B-69-OUT,C-64-A,D-71-OUT,E-77-RGB;n:type:ShaderForge.SFN_ValueProperty,id:71,x:32971,y:33366,ptovrint:False,ptlb:Reflection Power,ptin:_ReflectionPower,varname:node_4003,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:77,x:32937,y:33750,ptovrint:False,ptlb:Reflection Color,ptin:_ReflectionColor,varname:node_5736,prsc:2,glob:False,c1:0.6029412,c2:0.7699797,c3:1,c4:1;n:type:ShaderForge.SFN_NormalVector,id:95,x:32205,y:32751,prsc:2,pt:True;n:type:ShaderForge.SFN_Lerp,id:103,x:32637,y:32495,varname:node_103,prsc:2|A-104-RGB,B-105-OUT,T-106-OUT;n:type:ShaderForge.SFN_Tex2d,id:104,x:32406,y:32317,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_7127,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector3,id:105,x:32406,y:32495,varname:node_105,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Slider,id:106,x:32249,y:32615,ptovrint:False,ptlb:Normal Burn,ptin:_NormalBurn,varname:node_3112,prsc:2,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:124,x:32608,y:32715,ptovrint:False,ptlb:Specular Color,ptin:_SpecularColor,varname:node_4360,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Max,id:229,x:34405,y:32834,varname:node_229,prsc:2|A-3-OUT,B-10-OUT;n:type:ShaderForge.SFN_Min,id:230,x:34405,y:32698,varname:node_230,prsc:2|A-229-OUT,B-6-OUT;n:type:ShaderForge.SFN_Tex2d,id:247,x:33516,y:33716,ptovrint:False,ptlb:Rim Mask,ptin:_RimMask,varname:node_7062,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:319,x:32485,y:32644,varname:node_319,prsc:2|A-103-OUT,B-95-OUT;n:type:ShaderForge.SFN_Add,id:7262,x:33177,y:33196,varname:node_7262,prsc:2|A-2462-OUT,B-70-OUT;n:type:ShaderForge.SFN_Multiply,id:2462,x:32539,y:33186,varname:node_2462,prsc:2|A-3608-A,B-4984-OUT;n:type:ShaderForge.SFN_Tex2d,id:3608,x:32170,y:33174,ptovrint:False,ptlb:Illum,ptin:_Illum,varname:node_3608,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:4984,x:32152,y:33363,ptovrint:False,ptlb:EmissionLM,ptin:_EmissionLM,varname:node_4984,prsc:2,glob:False,v1:0;proporder:11-12-104-106-124-17-19-14-13-24-25-20-5-8-7-9-71-77-65-64-67-68-46-43-45-50-51-247-3608-4984;pass:END;sub:END;*/

Shader "ManyWorlds/CompleteComplex" {
    Properties {
        _MainColor ("Main Color", Color) = (1,1,1,1)
        _Base ("Base", 2D) = "white" {}
        _Normal ("Normal", 2D) = "bump" {}
        _NormalBurn ("Normal Burn", Range(-1, 1)) = 0
        _SpecularColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
        _SpecPower ("Spec Power", Float ) = 1
        _SpecBurn ("Spec Burn", Float ) = 1
        [MaterialToggle] _CustomSpecular ("Custom Specular", Float ) = 1
        _SpecularCustomMap ("Specular Custom Map", 2D) = "white" {}
        _Shininess ("Shininess", Range(0, 1)) = 0.5
        [MaterialToggle] _UseGlossMap ("Use Gloss Map", Float ) = 0.5
        _Gloss ("Gloss", 2D) = "white" {}
        [MaterialToggle] _AOActive ("AO Active", Float ) = 1
        _AOMapAlpha ("AO Map (Alpha)", 2D) = "white" {}
        _AOMultiplier ("AO Multiplier", Float ) = 1
        _AOBurn ("AO Burn", Float ) = 1
        _ReflectionPower ("Reflection Power", Float ) = 1
        _ReflectionColor ("Reflection Color", Color) = (0.6029412,0.7699797,1,1)
        _Reflection ("Reflection", Cube) = "_Skybox" {}
        _ReflectionMask ("Reflection Mask", 2D) = "white" {}
        _RefFresnelRim ("Ref Fresnel Rim", Float ) = 2
        _RefFresnelPower ("Ref Fresnel Power", Float ) = 1
        _AmbientPower ("Ambient Power", Float ) = 1
        [MaterialToggle] _CustomAmbient ("Custom Ambient", Float ) = 0.6397059
        _RimFresnel ("Rim Fresnel", Float ) = 3
        _RimPower ("Rim Power", Float ) = 1
        _RimColor ("Rim Color", Color) = (0.5,0.5,0.5,1)
        _RimMask ("Rim Mask", 2D) = "white" {}
        _Illum ("Illum", 2D) = "white" {}
        _EmissionLM ("EmissionLM", Float ) = 0
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform fixed _AOActive;
            uniform float _AOMultiplier;
            uniform sampler2D _AOMapAlpha; uniform float4 _AOMapAlpha_ST;
            uniform float _AOBurn;
            uniform float4 _MainColor;
            uniform sampler2D _Base; uniform float4 _Base_ST;
            uniform sampler2D _SpecularCustomMap; uniform float4 _SpecularCustomMap_ST;
            uniform fixed _CustomSpecular;
            uniform float _SpecPower;
            uniform float _SpecBurn;
            uniform sampler2D _Gloss; uniform float4 _Gloss_ST;
            uniform float _Shininess;
            uniform fixed _UseGlossMap;
            uniform fixed _CustomAmbient;
            uniform float _RimFresnel;
            uniform float _AmbientPower;
            uniform float _RimPower;
            uniform float4 _RimColor;
            uniform sampler2D _ReflectionMask; uniform float4 _ReflectionMask_ST;
            uniform samplerCUBE _Reflection;
            uniform float _RefFresnelRim;
            uniform float _RefFresnelPower;
            uniform float _ReflectionPower;
            uniform float4 _ReflectionColor;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormalBurn;
            uniform float4 _SpecularColor;
            uniform sampler2D _RimMask; uniform float4 _RimMask_ST;
            uniform sampler2D _Illum; uniform float4 _Illum_ST;
            uniform float _EmissionLM;
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
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 node_103 = lerp(_Normal_var.rgb,float3(0,0,1),_NormalBurn);
                float3 normalLocal = node_103;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 _Gloss_var = tex2D(_Gloss,TRANSFORM_TEX(i.uv0, _Gloss));
                float gloss = lerp( _Shininess, (_Gloss_var.a*_Shininess), _UseGlossMap );
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_10 = 0.0;
                float4 _Base_var = tex2D(_Base,TRANSFORM_TEX(i.uv0, _Base));
                float4 _SpecularCustomMap_var = tex2D(_SpecularCustomMap,TRANSFORM_TEX(i.uv0, _SpecularCustomMap));
                float node_6 = 1.0;
                float4 _AOMapAlpha_var = tex2D(_AOMapAlpha,TRANSFORM_TEX(i.uv0, _AOMapAlpha));
                float _AOActive_var = lerp( node_6, min(max((lerp(node_10,_AOMapAlpha_var.a,_AOBurn)*_AOMultiplier),node_10),node_6), _AOActive );
                float3 specularColor = (lerp(node_10,lerp( _Base_var.a, _SpecularCustomMap_var.a, _CustomSpecular ),_SpecPower)*_AOActive_var*_SpecBurn*_SpecularColor.rgb);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _RimMask_var = tex2D(_RimMask,TRANSFORM_TEX(i.uv0, _RimMask));
                indirectDiffuse += (lerp( UNITY_LIGHTMODEL_AMBIENT.rgb, ((_RimPower*pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimFresnel))*_RimColor.rgb*_RimMask_var.a), _CustomAmbient )*_AmbientPower*_AOActive_var); // Diffuse Ambient Light
                indirectDiffuse *= float3(_AOActive_var,_AOActive_var,_AOActive_var); // Diffuse AO
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Base_var.rgb*_AOActive_var*_MainColor.rgb);
////// Emissive:
                float4 _Illum_var = tex2D(_Illum,TRANSFORM_TEX(i.uv0, _Illum));
                float4 _ReflectionMask_var = tex2D(_ReflectionMask,TRANSFORM_TEX(i.uv0, _ReflectionMask));
                float3 emissive = ((_Illum_var.a*_EmissionLM)+(texCUBE(_Reflection,viewReflectDirection).rgb*(pow(1.0-max(0,dot(normalDirection, viewDirection)),_RefFresnelRim)*_RefFresnelPower)*_ReflectionMask_var.a*_ReflectionPower*_ReflectionColor.rgb));
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform fixed _AOActive;
            uniform float _AOMultiplier;
            uniform sampler2D _AOMapAlpha; uniform float4 _AOMapAlpha_ST;
            uniform float _AOBurn;
            uniform float4 _MainColor;
            uniform sampler2D _Base; uniform float4 _Base_ST;
            uniform sampler2D _SpecularCustomMap; uniform float4 _SpecularCustomMap_ST;
            uniform fixed _CustomSpecular;
            uniform float _SpecPower;
            uniform float _SpecBurn;
            uniform sampler2D _Gloss; uniform float4 _Gloss_ST;
            uniform float _Shininess;
            uniform fixed _UseGlossMap;
            uniform sampler2D _ReflectionMask; uniform float4 _ReflectionMask_ST;
            uniform samplerCUBE _Reflection;
            uniform float _RefFresnelRim;
            uniform float _RefFresnelPower;
            uniform float _ReflectionPower;
            uniform float4 _ReflectionColor;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormalBurn;
            uniform float4 _SpecularColor;
            uniform sampler2D _Illum; uniform float4 _Illum_ST;
            uniform float _EmissionLM;
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
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 node_103 = lerp(_Normal_var.rgb,float3(0,0,1),_NormalBurn);
                float3 normalLocal = node_103;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float4 _Gloss_var = tex2D(_Gloss,TRANSFORM_TEX(i.uv0, _Gloss));
                float gloss = lerp( _Shininess, (_Gloss_var.a*_Shininess), _UseGlossMap );
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_10 = 0.0;
                float4 _Base_var = tex2D(_Base,TRANSFORM_TEX(i.uv0, _Base));
                float4 _SpecularCustomMap_var = tex2D(_SpecularCustomMap,TRANSFORM_TEX(i.uv0, _SpecularCustomMap));
                float node_6 = 1.0;
                float4 _AOMapAlpha_var = tex2D(_AOMapAlpha,TRANSFORM_TEX(i.uv0, _AOMapAlpha));
                float _AOActive_var = lerp( node_6, min(max((lerp(node_10,_AOMapAlpha_var.a,_AOBurn)*_AOMultiplier),node_10),node_6), _AOActive );
                float3 specularColor = (lerp(node_10,lerp( _Base_var.a, _SpecularCustomMap_var.a, _CustomSpecular ),_SpecPower)*_AOActive_var*_SpecBurn*_SpecularColor.rgb);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuse = directDiffuse * (_Base_var.rgb*_AOActive_var*_MainColor.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Bumped Specular"

}
