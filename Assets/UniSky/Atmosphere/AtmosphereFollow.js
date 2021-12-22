/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

var me : GameObject;
var followCamera : Camera;

function Start () {
	me = this.gameObject;
}

function Update () {
	me = this.gameObject;
	if(followCamera != null)
		me.transform.position = new Vector3(followCamera.gameObject.transform.position.x, me.gameObject.transform.position.y, followCamera.gameObject.transform.position.z);
}


