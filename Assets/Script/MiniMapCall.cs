using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MiniMapCall : MonoBehaviour
{
    public Image image;
    // Start is called before the first frame update
    void Start()
    {
        MiniMapController.RegisterMapObject(this.gameObject, image);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    void OnDestroy()
    {
        MiniMapController.RemoveMapObject(this.gameObject);
    }
}
