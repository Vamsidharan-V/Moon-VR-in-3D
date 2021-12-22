/* Written for "Dawn of the Tyrant" by SixTimesNothing 
/* Please visit www.sixtimesnothing.com to learn more
*/

// For date/time
import System;


private var m_vDirection : Vector3;
private var m_vColor : Vector3;
private var sunDirection : Vector3 = new Vector3();
private var sunDirection2 : Vector3 = new Vector3();
private var SolarAzimuth : float;
private var solarAltitude : float;
private var sunPosition : Vector3;
private var domeRadius : float;
private var m_fTheta : float;
private var m_fPhi : float;

// needs access
private var rayleighLevel : float;
private var TIME : float;
private var useSystemTime : boolean;
private var speedOfTime : float;

function Start() : void {
	if (useSystemTime) {
		var hours : int = int.Parse(DateTime.Now.ToString("HH"));
		var minutes : int = int.Parse(DateTime.Now.ToString("mm"));
		var seconds : int = int.Parse(DateTime.Now.ToString("ss"));
		var realTime : float = hours + (minutes / 60f) + (seconds / 3600f);
		TIME = realTime;
	}

	domeRadius = 46125f;
}

function Update() : void {
	if (useSystemTime) {
		var hours : int = int.Parse(DateTime.Now.ToString("HH"));
		var minutes : int = int.Parse(DateTime.Now.ToString("mm"));
		var seconds : int = int.Parse(DateTime.Now.ToString("ss"));
		var realTime : float = hours + (minutes / 60f) + (seconds / 3600f);
		TIME = realTime;
	} 
	
	SetPosition(TIME);
	transform.position = sunPosition;
	
	// Rise in the east
//	transform.eulerAngles += new Vector3(0,100,0);
	
	// Ambient light
//	var ambientColor : float = (-1 * transform.TransformDirection(Vector3.forward).y)/4f;
	// clamps between (night) and (day)
//	ambientColor = Mathf.Clamp(ambientColor, 0.3, 0.8); // 0.2, 0.5 - Increased these as everything seemed really dark (SM)
//	RenderSettings.ambientLight = new Color(ambientColor, ambientColor, ambientColor, ambientColor);
}

function SetPosition(fTime : float) : void {
	var JULIANDATE : float = 80;
	var MERIDIAN : float = 0 * 15;
	var LATITUDE : float = Mathf.Deg2Rad * 0;
	var LONGITUDE : float =  0;

	var t : float = fTime + 0.170f * Mathf.Sin((4.0f * Mathf.PI * (JULIANDATE - 80.0f)) / 373.0f)
				 - 0.129f * Mathf.Sin((2.0f * Mathf.PI * (JULIANDATE - 8.0f)) / 355.0f)
				 + (12 * (MERIDIAN - LONGITUDE)) / Mathf.PI;

	var fDelta : float = 0.4093f * Mathf.Sin((2.0f * Mathf.PI * (JULIANDATE - 81.0f)) / 368.0f);

	var fSinLat : float = Mathf.Sin(LATITUDE);
	var fCosLat : float = Mathf.Cos(LATITUDE);
	var fSinDelta : float = Mathf.Sin(fDelta);
	var fCosDelta : float = Mathf.Cos(fDelta);
	var fSinT : float = Mathf.Sin((Mathf.PI * t) / 12.0f);
	var fCosT : float = Mathf.Cos((Mathf.PI * t) / 12.0f);

	var fTheta : float = Mathf.PI / 2.0f - Mathf.Asin(fSinLat * fSinDelta - fCosLat * fCosDelta * fCosT);
	var fPhi : float = Mathf.Atan((-fCosDelta * fSinT) / (fCosLat * fSinDelta - fSinLat * fCosDelta * fCosT));

	var opp : float = -fCosDelta * fSinT;
	var adj : float = -(fCosLat * fSinDelta + fSinLat * fCosDelta * fCosT);
	SolarAzimuth = Mathf.Atan2(opp, adj);
	solarAltitude = Mathf.Asin(fSinLat * fSinDelta - fCosLat * fCosDelta * fCosT);

	SetPosition2(fTheta, fPhi);
}

function SetPosition2(fTheta:float, fPhi:float ) : void {
	m_fTheta = fTheta;
	m_fPhi = fPhi;

	var fCosTheta : float= Mathf.Cos( m_fTheta );
	var fSinTheta : float = Mathf.Sin(m_fTheta);
	var fCosPhi : float = Mathf.Cos(m_fPhi);
	var fSinPhi : float = Mathf.Sin(m_fPhi);

	m_vDirection = new Vector3( fSinTheta * fCosPhi,fCosTheta,fSinTheta * fSinPhi );

	var phiSun : float = (Mathf.PI * 2.0f) - SolarAzimuth;

	sunDirection.x = domeRadius;
	sunDirection.y = phiSun;
	sunDirection.z = solarAltitude;
	sunPosition = sphericalToCartesian(sunDirection);

	sunDirection2 = calcDirection(m_fTheta, phiSun);
	m_vDirection = Vector3.Normalize(m_vDirection);
	transform.LookAt(sunDirection2);
	ComputeAttenuation();
}

function calcDirection(thetaSun:float, phiSun:float) : Vector3 {
	var dir : Vector3 = new Vector3();
	dir.x = Mathf.Cos(0.5f * Mathf.PI - thetaSun) * Mathf.Cos(phiSun);
	dir.y = Mathf.Sin(0.5f * Mathf.PI - thetaSun);
	dir.z = Mathf.Cos(0.5f * Mathf.PI - thetaSun) * Mathf.Sin(phiSun);
	return dir.normalized;
}

function sphericalToCartesian(sunDir:Vector3) : Vector3 {
	var res : Vector3 = new Vector3();
	res.y = sunDir.x * Mathf.Sin(sunDir.z);
	var tmp : float = sunDir.x * Mathf.Cos(sunDir.z);
	res.x = tmp * Mathf.Cos(sunDir.y);
	res.z = tmp * Mathf.Sin(sunDir.y);
	return res;
}

function ComputeAttenuation() : void {
	var fBeta : float = 0.04608365822050f * 15.0f - 0.04586025928522f;
	var fTauR : float; 
	var fTauA : float;
	var fTau : float[] = new float[3];
	var tmp : float = 93.885f - (m_fTheta / Mathf.PI * 162.0f);
	var m : float = (1.0f / (Mathf.Cos(m_fTheta) + 0.15f * tmp)); 
	var fLambda : float[] = new float[3];
	fLambda[0] = 0.65f;	
	fLambda[1] = 0.57f;	
	fLambda[2] = 0.475f;	

	for (var i : int = 0; i < 3; i++) {
	
		// Rayleigh Scattering
		fTauR = Mathf.Exp(-m * (0.008735f * ((1.0f-m_vDirection.y)*rayleighLevel)) * Mathf.Pow(fLambda[i], -4.08f));

		var fAlpha : float = 1.3f;
		
		if (m < 0.0f) {
			fTau[i] = 0.0f;
		} else {
			fTauA = Mathf.Exp(-m * fBeta * Mathf.Pow(fLambda[i], -fAlpha));  
			fTau[i] = fTauR * fTauA;
		}
	}

	light.color = new Color(fTau[0] + Mathf.Lerp(0.1f, 0f, Mathf.Clamp(m_vDirection.y * 10, 0, 1)),
	fTau[1] + Mathf.Lerp(0.1f, 0f, Mathf.Clamp(m_vDirection.y * 10, 0, 1)), 
	fTau[2] + Mathf.Lerp(0.1f, 0f, Mathf.Clamp(m_vDirection.y * 10, 0, 1)));

}