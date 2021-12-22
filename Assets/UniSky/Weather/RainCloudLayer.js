/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

private var dropletParticleGO : GameObject;
private var dropEmitter : ParticleEmitter;
private var dropAnimator : ParticleAnimator;
public var cameraRainMaterial : Material;
public var accumDropBuffer : RenderTexture;
private var windScript;
private var rain : GameObject;
private var rainEmitter : ParticleEmitter;
private var rainRenderer : ParticleRenderer;
private var heavyRain : GameObject;
private var heavyRainEmitter : ParticleEmitter;
private var heavyRainRenderer : ParticleRenderer;
private var offscreenParticleGO : GameObject;
private var offscreenParticleCam : Camera;
private var uniskyGO : GameObject;
private var uniskyTerrains;
private var rainDropCamGO : GameObject;
private var rainDropCam : Camera;
private var lightningFlashGO : GameObject;
private var lightningFlashRenderer : Renderer;
private var thunderGO : GameObject;
private var thunder : AudioSource;
private var rainSFXGO : GameObject;
private var rainSFX : AudioSource;
private var ambientSFXGO : GameObject;
private var ambientSFX : AudioSource;
private var stormSFXGO : GameObject;
private var stormSFX : AudioSource;
private var sunGO : GameObject;
private var sun : Light;
private var myCamera : Camera;
private var permTexture : Texture2D;
private var noiseTexture : Texture2D;
private var activeRainPosition : Vector3;
private var rainSpeed : Vector3;
private var cloud : GameObject;
private var cloudScript;
private var sky : GameObject;
private var skyScript;

private var lightningSwitch : boolean;
private var lightningActive : boolean;
private var lightningCount : int;
private var progressiveRain : float;
private var thunderFrequency : float;
private var stormVolume : float;
private var rainVolumeFade : float;
private var rainProbability : float;
private var rainActive : boolean;
private var automateWeather : boolean;
private var weatherStep : float;
private var stormDuration : float;
private var activeFront : boolean;
private var stormProbability : float;
private var localization : int;
private var debugMode : boolean;
private var recedingRain : boolean;
private var recedingWeather : boolean;
private var rainCover : float;

function Awake() {	
	GenerateNoiseTexture();
	
	renderer.sharedMaterial.SetTexture("_NoiseTexture", noiseTexture);
	
	RenderSettings.fog = true;
	RenderSettings.fogColor = Color(0.5f, 0.5f, 0.5f);	
	RenderSettings.fogDensity = 0;
	
	rainSFXGO = GameObject.Find("Rain SoundFX");
	rainSFX = rainSFXGO.GetComponent(AudioSource);
	ambientSFXGO = GameObject.Find("Ambient SFX");
	ambientSFX = ambientSFXGO.GetComponent(AudioSource);
	thunderGO = GameObject.Find("Thunder SoundFX");
	thunder = thunderGO.GetComponent(AudioSource);
	stormSFXGO = GameObject.Find("Storm SFX");
	stormSFX = stormSFXGO.GetComponent(AudioSource);
	windSFXGO = GameObject.Find("Wind SFX");
	windSFX = stormSFXGO.GetComponent(AudioSource);
	rainDropCamGO = GameObject.Find("Rain Droplet Cam");
	rainDropCam = rainDropCamGO.GetComponent(Camera);
	cloud = GameObject.Find("Clouds");
	cloudScript = cloud.GetComponent("CloudScript");
	sky = GameObject.Find("Sky");
	skyScript = sky.GetComponent("AtmosphereSettings");
	rainGO = GameObject.Find("Rain Cloud Layer");
	rainScript = rainGO.GetComponent("RainCloudLayer");
	uniskyGO = GameObject.Find("UniSky");
	uniskyTerrains = uniskyGO.GetComponentsInChildren(Terrain);
	offscreenParticleGO = GameObject.Find("Offscreen Particle Cam");
	offscreenParticleCam = offscreenParticleGO.GetComponent(Camera);
	windZone = GameObject.Find("WindZone");
	windScript = windZone.GetComponent("WindZone");
	rain = GameObject.Find("Rain Particle");
	rainEmitter = rain.GetComponent(ParticleEmitter);
	rainRenderer = rain.GetComponent(ParticleRenderer);
	heavyRain = GameObject.Find("Heavy Rain Particle");
	heavyRainEmitter = heavyRain.GetComponent(ParticleEmitter);
	heavyRainRenderer = heavyRain.GetComponent(ParticleRenderer);
	sunGO = GameObject.Find("Sun");
	sun =  sunGO.GetComponent(Light);
	dropletParticleGO = GameObject.Find("Rain Droplet Particle");
	dropEmitter = dropletParticleGO.GetComponent(ParticleEmitter);
	dropAnimator = dropletParticleGO.GetComponent(ParticleAnimator);
	lightningFlashGO = GameObject.Find("Lightning");
	lightningFlashRenderer = lightningFlashGO.GetComponent(Renderer);
	
	cloudScript.cloudCover = -1.5f;
	cloudScript.precipitationLevel = 1.0;
	rainCover = -3.0f;
	rainActive = false;
	activeFront = false;
	recedingRain = false;
	recedingWeather = false;
	rainSFX.playOnAwake = false;
	ambientSFX.volume = 0.1f;
	ambientSFX.playOnAwake = true;
	stormSFX.playOnAwake = false;
	stormSFX.volume = 0;
	activeRainPosition = new Vector3(99999, 99999, 99999);
	thunderGO.transform.position = Vector3(99999, 99999, 99999);
	
	rainVolumeFade = 0.0005f;
	rainSFX.volume = 0;
	
	lightningSwitch = false;
	lightningCount = 0;
	
	accumDropBuffer = new RenderTexture(Screen.width/4, Screen.height/4, 24);
	accumDropBuffer.filterMode = FilterMode.Bilinear;
	accumDropBuffer.Create();
	
	Graphics.Blit(accumDropBuffer, accumDropBuffer, cameraRainMaterial, 0);
	
	heavyRainEmitter.enabled = false;
	heavyRainRenderer.enabled = false;
	
	dropEmitter.minEmission = 0;
	dropEmitter.maxEmission = 0;
	
	rainEmitter.minEmission = 0;
	rainEmitter.maxEmission = 0;
	
	progressiveRain = 0;
	
	rainDropCam.targetTexture = accumDropBuffer;
}

function Update () {

	if(automateWeather) {
		RenderSettings.fogColor = sun.color * Color(0.3,0.3,0.3);
		ambientSFXGO.transform.position = myCamera.transform.position;
		rainSFXGO.transform.position = myCamera.transform.position;
		stormSFXGO.transform.position = myCamera.transform.position;
		rainSFXGO.transform.position.y += 5;
		stormSFXGO.transform.position.y += 5;
		ambientSFXGO.transform.position.y += 5;

		
		if(cloudScript.cloudCover > -0.5f)
		{
			rainEmitter.minEmission =  100;
			rainEmitter.maxEmission =  100;
			
			if(rainSFX.volume < 0.05f)
				rainSFX.volume += rainVolumeFade;
			
			if(!rainSFX.isPlaying) {
				rainSFX.Play();
				rainSFX.loop = true;
			}
			
			if(cloudScript.cloudCover > -0.1f)
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
					
				heavyRainRenderer.material.SetColor("_TintColor", Color(0.63f,0.63f,0.63f, progressiveRain) * sun.color);
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

		if(Vector3.Distance(activeRainPosition, rain.gameObject.transform.position) < 4000.0f) {
			if(rainCover > -1.5f) {
				if(sun.intensity > 0.1f)
						sun.intensity -= 0.0003f;
				
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
						thunder.pitch = Random.Range(0.3f, 1.8f);
						thunder.Play(Random.Range(44100, 88200));
					}
				}
				
				
				if(lightningActive) {
				
					if(lightningSwitch) {
						lightningFlashRenderer.material.SetColor("_Color", Color(1.0f, 1.0f, 1.0f, 0.0f));
						lightningSwitch = false;
					}
					
					else {
						lightningFlashRenderer.material.SetColor("_Color", Color(1.0f, 1.0f, 1.0f, Random.Range(0.0f, 0.15f)));
						lightningSwitch = true;
						lightningCount++;
					}
					
					if(lightningCount == 20) {
						lightningFlashRenderer.material.SetColor("_Color", Color(1.0f, 1.0f, 1.0f, 0.0f));
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
					terrain.terrainData.wavingGrassSpeed += 0.00005f;
				}
				
				if(windScript.windMain < 2.0f) {
					windScript.windMain +=0.01f;
				}
				
				// heavy storm front
				if(progressiveRain < 0.4f)
					progressiveRain += 0.001f;
				
				heavyRainRenderer.material.SetColor("_TintColor", Color(0.4f,0.4f,0.4f, progressiveRain) * sun.color);
				heavyRainEmitter.minSize = 40.0f;
				heavyRainEmitter.maxSize = 40.0f;
				heavyRainEmitter.minEnergy = 2.0f;
				heavyRainEmitter.maxEnergy = 2.0f;
				heavyRainEmitter.minEmission =  150;
				heavyRainEmitter.maxEmission =  150;
				heavyRainRenderer.lengthScale = 5;
				dropEmitter.minEmission = 5;
				dropEmitter.maxEmission = 5;
				
				rainEmitter.minEmission = 100.0f;
				rainEmitter.maxEmission = 100.0f;
			}
		}
		
		else if(rainCover > -1.5f) {
		
			if(Random.Range(0f, 100.0f) < thunderFrequency) {
				if(!thunder.isPlaying) {
						thunder.volume = Random.Range(0.5f, 1.0f) - stormVolume;
						thunder.pitch = Random.Range(0.0f, 0.5f);
						thunder.Play();
					}
			}
		}
		
		if(recedingRain == true) {
			
			if(windScript.windTurbulence > 0.1f) {
				windScript.windTurbulence -= 0.008f;
			}

			for(var terrain : Terrain in uniskyTerrains) {
				terrain.terrainData.wavingGrassSpeed -= 0.0001f;
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
				
			heavyRainRenderer.material.SetColor("_TintColor", Color(0.63f,0.63f,0.63f, progressiveRain) * sun.color);
			
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
		
		if(!activeFront) {
			if(Random.Range(0f, 5.0f) < rainProbability && !recedingWeather) {
				if(debugMode)
					Debug.Log("Front created");
				activeFront = true;
			}
			
			// clear up the sky
			else if (recedingWeather) {
				if(Random.Range(0f, 0.1f) <  weatherStep) {
					if(cloudScript.precipitationLevel < 1.0f)
						cloudScript.precipitationLevel += 0.0005f;
					if(cloudScript.cloudCover > -2.5f)	
						cloudScript.cloudCover -= 0.005f;
					if(sun.intensity < 0.7f)
						sun.intensity += 0.002f;
					if(RenderSettings.fogDensity > 0)
						RenderSettings.fogDensity -= 0.000005f;
					if(skyScript.fogDensity > 0)	
						skyScript.fogDensity -= 0.000003f;	
				}
			}
			
			if(cloudScript.cloudCover <= -2.0f && recedingWeather) {
				if(debugMode)
					Debug.Log("Weather is no longer receding");
				recedingWeather = false;
			}
		}
		
		// front is active
		else {
			// increase cloud cover, global wind, global effects, decrease sun penetration
			if(Random.Range(0f, 0.1f) <  weatherStep && cloudScript.cloudCover < 0.0f) {
				if(cloudScript.precipitationLevel > 0.5f)
					cloudScript.precipitationLevel -= 0.0005f;
				cloudScript.cloudCover += 0.005f;
				if(sun.intensity > 0.2f)
					sun.intensity -= 0.002f;
				RenderSettings.fogDensity += 0.000005f;	
				if(skyScript.fogDensity < 0.001)	
					skyScript.fogDensity += 0.000003f;	
			}
			
			if(cloudScript.cloudCover >= 0f && !rainActive) {
				if(debugMode)
					Debug.Log("Front is no longer active");
				activeFront = false;
				recedingWeather = true;
			}		
			
			if(windScript.windTurbulence < 1.5f) {
				windScript.windTurbulence += 0.002f;
			}		
				
			if(windScript.windMain < 1.0f) {
					windScript.windMain +=0.002f;
			}
		}
		
		if(!rainActive && !recedingRain && !recedingWeather) {
			activeRainPosition = Vector3(9000, 9000, 9000);
			thunderGO.transform.position = Vector3(9000, 9000, 9000);

			if(cloudScript.cloudCover >= -0.5f) {
				if(Random.Range(0f, 1.0f) <  stormProbability) {
					if(debugMode)
						Debug.Log("Created a storm");
					activeRainPosition.x = (Random.Range(-localization, localization));
					activeRainPosition.y = (Random.Range(-localization, localization));
					activeRainPosition.z = 0;
					thunderGO.transform.position.y = myCamera.gameObject.transform.position.y;
					thunderGO.transform.position.x = myCamera.gameObject.transform.position.x + activeRainPosition.x;
					thunderGO.transform.position.z = myCamera.gameObject.transform.position.z + activeRainPosition.y;
					
					rainActive = true;
				}
			}
		}
		
		if (recedingRain) {
			if(Random.Range(0f, 0.1f) <  weatherStep)
				if(rainCover >= -2.6f)
					rainCover -= 0.005f;
		}
		
		else {
			if(!recedingRain && rainActive) {
				if(Random.Range(0f, 0.1f) <  weatherStep && rainCover <= -1.0f)
					rainCover += 0.005f;
			}

			if(rainCover >= -1.0f && !recedingRain) {
				if(stormDuration != 0) {
					if(Random.Range(0f, stormDuration) <  weatherStep) {
						if(debugMode)
							Debug.Log("Storm is receding");
						recedingRain = true;
						rainActive = false;
					}
				}
			}
		}
		
		if(rainCover <= -2.5f && recedingRain) { 
			if(debugMode)
				Debug.Log("Storm is reset");
			recedingRain = false;
		}
			
		renderer.sharedMaterial.SetVector("_sunColor", sun.color);
		renderer.sharedMaterial.SetFloat("_sunAngle", sun.gameObject.transform.TransformDirection(-Vector3.forward).y);
		renderer.sharedMaterial.SetVector("_StormCenter", activeRainPosition);
		renderer.sharedMaterial.SetFloat("_ViewDistance", cloudScript.viewDistance);
		rainSpeed = cloudScript.speed;
//		activeRainPosition.x += rainSpeed.x;
		renderer.sharedMaterial.SetVector("_Speed", rainSpeed);
	
		renderer.sharedMaterial.SetFloat("Time", Time.time/12.0f);
	}
	
		renderer.sharedMaterial.SetFloat("_CloudCover", rainCover);
}

function GenerateNoiseTexture() {

	noiseTexture = new Texture2D(128, 128, TextureFormat.ARGB32, false);
	noiseTexture.filterMode = FilterMode.Point;
	
	var pixels : Color[];
	pixels = new Color[128*128];
		
	for(var i : int = 0; i<128; i++) {
		for(var j : int = 0; j<128; j++)  {
		  var offset : int = (i*128+j);
	
		  pixels[offset].r = Random.Range(0f, 1f);
		  pixels[offset].g = Random.Range(0f, 1f);
		  pixels[offset].b = Random.Range(0f, 1f);
		  pixels[offset].a = Random.Range(0f, 1f);
		}
	}
	
	noiseTexture.SetPixels(pixels);
	noiseTexture.Apply();
}