using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class buttonaud : MonoBehaviour
{
    public AudioSource am;
    public GameObject abutton;

    void OnTriggerEnter(Collider Other)
    {
        if (Other.gameObject.tag == "Player")
        {
            //ad.Play();
            abutton.SetActive(true);
        }
    }
    void OnTriggerExit(Collider Other)
    {
        if (Other.gameObject.tag == "Player")
        {
            //ad.Stop();
            abutton.SetActive(false);

        }

    }
    public void playaudio()
    {
        am.Play();
    }
   
}
