using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class Videoplayerscript : MonoBehaviour
{
    private VideoPlayer videoPlayer;
    private MeshRenderer videoPlayermesh;

    // Start is called before the first frame update
    void Start()
    {
        videoPlayermesh = GameObject.FindGameObjectWithTag("video").GetComponent<MeshRenderer>();
        videoPlayermesh.enabled = false;

        videoPlayer = GameObject.FindGameObjectWithTag("video").GetComponent<VideoPlayer>();

        
     }

    // Update is called once per frame
    void Update()
    {
        
    }
    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag=="Player")
        {
            videoPlayermesh.enabled = true;
            videoPlayer.Play();
            this.gameObject.GetComponent<MeshRenderer>().enabled = false;
        }
    }
    private void OnTriggerExit(Collider other)
    {
        videoPlayermesh.enabled = false;
        videoPlayer.Stop();
        this.gameObject.GetComponent<MeshRenderer>().enabled = true;
    }
}
