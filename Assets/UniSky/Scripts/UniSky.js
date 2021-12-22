// UNISKY
// Version 1.0 (Release)
// Developed by Six Times Nothing
// Please visit www.sixtimesnothing.com/unisky to learn more

// Sky parameters
public var precipitationLevel : float;
public var cloudCover : float;
public var colorVariance1 : Vector3;
public var colorVariance2 : Vector3;
public var glowVariance : float;
public var viewDistance : float;
public var speed : Vector3;
public var Sun : Light;
public var myCamera : Camera;
public var rayleighLevel : float= 70;
public var TIME : float = 8.0f;
public var useSystemTime : boolean = false;
public var speedOfTime : float= 0.0005f;
public var moonTexture : Texture2D;
public var innerRadius : float;
public var starTexture : Texture2D;
public var moonSize : float;
public var stormProbability : float;
public var automateWeather : boolean;
public var weatherStep : float;
public var stormDuration : float;
public var rainProbability : float;
public var localization : int;
public var thunderFrequency : float;
public var stormVolume : float;
public var debugMode : boolean;

public var cloud : GameObject;
public var sky : GameObject;
public var moon : GameObject;
public var sun : GameObject;
public var atmosFollowCloud : GameObject;
public var atmosFollowSky : GameObject;
public var atmosFollowRain : GameObject;
public var rainGO : GameObject;
public var camRainGO : GameObject;
public var camRain;

public var thunderAudio : AudioClip;
public var ambientAudio : AudioClip;
public var rainAudio : AudioClip;
public var stormAudio : AudioClip;

public var thunderGO : GameObject;
public var thunder : AudioSource;
public var rainSFXGO : GameObject;
public var rainSFX : AudioSource;
public var stormSFXGO : GameObject;
public var stormSFX : AudioSource;
public var ambientSFXGO : GameObject;
public var ambientSFX : AudioSource;

public var uniSkyImage : Texture2D;

public var cloudScript;
public var skyScript;
public var moonScript;
public var sunScript;
public var atmosFollowScript;
public var atmosFollowScript2;
public var atmosFollowScript3;
public var rainScript;

function Awake() {

	cloud = GameObject.Find("Clouds");
	sky = GameObject.Find("Sky");
	moon = GameObject.Find("Moon");
	sun = GameObject.Find("Sun");
	atmosFollowCloud = GameObject.Find("Cloud Handler");
	atmosFollowSky = GameObject.Find("Sky Handler");
	atmosFollowRain = GameObject.Find("Rain Cloud Layer");
	rainGO = GameObject.Find("Rain Cloud Layer");
	camRainGO = GameObject.Find("Rain Droplet Cam");
	
	thunderGO = GameObject.Find("Thunder SoundFX");
	thunder = thunderGO.GetComponent(AudioSource);
	rainSFXGO = GameObject.Find("Rain SoundFX");
	rainSFX = rainSFXGO.GetComponent(AudioSource);
	ambientSFXGO = GameObject.Find("Ambient SFX");
	ambientSFX = ambientSFXGO.GetComponent(AudioSource);
	stormSFXGO = GameObject.Find("Storm SFX");
	stormSFX = stormSFXGO.GetComponent(AudioSource);
	
	cloudScript = cloud.GetComponent("CloudScript");
	rainScript = rainGO.GetComponent("RainCloudLayer");
	skyScript = sky.GetComponent("AtmosphereSettings");
	moonScript = moon.GetComponent("Moon");
	sunScript = sun.GetComponent("DirectionalSun");
	camRain = camRainGO.GetComponent("CameraRain");
	atmosFollowScript = atmosFollowCloud.GetComponent("AtmosphereFollow");
	atmosFollowScript2 = atmosFollowRain.GetComponent("AtmosphereFollow");
	atmosFollowScript3 = atmosFollowSky.GetComponent("AtmosphereFollow");
	
	// defaults in case left blank
	cloudScript.Sun = GameObject.Find("Sun").light;
	rainScript.sun = GameObject.Find("Sun").light;
	rainScript.myCamera = myCamera;
	cloudScript.myCamera = myCamera;
	moonScript.mainCam = myCamera;
	moonScript.Sun = GameObject.Find("Sun").light;
	skyScript.sunLight = GameObject.Find("Sun").light;
	skyScript.mainCamera = myCamera.transform;
}

function Update () {

	// these are controlled by the weather script if automated
	if(!automateWeather)
	{
		cloudScript.precipitationLevel = precipitationLevel;
		cloudScript.cloudCover = cloudCover;
	}
	
	cloudScript.colorVariance1 = colorVariance1;
	cloudScript.colorVariance2 = colorVariance2;
	cloudScript.glowVariance = glowVariance;
	cloudScript.viewDistance = viewDistance;
	cloudScript.speed = speed;
	cloudScript.Sun = Sun;
	cloudScript.myCamera = myCamera;
	
	rainScript.myCamera = myCamera;
	rainScript.sun = Sun;
	rainScript.rainProbability = rainProbability;
	rainScript.stormProbability = stormProbability;
	rainScript.automateWeather = automateWeather;
	rainScript.weatherStep = weatherStep;
	rainScript.stormDuration = stormDuration;
	rainScript.localization = localization;
	rainScript.debugMode = debugMode;
	rainScript.thunderFrequency = thunderFrequency;
	rainScript.stormVolume = 1.0f - stormVolume;
	
	thunder.clip = thunderAudio;
	rainSFX.clip = rainAudio;
	stormSFX.clip = stormAudio;
	ambientSFX.clip = ambientAudio;
	
	sunScript.rayleighLevel = rayleighLevel;
	
	if(!sunScript.useSystemTime)
		TIME += sunScript.speedOfTime;
	else
		TIME = sunScript.TIME;
	
	if(TIME >= 24)
		TIME = 0;
	
	sunScript.TIME = TIME;
		
	sunScript.useSystemTime = useSystemTime;
	sunScript.speedOfTime = speedOfTime;
	
	moonScript.moonTexture = moonTexture;
	moonScript.mainCam = myCamera;
	moonScript.Sun = Sun;
	moonScript.moonSize = moonSize * 1000;
	
	skyScript.innerRadius = innerRadius;
	skyScript.starTexture = starTexture;
	skyScript.sunLight = Sun;
	skyScript.mainCamera = myCamera.transform;
	
	atmosFollowScript.followCamera = myCamera;
	atmosFollowScript2.followCamera = myCamera;
	atmosFollowScript3.followCamera = myCamera;
}
