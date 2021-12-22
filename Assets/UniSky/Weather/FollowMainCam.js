/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

public var mainCam : Camera;
public var uniskyMain : GameObject;
public var uniskyMainScript;

function Awake() {
	uniskyMain = GameObject.Find("UniSky");
	uniskyMainScript = uniskyMain.GetComponent("UniSky");
	mainCam = uniskyMainScript.myCamera;
}

function Update () {
	this.gameObject.transform.position = mainCam.gameObject.transform.position;
	this.gameObject.transform.rotation = mainCam.gameObject.transform.rotation;
}