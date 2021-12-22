/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/
public var lightGO : GameObject;
public var textGO : GameObject;
public var texty : TextMesh;

private var dropEmitter : ParticleEmitter;
private var dropAnimator : ParticleAnimator;

public var particleGO : GameObject;
public var rainGO : GameObject;
public var rainScript;
public var accumDropBuffer : RenderTexture;
public var cameraRainMaterial : Material;
public var windZone : GameObject;
public var windScript;
public var sunGO : GameObject;
public var sun : Light;
public var thunderGO : GameObject;
public var thunder : AudioSource;
public var rainSFXGO : GameObject;
public var rainSFX : AudioSource;
public var stormSFXGO : GameObject;
public var stormSFX : AudioSource;
public var ambientSFXGO : GameObject;
public var ambientSFX : AudioSource;
public var uniskyGO : GameObject;
public var uniskyTerrains;

public var offscreenParticleGO : GameObject;
public var offscreenParticleCam : Camera;

public var thunderFrequency : float;
public var stormVolume : float;
public var rainVolumeFade : float;
public var randomFlash : float;

private var rain : GameObject;
private var rainEmitter : ParticleEmitter;
private var rainRenderer : ParticleRenderer;

private var heavyRain : GameObject;
private var heavyRainEmitter : ParticleEmitter;
private var heavyRainRenderer : ParticleRenderer;

private var lightningSwitch : boolean;
private var lightningActive : boolean;
private var lightningCount : int;
private var progressiveRain : float;

function Awake () {

	texty = textGO.GetComponent(TextMesh);

	rainGO = GameObject.Find("Rain Cloud Layer");
	rainScript = rainGO.GetComponent("RainCloudLayer");
	thunderGO = GameObject.Find("Thunder SoundFX");
	thunder = thunderGO.GetComponent(AudioSource);
	rainSFXGO = GameObject.Find("Rain SoundFX");
	rainSFX = rainSFXGO.GetComponent(AudioSource);
	ambientSFXGO = GameObject.Find("Ambient SFX");
	ambientSFX = ambientSFXGO.GetComponent(AudioSource);
	stormSFXGO = GameObject.Find("Storm SFX");
	stormSFX = stormSFXGO.GetComponent(AudioSource);
	
	uniskyGO = GameObject.Find("UniSky");
	uniskyTerrains = uniskyGO.GetComponentsInChildren(Terrain);
	offscreenParticleGO = GameObject.Find("Offscreen Particle Cam");
	offscreenParticleCam = offscreenParticleGO.GetComponent(Camera);
	
	rainVolumeFade = 0.0005f;
	rainSFX.volume = 0;
	
	lightningSwitch = false;
	lightningCount = 0;
	
	sunGO = GameObject.Find("Sun");
	sun =  sunGO.GetComponent(Light);
	
	accumDropBuffer = new RenderTexture(512, 512, 24);
	accumDropBuffer.filterMode = FilterMode.Bilinear;
	accumDropBuffer.Create();
	
	dropEmitter = particleGO.GetComponent(ParticleEmitter);
	dropAnimator =  particleGO.GetComponent(ParticleAnimator);
	
	Graphics.Blit(accumDropBuffer, accumDropBuffer, cameraRainMaterial, 0);
	
	windZone = GameObject.Find("WindZone");
	windScript = windZone.GetComponent("WindZone");
	rain = GameObject.Find("Rain Particle");
	rainEmitter = rain.GetComponent(ParticleEmitter);
	rainRenderer = rain.GetComponent(ParticleRenderer);
	heavyRain = GameObject.Find("Heavy Rain Particle");
	heavyRainEmitter = heavyRain.GetComponent(ParticleEmitter);
	heavyRainRenderer = heavyRain.GetComponent(ParticleRenderer);
	
	heavyRainEmitter.enabled = false;
	heavyRainRenderer.enabled = false;
	
	dropEmitter.minEmission = 0;
	dropEmitter.maxEmission = 0;
	
	rainEmitter.minEmission = 0;
	rainEmitter.maxEmission = 0;
	
	progressiveRain = 0;
}

function Update() {
	camera.targetTexture = accumDropBuffer;
	
	cameraRainMaterial.SetTexture("_Texture1", accumDropBuffer);
	Graphics.Blit(accumDropBuffer, accumDropBuffer, cameraRainMaterial, 1);
	
	if(rainScript.activeFront == true)
	{
		if(windScript.windTurbulence < 1.5f)
				windScript.windTurbulence += 0.002f;	
		if(windScript.windMain < 1.0f)
				windScript.windMain +=0.002f;	
	}
	
	// DEBUG ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
	texty.text = rainScript.cloudScript.ToString();
	
	if(rainScript.cloudScript.cloudCover > -0.5f)
	{
		lightGO.active = false;
		rainEmitter.minEmission =  100;
		rainEmitter.maxEmission =  100;
		
		if(rainSFX.volume < 0.05f)
			rainSFX.volume += rainVolumeFade;
		
		if(!rainSFX.isPlaying) {
			rainSFX.Play();
			rainSFX.loop = true;
		}
		
		if(rainScript.cloudScript.cloudCover > -0.1f)
		{
			rainEmitter.minEmission =  300;
			rainEmitter.maxEmission =  300;
			dropEmitter.minEmission = 1;
			dropEmitter.maxEmission = 1;
			
			heavyRainEmitter.enabled = true;
			heavyRainRenderer.enabled = true;
			
			if(rainSFX.volume < 0.1f)
				rainSFX.volume += rainVolumeFade;
			
			// heavy storm front
			heavyRainEmitter.minSize = 50.0f;
			heavyRainEmitter.maxSize = 50.0f;
			heavyRainEmitter.minEnergy = 2.0f;
			heavyRainEmitter.maxEnergy = 2.0f;
			heavyRainEmitter.minEmission =  30;
			heavyRainEmitter.maxEmission =  30;
			heavyRainRenderer.lengthScale = 5;
			if(progressiveRain < 0.2f)
				progressiveRain += 0.001f;
				
			heavyRainRenderer.material.SetColor("_TintColor", Color(0.83f,0.83f,0.83f, progressiveRain) * sun.color);
		}
	}
	
	else {
		heavyRainEmitter.minEmission =  0;
		heavyRainEmitter.maxEmission =  0;
		rainEmitter.minEmission =  0;
		rainEmitter.maxEmission =  0;
	
		dropEmitter.minEmission = 0;
		dropEmitter.maxEmission = 0;
	}

	if(Vector3.Distance(rainScript.activeRainPosition, rain.gameObject.transform.position) < 4000.0f) {
		if(rainScript.rainCover > -1.5f) {
			if(rainScript.sunLight.intensity > 0.1f)
					rainScript.sunLight.intensity -= 0.0003f;
			
			if(RenderSettings.fogDensity < 0.02f)	
					RenderSettings.fogDensity += 0.00002f;	
		
			if(!stormSFX.isPlaying) {
				stormSFX.Play();
				stormSFX.loop = true;
			}
			
			if(stormSFX.volume < 0.4f)
				stormSFX.volume += rainVolumeFade;
			
			if(Random.Range(0f, 200.0f) < thunderFrequency) {
				if(!thunder.isPlaying) {
					lightningActive = true;
					thunder.volume = 1.0f - stormVolume;
					thunder.pitch = Random.Range(0.5f, 1.5f);
					thunder.Play(44100);
				}
			}
			
			
			if(lightningActive) {

				if(lightningSwitch) {
					offscreenParticleCam.backgroundColor = Color(0.0f, 0.0f, 0.0f, 1.0f);
					lightningSwitch = false;
				}
				
				else {
					randomFlash = Random.Range(0.0f, 0.8f);
					offscreenParticleCam.backgroundColor = Color(randomFlash, randomFlash, randomFlash, 1.0f);
					lightningSwitch = true;
					lightningCount++;
				}
				
				if(lightningCount == 6) {
					offscreenParticleCam.backgroundColor = Color(0.0f, 0.0f, 0.0f, 1.0f);
					lightningCount = 0;
					lightningActive = false;
				}
			}	
			
			if(rainSFX.volume < 0.4f)
				rainSFX.volume += rainVolumeFade;
		
			heavyRainEmitter.enabled = true;
			heavyRainRenderer.enabled = true;
			
			if(windScript.windTurbulence < 5.0f) {
				windScript.windTurbulence += 0.01f;
			}
			
			for(var terrain : Terrain in uniskyTerrains) {
				terrain.terrainData.wavingGrassSpeed += 0.0001f;
			}
			
			if(windScript.windMain < 2.0f) {
				windScript.windMain +=0.01f;
			}
			
			// heavy storm front
			if(progressiveRain < 0.4f)
				progressiveRain += 0.001f;
			
			heavyRainRenderer.material.SetColor("_TintColor", Color(0.32f,0.32f,0.32f, progressiveRain) * sun.color);
			heavyRainEmitter.minSize = 40.0f;
			heavyRainEmitter.maxSize = 40.0f;
			heavyRainEmitter.minEnergy = 2.0f;
			heavyRainEmitter.maxEnergy = 2.0f;
			heavyRainEmitter.minEmission =  100;
			heavyRainEmitter.maxEmission =  100;
			heavyRainRenderer.lengthScale = 5;
			dropEmitter.minEmission = 5;
			dropEmitter.maxEmission = 5;
			
			rainEmitter.minEmission = 100.0f;
			rainEmitter.maxEmission = 100.0f;
		}
	}
	
	else if(rainScript.rainCover > -1.5f) {
	
		if(Random.Range(0f, 100.0f) < thunderFrequency) {
			if(!thunder.isPlaying) {
					thunder.volume = Random.Range(0.5f, 1.0f) - stormVolume;
					thunder.pitch = Random.Range(0.0f, 0.5f);
					thunder.Play();
				}
		}
	}
	
	if(rainScript.recedingRain == true) {
		if(windScript.windTurbulence > 0.1f) {
			windScript.windTurbulence -= 0.008f;

			for(var terrain : Terrain in uniskyTerrains) {
				terrain.terrainData.wavingGrassSpeed -= 0.0001f;
			}
		}
			
		heavyRainEmitter.minSize = 40.0f;
		heavyRainEmitter.maxSize = 40.0f;
		heavyRainEmitter.minEnergy = 2.0f;
		heavyRainEmitter.maxEnergy = 2.0f;
		heavyRainEmitter.minEmission =  15;
		heavyRainEmitter.maxEmission =  15;
		heavyRainRenderer.lengthScale = 5;
		rainEmitter.minEmission =  15;
		rainEmitter.maxEmission =  15;
		if(progressiveRain >= 0f)
			progressiveRain -= 0.001f;
			
		if(rainSFX.volume >= 0.0f)
			rainSFX.volume -= rainVolumeFade * 2;	
			
		if(stormSFX.volume >= 0.0f)
			stormSFX.volume -= rainVolumeFade * 10;
			
		heavyRainRenderer.material.SetColor("_TintColor", Color(0.83f,0.83f,0.83f, progressiveRain) * sun.color);
		
		if(RenderSettings.fogDensity > 0f)	
				RenderSettings.fogDensity -= 0.00004f;	
		
		if(RenderSettings.fogDensity < 0.00001f) {
			Graphics.Blit(accumDropBuffer, accumDropBuffer, cameraRainMaterial, 0);
			
			heavyRainEmitter.enabled = false;
			heavyRainRenderer.enabled = false;
			
			heavyRainEmitter.minEmission =  0;
			heavyRainEmitter.maxEmission =  0;
			rainEmitter.minEmission =  0;
			rainEmitter.maxEmission =  0;
		}
		
		dropEmitter.minEmission = 0;
		dropEmitter.maxEmission = 0;
	}
		
	
	// Randomize the dampening a bit
	dropAnimator.damping = Random.Range(0.8f, 1.2f);
}

