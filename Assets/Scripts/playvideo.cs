/*using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//using static UnityEngine.Video.VideoPlayer;

public class playvideo : MonoBehaviour
{
    //public VideoPlayer video;
    UnityEngine.Video.VideoPlayer videoPlayer;
   

    // Start is called before the first frame update
    void Start()
    {
        //GameObject video = GameObject.Find("VideoCube");
        UnityEngine.Video.VideoPlayer videoPlayer = this.gameObject.GetComponent<UnityEngine.Video.VideoPlayer>();

    }

    // Update is called once per frame
    void Update()
    {
        
    }
    void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "Player")
        {
            videoPlayer.Play();
        }
    }
    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            videoPlayer.Stop();
        }
    }

}
*/