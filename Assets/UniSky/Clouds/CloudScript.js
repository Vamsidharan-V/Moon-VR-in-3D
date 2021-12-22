/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

private var permTexture : Texture2D;
private var noiseTexture : Texture2D;

private var sunAngle : float;

private var precipitationLevel : float;
private var cloudCover : float;
private var colorVariance1 : Vector3;
private var colorVariance2 : Vector3;
private var glowVariance : float;
private var viewDistance : float;
private var speed : Vector3;
private var Sun : Light;
private var myCamera : Camera;
 
function Awake () {

	GenerateNoiseTexture();
	
	renderer.sharedMaterial.SetTexture("_NoiseTexture", noiseTexture);
}

function Update () {
	if (!myCamera) {
		return;
	}

	renderer.sharedMaterial.SetVector("_SunColor", Sun.color);
	renderer.sharedMaterial.SetFloat("Time", Time.time/12.0f);
	renderer.sharedMaterial.SetFloat("_CloudCover", cloudCover);
	renderer.sharedMaterial.SetFloat("_PrecipLevel", precipitationLevel);
	renderer.sharedMaterial.SetFloat("_SunAngle", Sun.gameObject.transform.TransformDirection(-Vector3.forward).y);
	renderer.sharedMaterial.SetVector("_ColorVar1", colorVariance1);
	renderer.sharedMaterial.SetVector("_ColorVar2", colorVariance2);
	renderer.sharedMaterial.SetFloat("_GlowVar", glowVariance);
	renderer.sharedMaterial.SetFloat("_ViewDistance", viewDistance);
	renderer.sharedMaterial.SetVector("_Speed", speed);
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