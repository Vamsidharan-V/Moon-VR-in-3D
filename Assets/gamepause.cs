using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class gamepause : MonoBehaviour
{
    public static bool isPaused = false;
    public GameObject UI;
    //[SerializeField]private Camera playerCam;
   //[SerializeField]private Camera menuCam;
    // Start is called before the first frame update
    void Start()
    {
       // playerCam = GetComponent<Camera>();
       // menuCam = GetComponent<Camera>();
        //menuCam.enabled=false;
        UI.SetActive(false);
 
    }

    // Update is called once per frame
    void Update()
    {
        //if(UI!=null)
        //if(Input.GetKeyDown(KeyCode.Escape))
        if(OVRInput.GetDown(OVRInput.Button.Three)||Input.GetKeyDown(KeyCode.Escape))
        {
            if(isPaused)
            {

                Resume();
            }
            else 
            {
                
                Pause();
            }
            
        }
        if(isPaused)
        {
            if (OVRInput.GetDown(OVRInput.Button.Four) || Input.GetKeyDown(KeyCode.Q))
            {
                Debug.Log("Quit PRESSED");
                Quit();
            }
        }

    }
    public void Pause()
    {
       // menuCam.enabled = true;
        //playerCam.enabled=false;
        UI.SetActive(true);
        Time.timeScale = 0f;
        isPaused = true;
        
    }
    public void Resume()
    {
        //menuCam.enabled=false;
       // playerCam.enabled=true;
        UI.SetActive(false);
        Time.timeScale = 1f;
        isPaused = false;
    }
    public void Quit()
    {
        Debug.Log("QUIT");
        Application.Quit();
    }
}
