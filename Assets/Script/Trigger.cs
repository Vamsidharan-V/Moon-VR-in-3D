using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Trigger : MonoBehaviour
{
    public GameObject Uinterface;
    private void Start()
    {
        Uinterface.SetActive(false);
    }
    

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            Uinterface.SetActive(true);
          

        }
    }
    private void OnTriggerExit(Collider other)
    {
        if(other.gameObject.tag=="Player")
        {
            Uinterface.SetActive(false);
            Destroy(GetComponent<BoxCollider>());
        }
    }












}
