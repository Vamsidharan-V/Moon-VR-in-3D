using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class SceneChanger : MonoBehaviour
{
   // public GameObject Camera;
  
    void Start()
    {
        StartCoroutine(Sceneswitch());
    }

    
    IEnumerator Sceneswitch()
    {
        yield return new WaitForSeconds(27);
        SceneManager.LoadScene(2);
    }
    
}
