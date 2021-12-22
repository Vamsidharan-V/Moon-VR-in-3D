using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class NewBehaviourScript : MonoBehaviour
/*{
    public triggerinfo triggerscript;
    // Start is called before the first frame update
    public void Display()
    {
        triggerscript.UIText.SetActive(true);
    }
    public void Exit()
    {
        triggerscript.UIText.SetActive(false);
    }*/
{
    public triggerinfo disable;
    public GameObject disableui;
    void start()
    {
        disable = disableui.GetComponent<triggerinfo>();
    }
    public void disableu()
    {

        disable.UIText.SetActive(false);
    }
    
}


//}
