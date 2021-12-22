using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class gameassist : MonoBehaviour
{
    private Text message;
    public TextWriter textWriter;
    private string msg = "Hello! Welcome to the Natural Satellite \n Here are some Tips to Explore the Moon \n You can see the Red Markers When You Enter the marker you can know about the facts of the Moon with Audio \n There are also Satellites which are sent from Earth with distance waypoints.If you go near that you can know the Information about that too \n So Happy Exploring!";
    //public float speed = 1f;
    // Start is called before the first frame update
    void Awake()
    {
        message = transform.Find("Message").Find("Text").GetComponent<Text>();
    }
    void Start()
    {

        textWriter.writer(message, msg, .05f);
    }


   
}
