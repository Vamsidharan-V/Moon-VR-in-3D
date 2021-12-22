/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

public var rainDropBuffer : RenderTexture;
private var rainEffectGO : GameObject;
public var rainImageMaterial : Material;
private var rainEffectScript;

function Awake() {
	rainEffectGO = GameObject.Find("Rain Cloud Layer");
	rainEffectScript = rainEffectGO.GetComponent("RainCloudLayer");
}
	
function Update() {
	rainDropBuffer = rainEffectScript.accumDropBuffer;
}

function OnRenderImage(source:RenderTexture, destination:RenderTexture) {

	// fade
	rainImageMaterial.SetTexture("_DropBuffer", rainDropBuffer);
		
	Graphics.Blit(rainDropBuffer, rainDropBuffer, rainImageMaterial, 1);
	
	rainImageMaterial.SetTexture("_FrameBuffer", source);
	
	Graphics.Blit(source, destination, rainImageMaterial, 2);
}

