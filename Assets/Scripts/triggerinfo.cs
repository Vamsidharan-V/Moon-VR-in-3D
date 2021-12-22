using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class triggerinfo : MonoBehaviour
{
      public GameObject UIText;
    public GameObject interact;
    
   
    
    void Start()
    {
        //interact.transform.position = this.gameObject.transform.position;
        UIText.SetActive(false);
        interact.SetActive(false);
    }

    // Update is called once per frame
    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player") 
        {
            //interact.SetActive(false);
            
                interact.SetActive(false);
                UIText.SetActive(true);
                
                StartCoroutine("disableinfo");
            

        }
        
    }
    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            interact.SetActive(false);
            UIText.SetActive(false);
        }
        
    }
    IEnumerator disableinfo()
    {
        yield return new WaitForSeconds(10);
        UIText.SetActive(false);
        
    }
}

