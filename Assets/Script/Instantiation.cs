using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Instantiation : MonoBehaviour
{
    public GameObject asteroids;
    float x, z;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        x = Random.Range(-100, 100);
        z = Random.Range(-10, 100);
        Vector3 pos = new Vector3(x, 0.0f, z);
        for (int i = 0; i < 30; i++)
        {
            Instantiate(asteroids, pos, Quaternion.identity);
        }
    }
}
