using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Secondscene : MonoBehaviour
{
    
    
    public void scene_1()
    {
        
        SceneManager.LoadScene(1);
    }
    public void gotospace()
    {
        SceneManager.LoadScene(3);
    }
    public void Quit()
    {
        Application.Quit();
    }
    public void go_to_mainmenu()
    {
        SceneManager.LoadScene(0);
    }
}
