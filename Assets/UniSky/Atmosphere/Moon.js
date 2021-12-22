/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

// needs access
private var Sun : Light;
private var moonTexture : Texture2D;
public var moonMaterial : Material;
private var mainCam : Camera;
private var moonSize : float;
	
private var sunScript;	
private var moonMeshGO : GameObject;
private var moonMeshRenderer : MeshRenderer;
private var moonMeshFilter : MeshFilter;
private var moonMesh : Mesh;

function Start() {

	sunScript = GameObject.Find("Sun").GetComponent("DirectionalSun");
	
	// create the billboard mesh for the moon
	moonMeshGO = new GameObject();
	moonMeshGO.AddComponent(typeof(MeshRenderer));
	moonMeshRenderer = moonMeshGO.GetComponent(MeshRenderer);
	moonMeshGO.AddComponent(typeof(MeshFilter));
	moonMeshFilter = moonMeshGO.GetComponent(MeshFilter);
	moonMesh = new Mesh();
	moonMeshGO.name = "Moon Entity";
	
	var newVertices : Vector3[] = new Vector3[4];
	var uvs : Vector2[] = new Vector2[4];
	var newTriangles : int[] = new int[6];

	newVertices[0].x = 0;
	newVertices[1].x = 0;
	newVertices[2].x =  0;
	newVertices[3].x =  0;
	
	newVertices[0].y = 0;
	newVertices[1].y = 0;
	newVertices[2].y =  0;
	newVertices[3].y =  0;
	
	newVertices[0].z = 0;
	newVertices[1].z = 0;
	newVertices[2].z =  0;
	newVertices[3].z =  0;
	
	newTriangles[0] = 0;
	newTriangles[1] = 1;
	newTriangles[2] = 2;
	newTriangles[3] = 0;
	newTriangles[4] = 2;
	newTriangles[5] = 3;

	uvs[0] = new Vector2(0f, 0f);
	uvs[1] = new Vector2(0f, 1);
	uvs[2] = new Vector2(1, 1);
	uvs[3] = new Vector2(1, 0f);
	
	moonMesh.vertices = newVertices;
	moonMesh.triangles = newTriangles;
	moonMesh.uv = uvs;
	
	moonMeshFilter.sharedMesh = moonMesh;
	moonMeshRenderer.sharedMaterial = moonMaterial;
	
	moonMaterial.SetTexture("_MainTexture", moonTexture);
}

function Update () {
	if (!mainCam) {
		return;
	}
	
	this.gameObject.transform.position = -sunScript.sunPosition;
	this.gameObject.transform.LookAt(sunScript.sunDirection2);
	
	moonMeshGO.transform.position = new Vector3(-sunScript.sunPosition.x, -sunScript.sunPosition.y, -sunScript.sunPosition.z);
	
	moonMaterial.SetVector("_CameraUp", mainCam.transform.up);
	moonMaterial.SetFloat("_MoonSize", moonSize);
	moonMaterial.SetVector("_CameraRight", mainCam.transform.right);
	moonMaterial.SetVector("_v4LightDir", Sun.light.transform.TransformDirection (-Vector3.forward));
}