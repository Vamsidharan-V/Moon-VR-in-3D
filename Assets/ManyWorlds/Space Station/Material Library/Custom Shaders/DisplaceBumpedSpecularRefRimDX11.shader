// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.04 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.04;sub:START;pass:START;ps:flbk:Bumped Specular,lico:1,lgpr:1,nrmq:1,limd:1,uamb:False,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,dith:2,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:33664,y:32774,varname:node_1,prsc:2|diff-2-OUT,spec-18-OUT,gloss-25-OUT,normal-103-OUT,emission-70-OUT,lwrap-262-OUT,amdfl-47-OUT,disp-343-OUT,tess-84-OUT;n:type:ShaderForge.SFN_Multiply,id:2,x:33305,y:32399,varname:node_2,prsc:2|A-12-RGB,B-5-OUT,C-11-RGB;n:type:ShaderForge.SFN_Multiply,id:3,x:34034,y:32759,varname:node_3,prsc:2|A-4-OUT,B-7-OUT;n:type:ShaderForge.SFN_Lerp,id:4,x:34034,y:32893,varname:node_4,prsc:2|A-10-OUT,B-8-A,T-9-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:5,x:33974,y:32575,ptovrint:False,ptlb:AO Active,ptin:_AOActive,varname:node_8362,prsc:2,on:False|A-6-OUT,B-230-OUT;n:type:ShaderForge.SFN_Vector1,id:6,x:33705,y:32608,varname:node_6,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:7,x:33867,y:32793,ptovrint:False,ptlb:AO Multiplier,ptin:_AOMultiplier,varname:node_2179,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:8,x:34034,y:33041,ptovrint:False,ptlb:AO Map (Alpha),ptin:_AOMapAlpha,varname:node_4987,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:9,x:33867,y:32996,ptovrint:False,ptlb:AO Burn,ptin:_AOBurn,varname:node_730,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Vector1,id:10,x:33705,y:32548,varname:node_10,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:11,x:33075,y:32296,ptovrint:False,ptlb:Main Color,ptin:_MainColor,varname:node_7264,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:12,x:33075,y:32456,ptovrint:False,ptlb:Base,ptin:_Base,varname:node_4590,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:13,x:32998,y:32668,ptovrint:False,ptlb:Specular Custom Map,ptin:_SpecularCustomMap,varname:node_5339,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:14,x:33150,y:32668,ptovrint:False,ptlb:Custom Specular,ptin:_CustomSpecular,varname:node_1377,prsc:2,on:False|A-12-A,B-13-A;n:type:ShaderForge.SFN_Lerp,id:15,x:33325,y:32632,varname:node_15,prsc:2|A-10-OUT,B-14-OUT,T-17-OUT;n:type:ShaderForge.SFN_ValueProperty,id:17,x:33150,y:32830,ptovrint:False,ptlb:Spec Power,ptin:_SpecPower,varname:node_1174,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:18,x:33378,y:32784,varname:node_18,prsc:2|A-15-OUT,B-5-OUT,C-19-OUT,D-124-RGB;n:type:ShaderForge.SFN_ValueProperty,id:19,x:33150,y:32903,ptovrint:False,ptlb:Spec Burn,ptin:_SpecBurn,varname:node_5005,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:20,x:32840,y:32871,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_7270,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:21,x:33016,y:32988,varname:node_21,prsc:2|A-20-A,B-24-OUT;n:type:ShaderForge.SFN_Slider,id:24,x:32762,y:33067,ptovrint:False,ptlb:Shininess,ptin:_Shininess,varname:node_8300,prsc:2,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:25,x:33173,y:32998,ptovrint:False,ptlb:Use Gloss Map,ptin:_UseGlossMap,varname:node_88,prsc:2,on:False|A-24-OUT,B-21-OUT;n:type:ShaderForge.SFN_Fresnel,id:41,x:33446,y:33357,varname:node_41,prsc:2|EXP-45-OUT;n:type:ShaderForge.SFN_AmbientLight,id:42,x:33637,y:33508,varname:node_42,prsc:2;n:type:ShaderForge.SFN_SwitchProperty,id:43,x:33811,y:33437,ptovrint:False,ptlb:Custom Ambient,ptin:_CustomAmbient,varname:node_4116,prsc:2,on:False|A-42-RGB,B-44-OUT;n:type:ShaderForge.SFN_Multiply,id:44,x:33637,y:33357,varname:node_44,prsc:2|A-48-OUT,B-51-RGB,C-247-A;n:type:ShaderForge.SFN_ValueProperty,id:45,x:33278,y:33374,ptovrint:False,ptlb:Rim Fresnel,ptin:_RimFresnel,varname:node_3270,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:46,x:33797,y:33607,ptovrint:False,ptlb:Ambient Power,ptin:_AmbientPower,varname:node_8968,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:47,x:33967,y:33462,varname:node_47,prsc:2|A-43-OUT,B-46-OUT,C-5-OUT;n:type:ShaderForge.SFN_Multiply,id:48,x:33446,y:33219,varname:node_48,prsc:2|A-50-OUT,B-41-OUT;n:type:ShaderForge.SFN_ValueProperty,id:50,x:33278,y:33451,ptovrint:False,ptlb:Rim Power,ptin:_RimPower,varname:node_4137,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:51,x:33446,y:33508,ptovrint:False,ptlb:Rim Color,ptin:_RimColor,varname:node_5794,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:64,x:32813,y:33406,ptovrint:False,ptlb:Reflection Mask,ptin:_ReflectionMask,varname:node_191,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Cubemap,id:65,x:32622,y:33394,ptovrint:False,ptlb:Reflection,ptin:_Reflection,varname:node_5832,prsc:2,cube:a596436b21c6d484bb9b3b6385e3e666,pvfc:0;n:type:ShaderForge.SFN_Fresnel,id:66,x:32788,y:33571,varname:node_66,prsc:2|EXP-67-OUT;n:type:ShaderForge.SFN_ValueProperty,id:67,x:32606,y:33594,ptovrint:False,ptlb:Ref Fresnel Rim,ptin:_RefFresnelRim,varname:node_9924,prsc:2,glob:False,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:68,x:32606,y:33676,ptovrint:False,ptlb:Ref Fresnel Power,ptin:_RefFresnelPower,varname:node_2979,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:69,x:32951,y:33571,varname:node_69,prsc:2|A-66-OUT,B-68-OUT;n:type:ShaderForge.SFN_Multiply,id:70,x:33015,y:33438,varname:node_70,prsc:2|A-65-RGB,B-69-OUT,C-64-A,D-71-OUT,E-77-RGB;n:type:ShaderForge.SFN_ValueProperty,id:71,x:32971,y:33366,ptovrint:False,ptlb:Reflection Power,ptin:_ReflectionPower,varname:node_4003,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Color,id:77,x:32937,y:33750,ptovrint:False,ptlb:Reflection Color,ptin:_ReflectionColor,varname:node_5736,prsc:2,glob:False,c1:0.6029412,c2:0.7699797,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:84,x:33173,y:33185,ptovrint:False,ptlb:Tesellation Level,ptin:_TesellationLevel,varname:node_9488,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:90,x:32003,y:32849,ptovrint:False,ptlb:Displacement,ptin:_Displacement,varname:node_1068,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:91,x:32194,y:32866,varname:node_91,prsc:2|A-10-OUT,B-90-A,T-92-OUT;n:type:ShaderForge.SFN_ValueProperty,id:92,x:32099,y:33044,ptovrint:False,ptlb:Displace Burn,ptin:_DisplaceBurn,varname:node_9953,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:93,x:32361,y:33116,ptovrint:False,ptlb:Displace Power,ptin:_DisplacePower,varname:node_5629,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:94,x:32444,y:32866,varname:node_94,prsc:2|A-303-OUT,B-93-OUT,C-95-OUT;n:type:ShaderForge.SFN_NormalVector,id:95,x:32205,y:32751,prsc:2,pt:True;n:type:ShaderForge.SFN_Lerp,id:103,x:32637,y:32495,varname:node_103,prsc:2|A-104-RGB,B-105-OUT,T-106-OUT;n:type:ShaderForge.SFN_Tex2d,id:104,x:32406,y:32317,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_7127,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector3,id:105,x:32406,y:32495,varname:node_105,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Slider,id:106,x:32249,y:32615,ptovrint:False,ptlb:Normal Burn,ptin:_NormalBurn,varname:node_3112,prsc:2,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:124,x:32608,y:32715,ptovrint:False,ptlb:Specular Color,ptin:_SpecularColor,varname:node_4360,prsc:2,glob:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Max,id:229,x:34405,y:32834,varname:node_229,prsc:2|A-3-OUT,B-10-OUT;n:type:ShaderForge.SFN_Min,id:230,x:34405,y:32698,varname:node_230,prsc:2|A-229-OUT,B-6-OUT;n:type:ShaderForge.SFN_Tex2d,id:247,x:33516,y:33716,ptovrint:False,ptlb:Rim Mask,ptin:_RimMask,varname:node_7062,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:262,x:34289,y:33369,ptovrint:False,ptlb:Use Light Wrap,ptin:_UseLightWrap,varname:node_620,prsc:2,on:False|A-10-OUT,B-278-OUT;n:type:ShaderForge.SFN_ValueProperty,id:277,x:33998,y:33802,ptovrint:False,ptlb:Light Wrap,ptin:_LightWrap,varname:node_7652,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:278,x:34181,y:33711,varname:node_278,prsc:2|A-279-A,B-277-OUT;n:type:ShaderForge.SFN_Tex2d,id:279,x:33998,y:33617,ptovrint:False,ptlb:Wrap Mask,ptin:_WrapMask,varname:node_5822,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Max,id:302,x:32115,y:33138,varname:node_302,prsc:2|A-91-OUT,B-10-OUT;n:type:ShaderForge.SFN_Min,id:303,x:32269,y:33197,varname:node_303,prsc:2|A-302-OUT,B-6-OUT;n:type:ShaderForge.SFN_Add,id:319,x:32485,y:32644,varname:node_319,prsc:2|A-103-OUT,B-95-OUT;n:type:ShaderForge.SFN_Add,id:343,x:32566,y:33014,varname:node_343,prsc:2|A-94-OUT,B-345-OUT;n:type:ShaderForge.SFN_ValueProperty,id:344,x:32455,y:33327,ptovrint:False,ptlb:Offset Displace,ptin:_OffsetDisplace,varname:node_4087,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:345,x:32476,y:33156,varname:node_345,prsc:2|A-95-OUT,B-344-OUT;proporder:11-12-104-106-124-17-19-14-13-24-25-20-5-8-7-9-71-77-65-64-67-68-46-43-45-50-51-247-262-277-279-84-90-92-93-344;pass:END;sub:END;*/

Shader "ManyWorlds/DisplaceBumpedSpecularRefRimDX11" {
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
        [MaterialToggle] _UseLightWrap ("Use Light Wrap", Float ) = 0
        _LightWrap ("Light Wrap", Float ) = 0
        _WrapMask ("Wrap Mask", 2D) = "white" {}
        _TesellationLevel ("Tesellation Level", Float ) = 1
        _Displacement ("Displacement", 2D) = "white" {}
        _DisplaceBurn ("Displace Burn", Float ) = 1
        _DisplacePower ("Displace Power", Float ) = 1
        _OffsetDisplace ("Offset Displace", Float ) = 0
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
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Tessellation.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
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
            uniform float _TesellationLevel;
            uniform sampler2D _Displacement; uniform float4 _Displacement_ST;
            uniform float _DisplaceBurn;
            uniform float _DisplacePower;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormalBurn;
            uniform float4 _SpecularColor;
            uniform sampler2D _RimMask; uniform float4 _RimMask_ST;
            uniform fixed _UseLightWrap;
            uniform float _LightWrap;
            uniform sampler2D _WrapMask; uniform float4 _WrapMask_ST;
            uniform float _OffsetDisplace;
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
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float node_10 = 0.0;
                    float4 _Displacement_var = tex2Dlod(_Displacement,float4(TRANSFORM_TEX(v.texcoord0, _Displacement),0.0,0));
                    float node_6 = 1.0;
                    v.vertex.xyz += ((min(max(lerp(node_10,_Displacement_var.a,_DisplaceBurn),node_10),node_6)*_DisplacePower*v.normal)+(v.normal*_OffsetDisplace));
                }
                float Tessellation(TessVertex v){
                    return _TesellationLevel;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
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
                NdotL = dot( normalDirection, lightDirection );
                float4 _WrapMask_var = tex2D(_WrapMask,TRANSFORM_TEX(i.uv0, _WrapMask));
                float node_620 = lerp( node_10, (_WrapMask_var.a*_LightWrap), _UseLightWrap );
                float3 w = float3(node_620,node_620,node_620)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = forwardLight * attenColor;
                float4 _RimMask_var = tex2D(_RimMask,TRANSFORM_TEX(i.uv0, _RimMask));
                indirectDiffuse += (lerp( UNITY_LIGHTMODEL_AMBIENT.rgb, ((_RimPower*pow(1.0-max(0,dot(normalDirection, viewDirection)),_RimFresnel))*_RimColor.rgb*_RimMask_var.a), _CustomAmbient )*_AmbientPower*_AOActive_var); // Diffuse Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Base_var.rgb*_AOActive_var*_MainColor.rgb);
////// Emissive:
                float4 _ReflectionMask_var = tex2D(_ReflectionMask,TRANSFORM_TEX(i.uv0, _ReflectionMask));
                float3 emissive = (texCUBE(_Reflection,viewReflectDirection).rgb*(pow(1.0-max(0,dot(normalDirection, viewDirection)),_RefFresnelRim)*_RefFresnelPower)*_ReflectionMask_var.a*_ReflectionPower*_ReflectionColor.rgb);
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
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Tessellation.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
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
            uniform float _TesellationLevel;
            uniform sampler2D _Displacement; uniform float4 _Displacement_ST;
            uniform float _DisplaceBurn;
            uniform float _DisplacePower;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormalBurn;
            uniform float4 _SpecularColor;
            uniform fixed _UseLightWrap;
            uniform float _LightWrap;
            uniform sampler2D _WrapMask; uniform float4 _WrapMask_ST;
            uniform float _OffsetDisplace;
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
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float node_10 = 0.0;
                    float4 _Displacement_var = tex2Dlod(_Displacement,float4(TRANSFORM_TEX(v.texcoord0, _Displacement),0.0,0));
                    float node_6 = 1.0;
                    v.vertex.xyz += ((min(max(lerp(node_10,_Displacement_var.a,_DisplaceBurn),node_10),node_6)*_DisplacePower*v.normal)+(v.normal*_OffsetDisplace));
                }
                float Tessellation(TessVertex v){
                    return _TesellationLevel;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
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
                NdotL = dot( normalDirection, lightDirection );
                float4 _WrapMask_var = tex2D(_WrapMask,TRANSFORM_TEX(i.uv0, _WrapMask));
                float node_620 = lerp( node_10, (_WrapMask_var.a*_LightWrap), _UseLightWrap );
                float3 w = float3(node_620,node_620,node_620)*0.5; // Light wrapping
                float3 NdotLWrap = NdotL * ( 1.0 - w );
                float3 forwardLight = max(float3(0.0,0.0,0.0), NdotLWrap + w );
                float3 directDiffuse = forwardLight * attenColor;
                float3 diffuse = directDiffuse * (_Base_var.rgb*_AOActive_var*_MainColor.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
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
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCOLLECTOR
            #define SHADOW_COLLECTOR_PASS
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "Tessellation.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcollector
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
            uniform float _TesellationLevel;
            uniform sampler2D _Displacement; uniform float4 _Displacement_ST;
            uniform float _DisplaceBurn;
            uniform float _DisplacePower;
            uniform float _OffsetDisplace;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
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
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_COLLECTOR(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float node_10 = 0.0;
                    float4 _Displacement_var = tex2Dlod(_Displacement,float4(TRANSFORM_TEX(v.texcoord0, _Displacement),0.0,0));
                    float node_6 = 1.0;
                    v.vertex.xyz += ((min(max(lerp(node_10,_Displacement_var.a,_DisplaceBurn),node_10),node_6)*_DisplacePower*v.normal)+(v.normal*_OffsetDisplace));
                }
                float Tessellation(TessVertex v){
                    return _TesellationLevel;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
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
            #pragma hull hull
            #pragma domain domain
            #pragma vertex tessvert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "Tessellation.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 5.0
            uniform float _TesellationLevel;
            uniform sampler2D _Displacement; uniform float4 _Displacement_ST;
            uniform float _DisplaceBurn;
            uniform float _DisplacePower;
            uniform float _OffsetDisplace;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
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
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            #ifdef UNITY_CAN_COMPILE_TESSELLATION
                struct TessVertex {
                    float4 vertex : INTERNALTESSPOS;
                    float3 normal : NORMAL;
                    float4 tangent : TANGENT;
                    float2 texcoord0 : TEXCOORD0;
                };
                struct OutputPatchConstant {
                    float edge[3]         : SV_TessFactor;
                    float inside          : SV_InsideTessFactor;
                    float3 vTangent[4]    : TANGENT;
                    float2 vUV[4]         : TEXCOORD;
                    float3 vTanUCorner[4] : TANUCORNER;
                    float3 vTanVCorner[4] : TANVCORNER;
                    float4 vCWts          : TANWEIGHTS;
                };
                TessVertex tessvert (VertexInput v) {
                    TessVertex o;
                    o.vertex = v.vertex;
                    o.normal = v.normal;
                    o.tangent = v.tangent;
                    o.texcoord0 = v.texcoord0;
                    return o;
                }
                void displacement (inout VertexInput v){
                    float node_10 = 0.0;
                    float4 _Displacement_var = tex2Dlod(_Displacement,float4(TRANSFORM_TEX(v.texcoord0, _Displacement),0.0,0));
                    float node_6 = 1.0;
                    v.vertex.xyz += ((min(max(lerp(node_10,_Displacement_var.a,_DisplaceBurn),node_10),node_6)*_DisplacePower*v.normal)+(v.normal*_OffsetDisplace));
                }
                float Tessellation(TessVertex v){
                    return _TesellationLevel;
                }
                float4 Tessellation(TessVertex v, TessVertex v1, TessVertex v2){
                    float tv = Tessellation(v);
                    float tv1 = Tessellation(v1);
                    float tv2 = Tessellation(v2);
                    return float4( tv1+tv2, tv2+tv, tv+tv1, tv+tv1+tv2 ) / float4(2,2,2,3);
                }
                OutputPatchConstant hullconst (InputPatch<TessVertex,3> v) {
                    OutputPatchConstant o;
                    float4 ts = Tessellation( v[0], v[1], v[2] );
                    o.edge[0] = ts.x;
                    o.edge[1] = ts.y;
                    o.edge[2] = ts.z;
                    o.inside = ts.w;
                    return o;
                }
                [domain("tri")]
                [partitioning("fractional_odd")]
                [outputtopology("triangle_cw")]
                [patchconstantfunc("hullconst")]
                [outputcontrolpoints(3)]
                TessVertex hull (InputPatch<TessVertex,3> v, uint id : SV_OutputControlPointID) {
                    return v[id];
                }
                [domain("tri")]
                VertexOutput domain (OutputPatchConstant tessFactors, const OutputPatch<TessVertex,3> vi, float3 bary : SV_DomainLocation) {
                    VertexInput v;
                    v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
                    v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
                    v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
                    v.texcoord0 = vi[0].texcoord0*bary.x + vi[1].texcoord0*bary.y + vi[2].texcoord0*bary.z;
                    displacement(v);
                    VertexOutput o = vert(v);
                    return o;
                }
            #endif
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Bumped Specular"

}
