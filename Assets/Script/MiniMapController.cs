using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MapObject

{
    public Image icon { get; set; }
    public GameObject owner { get; set; }
}

public class MiniMapController : MonoBehaviour
{
    public Transform playerPos;
    public Camera mapCamera;
    public static List<MapObject> mapObjects = new List< MapObject >();
    public static void RegisterMapObject(GameObject o,Image i)
    {
        Image image = Instantiate(i);
        mapObjects.Add(new MapObject() { owner = o, icon = image });
    }
    public static void RemoveMapObject(GameObject o)
    {
        List<MapObject> newList = new List<MapObject>();
        for(int i=0;i<mapObjects.Count;i++)
        {
            if (mapObjects[i].owner == o)
            {
                Destroy(mapObjects[i].icon);
                continue;
            }
            else
                newList.Add(mapObjects[i]);
        }

        mapObjects.RemoveRange(0, mapObjects.Count);
        mapObjects.AddRange(newList);
    }
    void DrawMapIcons()
    {
        foreach (MapObject mo in mapObjects)
        {
            Vector3 screenPos = mapCamera.WorldToViewportPoint(mo.owner.transform.position);
            mo.icon.transform.SetParent(this.transform);
            screenPos.z = 0;
            mo.icon.transform.position = screenPos;
        }

    }
    private void Update()
    {
        DrawMapIcons();
    }
}
