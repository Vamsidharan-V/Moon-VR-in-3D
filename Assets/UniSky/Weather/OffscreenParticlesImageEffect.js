/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

public var offscreenRainRT : RenderTexture;

public var CompositeMaterial : Material;

public var particleCameraGO : GameObject;
public var particleCamera : Camera;

public var offscreenRainWidth : int;
public var offscreenRainHeight : int;

function Awake() {
	// Here you can change the quality/performance ratio for the heavy rain
	offscreenRainWidth = Screen.width/16;
	offscreenRainHeight = Screen.width/16;
	
	offscreenRainRT = new RenderTexture(offscreenRainWidth, offscreenRainHeight, 24);
	offscreenRainRT.filterMode = FilterMode.Bilinear;
	offscreenRainRT.Create();	
	
	particleCameraGO = GameObject.Find("Offscreen Particle Cam");
	particleCamera = particleCameraGO.GetComponent(Camera);
	
	particleCamera.targetTexture = offscreenRainRT;
	RenderTexture.active = offscreenRainRT;
}

function OnRenderImage(source : RenderTexture, destination : RenderTexture) {

	particleCamera.Render();

	CompositeMaterial.SetTexture("_OffscreenRT", offscreenRainRT);
	CompositeMaterial.SetTexture("_Framebuffer", source);
	Graphics.Blit(source, source, CompositeMaterial);
	Graphics.Blit(source, destination);
}