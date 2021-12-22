using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VideoMarkerScript : MonoBehaviour
{
    [SerializeField] private AudioSource ad;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    void OnTriggerEnter(Collider Other)
    {
        if (Other.gameObject.tag == "Player")
        {
           
            ad.Play();

        }
    }
    void OnTriggerExit(Collider Other)
    {
        if (Other.gameObject.tag == "Player")
        {
           
            ad.Stop();


        }

    }
}
