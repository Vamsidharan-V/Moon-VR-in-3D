using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpeechScript : MonoBehaviour
{
    public AudioSource ad;
    //private GameObject textScreen;
    // private MeshRenderer trigger;
    private bool ad_isPlaying=false;

    void Start()
    {
       // textScreen = this.gameObject.transform.GetChild(0).gameObject;
        //trigger = this.gameObject.transform.GetChild(1).GetComponent<MeshRenderer>();
        //textScreen.SetActive(false);
    }
   

    void OnTriggerEnter(Collider Other)
    {
        /*if (Other.gameObject.tag == "Player")
        {*/
           /* trigger.enabled = false;
            textScreen.SetActive(true);*/
            Debug.Log("Speech trigger");
        if (!ad_isPlaying)
        {
            ad.Play();
            ad_isPlaying = true;
        }
           
        //}
    }
    void OnTriggerExit(Collider Other)
    {
        /* if (Other.gameObject.tag == "Player")
         {*/
        /* trigger.enabled = true;
         textScreen.SetActive(false);*/
        if (ad_isPlaying)
        {
            ad.Pause();
            ad_isPlaying = false;
        }
           

        //}

    }
   /* public void playaudio()
    {
        ad.Play();
    }*/

}
