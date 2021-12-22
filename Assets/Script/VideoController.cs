/*using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VideoController : MonoBehaviour
{
    public GameObject Canvas;
    GameObject play;
    GameObject pause;
    // Start is called before the first frame update
    void Start()
    {
        Canvas.SetActive(false);
        play = GameObject.FindWithTag("play");
        pause = GameObject.FindWithTag("pause");
    }

    // Update is called once per frame
    void Update()
    {
        void OnTriggerEnter (Collider col)
        {
            if(col.gameObject.tag == "Player")
            {
                bool act_canvas = Canvas.SetActive(true);

            }
            if (act_canvas)
            {
                play.SetActive("true");
                pause.SetActive("true");
            }
            
        }
        void OnTriggerExit(Collider col)
            {
            if(col.gameObject.tag == "Player")
            {
                Canvas.SetActive(false);
            }
        }
    }
}*/
