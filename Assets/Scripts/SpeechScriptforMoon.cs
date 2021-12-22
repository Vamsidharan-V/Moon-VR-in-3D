using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class SpeechScriptforMoon : MonoBehaviour
{
    public AudioSource adio;
    public GameObject textScreen;
    public MeshRenderer trigger;
    private bool adio_isPlaying = false;

    void Start()
    {
        textScreen = this.gameObject.transform.GetChild(0).gameObject;
        trigger = this.gameObject.transform.GetChild(1).GetComponent<MeshRenderer>();
        textScreen.SetActive(false);
        
    }


   public void OnTriggerEnter(Collider Other)
    {
        if (Other.gameObject.tag == "Player")
        {
            trigger.enabled = false;
            textScreen.SetActive(true);
            Debug.Log("Speech trigger");
            adio.enabled = true;
            if (!adio_isPlaying)
            {
                adio.Play();
                adio_isPlaying = true;
            }
        }

        //}
    }
    void OnTriggerExit(Collider Other)
    {
        if (Other.gameObject.tag == "Player") { 
         
        trigger.enabled = true;
         textScreen.SetActive(false);
        if (adio_isPlaying)
        {
            adio.Pause();
            adio_isPlaying = false;
        }


        }

    }
    public void playaudio()
    {
        adio.Play();
    }

}
