using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class waypointscript : MonoBehaviour
{
    public GameObject prefab;
    private Transform waypoint;
    private  Transform Player;
    private Text waypointText;
    private bool inside=false;
    // Start is called before the first frame update
    void Start()
    {
        Player = GameObject.FindGameObjectWithTag("Player").transform;
        var canvas = GameObject.Find("Waypoints").transform;
        waypoint = Instantiate(prefab.transform, canvas);
        waypointText = waypoint.GetComponentInChildren<Text>();
    }

    // Update is called once per frame
    void Update()
    {
        var screenPos = Camera.main.WorldToScreenPoint(transform.position);
        waypoint.position = screenPos;
        if (!inside)
        {
            waypointText.text = Vector3.Distance(Player.position, transform.position).ToString("0") + "m";
        }
        else
        {
            waypointText.text = " ";
        }

      }
    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            prefab.SetActive(false);
            inside = true;


        }
    }
    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            inside = false;
            prefab.SetActive(true);
        }
    }
   
   
}
