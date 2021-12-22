import System;

@CustomEditor(UniSky)

class UniSkyEditor extends Editor {

	var tabInt : int;
	
	// Initialize all components and default values
	function Start()
	{
		// default values
		target.precipitationLevel = 1.0f;
		target.cloudCover = -1.5f;
		target.colorVariance1 = new Vector3(1.5f, 1.5f, 1.5f);
		target.colorVariance2 = new Vector3(0.3f, 0.3f, 0.3f);
		target.glowVariance = 4.3f;
		target.viewDistance = 3.0f;
		target.speed = new Vector3(0.3f, 0.3f, 0.3f);
		target.moonSize = 16;
		
		target.rayleighLevel = 40;
		// target.TIME = 0;
		// target.useSystemTime = true;
		target.speedOfTime = 0.0005f;
		target.innerRadius = 45000;
	}
	
	public function OnInspectorGUI() {
	
		EditorGUIUtility.LookLikeControls(200, 50);
		
		if (!target.uniSkyImage) {
			target.uniSkyImage = UnityEngine.Resources.LoadAssetAtPath("Assets/UniSky/unisky.png", Texture2D);
		}
		
		EditorGUILayout.Separator();
		
		var imageRect : Rect = EditorGUILayout.BeginHorizontal();
		imageRect.x = imageRect.width / 2 - 160;
		if (imageRect.x < 0) {
			imageRect.x = 0;
		}
		imageRect.width = 320;
		imageRect.height = 140;
		GUI.DrawTexture(imageRect, target.uniSkyImage);
		EditorGUILayout.EndHorizontal();
		
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		EditorGUILayout.Separator();
		
		EditorGUILayout.BeginHorizontal();
		// Tabs for different components
		var tabOptions : String[] = new String[6];
		tabOptions[0] = "General";
		tabOptions[1] = "Sky";
		tabOptions[2] = "Clouds";
		tabOptions[3] = "Sun";
		tabOptions[4] = "Moon";
		tabOptions[5] = "Weather";
		tabInt = GUILayout.Toolbar(tabInt, tabOptions);
		EditorGUILayout.EndHorizontal();
		EditorGUILayout.Separator();
		
		switch (tabInt) {
			case 0:
				target.myCamera = EditorGUILayout.ObjectField("Scene Camera", target.myCamera, typeof(Camera));
				target.Sun = EditorGUILayout.ObjectField("Directional Sun", target.Sun, typeof(Light));
				break;
			case 1:
				EditorGUILayout.PrefixLabel("Scattering Radius (Affects sky color)");
				target.innerRadius = EditorGUILayout.Slider(target.innerRadius, 44000f, 46000f);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				target.starTexture = EditorGUILayout.ObjectField("Star Texture", target.starTexture, typeof(Texture2D));
				break;
			case 2:
				EditorGUILayout.PrefixLabel("Precipitation Level");
				target.precipitationLevel = EditorGUILayout.Slider(target.precipitationLevel, 2f, 0f);
				EditorGUILayout.PrefixLabel("Cloud Cover");
				target.cloudCover = EditorGUILayout.Slider(target.cloudCover, -5f, 5f);
				EditorGUILayout.PrefixLabel("Glow Variance");
				target.glowVariance = EditorGUILayout.Slider(target.glowVariance, 0f, 20f);
				EditorGUILayout.PrefixLabel("View Distance");
				target.viewDistance = EditorGUILayout.Slider(target.viewDistance, 0f, 20f);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.PrefixLabel("Cloud Direction/Speed");
				target.speed = EditorGUILayout.Vector3Field("", target.speed);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				target.colorVariance1 = EditorGUILayout.Vector3Field("Color Variance 1", target.colorVariance1);
				EditorGUILayout.Separator();
				target.colorVariance2 = EditorGUILayout.Vector3Field("Color Variance 2", target.colorVariance2);
				break;
			case 3:
				EditorGUILayout.PrefixLabel("Rayleigh Level (affects sun color)");
				target.rayleighLevel = EditorGUILayout.Slider(target.rayleighLevel, -20f, 100f);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				target.useSystemTime = EditorGUILayout.Toggle("Use System Time", target.useSystemTime);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.PrefixLabel("Time (if not synced to system time)");
				target.TIME = EditorGUILayout.Slider(target.TIME, 0f, 24f);
				EditorGUILayout.PrefixLabel("Speed of Time");
				target.speedOfTime = EditorGUILayout.Slider(target.speedOfTime, 0f, 0.1f);
				break;
			case 4:
				target.moonTexture = EditorGUILayout.ObjectField("Moon Texture", target.moonTexture, typeof(Texture2D));
				EditorGUILayout.Separator();
				EditorGUILayout.PrefixLabel("Moon Size");
				target.moonSize = EditorGUILayout.Slider(target.moonSize, 0.0f, 50.0f);
				break;
			case 5:
				target.automateWeather = EditorGUILayout.Toggle("Automate weather?", target.automateWeather);
				target.debugMode = EditorGUILayout.Toggle("Debug Mode?", target.debugMode);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.PrefixLabel("Weather Step");
				target.weatherStep = EditorGUILayout.Slider(target.weatherStep, 0f, 0.025f);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.PrefixLabel("Rain Probability");
				target.rainProbability = EditorGUILayout.Slider(target.rainProbability, 0f, 0.01f);
				EditorGUILayout.PrefixLabel("Storm Probability");
				target.stormProbability = EditorGUILayout.Slider(target.stormProbability, 0f, 1.0f);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.PrefixLabel("Storm Duration (0 is infinite)");
				target.stormDuration = EditorGUILayout.Slider(target.stormDuration, 0f, 100.0f);
				EditorGUILayout.PrefixLabel("Storm Localization");
				target.localization = EditorGUILayout.IntSlider(target.localization, 0f, 5000.0f);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.PrefixLabel("Thunder Frequency");
				target.thunderFrequency = EditorGUILayout.Slider(target.thunderFrequency, 0f, 1.0f);
				EditorGUILayout.PrefixLabel("Thunder Volume");
				target.stormVolume = EditorGUILayout.Slider(target.stormVolume, 0f, 1.0f);
				EditorGUILayout.Separator();
				EditorGUILayout.Separator();
				EditorGUILayout.BeginHorizontal();
				target.ambientAudio = EditorGUILayout.ObjectField("Ambient SFX", target.ambientAudio, typeof(AudioClip));
				EditorGUILayout.EndHorizontal();
				EditorGUILayout.BeginHorizontal();
				target.rainAudio = EditorGUILayout.ObjectField("Rain SFX", target.rainAudio, typeof(AudioClip));
				EditorGUILayout.EndHorizontal();
				EditorGUILayout.BeginHorizontal();
				target.stormAudio = EditorGUILayout.ObjectField("Storm SFX", target.stormAudio, typeof(AudioClip));
				EditorGUILayout.EndHorizontal();
				EditorGUILayout.BeginHorizontal();
				target.thunderAudio = EditorGUILayout.ObjectField("Thunder SFX", target.thunderAudio, typeof(AudioClip));
				EditorGUILayout.EndHorizontal();
				break;
		}
		if (GUI.changed)
		{
            EditorUtility.SetDirty (target);
		}
	}
}