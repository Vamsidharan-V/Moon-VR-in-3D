/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

private var mainCamera : Transform;
private var sunLight : Light;
public var cloudMaterial : Material; 
private var innerRadius : float;
private var starTexture : Texture2D;

private var sunLightDirection : Vector3;
private var waveLength : Color;
private var invWaveLength : Color;
private var cameraHeight : float;
private var cameraHeight2 : float;
private var terCameraHeight : float;
private var terCameraHeight2 : float;
private var outerRadius : float;
private var outerRadius2 : float;
private var innerRadius2 : float;
private var ESun : float;
private var Kr : float;
private var Km : float;
private var KrESun : float;
private var KmESun : float;
private var Kr4PI : float;
private var Km4PI : float;
private var scale : float;
private var scaleDepth : float;
private var scaleOverScaleDepth : float;
private var samples : float;
private var g : float;
private var g2 : float;
private var exposure : float;
private var  offsetTransform : Vector3;
private var skyBloomThreshold : float;
public var fogDensity : float;

function Awake() 
{
  waveLength = new Color(0.650f, 0.570f, 0.475f, 0.5f);
  invWaveLength = new Color (1f/Mathf.Pow(waveLength[0],4),1f/Mathf.Pow(waveLength[1],4),1f/Mathf.Pow(waveLength[2],4),1.0f);
  outerRadius = 46125f;
  outerRadius2 = outerRadius * outerRadius;
  innerRadius = 45000;
  innerRadius2 = innerRadius * innerRadius;
  ESun = 12;
  Kr = 0.0025f;
  Km = 0.0010f;
  KrESun = Kr * ESun;
  KmESun = Km * ESun;
  Kr4PI = Kr * 4.0f * Mathf.PI;
  Km4PI	= Km * 4.0f * Mathf.PI;
  scale = 1 / (outerRadius - innerRadius);
  scaleDepth = 0.25f;
  scaleOverScaleDepth = scale / scaleDepth;
  samples = 3;
  g = -0.945f;
  g2 = g*g;
  exposure = 4f;
  
  offsetTransform = transform.position;
  skyBloomThreshold = 0f;
  
  renderer.material.SetFloat("_fOuterRadius", outerRadius);
  renderer.material.SetFloat("_fOuterRadius2", outerRadius2);
  renderer.material.SetFloat("_fInnerRadius", innerRadius);
  renderer.material.SetFloat("_fInnerRadius2", innerRadius2);
  renderer.material.SetFloat("_fKrESun",KrESun);
  renderer.material.SetFloat("_fKmESun",KmESun);
  renderer.material.SetFloat("_fKr4PI",Kr4PI);
  renderer.material.SetFloat("_fKm4PI",Km4PI);
  renderer.material.SetFloat("_fScale",scale);
  renderer.material.SetFloat("_fScaleDepth",scaleDepth);
  renderer.material.SetFloat("_fScaleOverScaleDepth",scaleOverScaleDepth);
  renderer.material.SetFloat("_Samples",samples);
  renderer.material.SetFloat("_G",g);
  renderer.material.SetFloat("_G2",g2);
  renderer.material.SetFloat("_Exposure",exposure);
  renderer.material.SetTexture("_StarTex", starTexture);
  renderer.material.SetColor("_cInvWaveLength", invWaveLength);
  renderer.material.SetColor("_cInvWaveLength", invWaveLength);
  renderer.material.SetFloat("_SkyBloomThreshold", skyBloomThreshold);
}

function LateUpdate () 
{
  sunLightDirection = sunLight.gameObject.transform.TransformDirection (-Vector3.forward);
  cameraHeight = mainCamera.position.y + 44931.74f;
  cameraHeight2 = cameraHeight * cameraHeight;
  terCameraHeight = mainCamera.position.y;
  terCameraHeight2 = terCameraHeight * terCameraHeight;
  offsetTransform = transform.position;
  
  // Pass in variables to the Shader
  renderer.material.SetVector("_v4CameraPos",new Vector4(mainCamera.position.x,mainCamera.position.y + 44931.74f, mainCamera.position.z));
  renderer.material.SetVector("_v4LightDir", new Vector4(sunLightDirection[0],sunLightDirection[1],sunLightDirection[2],0));
  renderer.material.SetFloat("_fCameraHeight", cameraHeight);
  renderer.material.SetFloat("_fCameraHeight2", cameraHeight2);
  renderer.material.SetVector("_OffsetTransform", offsetTransform);
  renderer.material.SetFloat("_FogDensity", fogDensity+ 0.0001f);
  renderer.material.SetVector("_SunColor", sunLight.color * Color(0.6, 0.6, 0.6));
   
  cloudMaterial.SetVector("_v3CameraPos",new Vector4(mainCamera.position.x,mainCamera.position.y + 46125f, mainCamera.position.z));
}