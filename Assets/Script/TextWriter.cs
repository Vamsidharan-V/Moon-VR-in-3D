using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class TextWriter : MonoBehaviour
{
    private Text Uitext;
    private string text;
    private float charpersec;
    private float timer;
    private int charIndex;
    [SerializeField] private GameObject canvas;
    [SerializeField] private GameObject full;
    [SerializeField] private AudioSource ad;
    private bool canvasOn;
    //[SerializeField] private GameObject canvascam;
    public void writer(Text Uitext, string text, float charpersec)
    {
        this.Uitext = Uitext;
        this.text = text;
        this.charpersec = charpersec;
        charIndex = 0;
    }
    private void Start()
    {
        canvas = this.transform.parent.gameObject;
    }
    private void Update()
    {
        
        if(Uitext!=null)
        {
            timer -= Time.deltaTime;
            if(timer<=0)
            {
                timer += charpersec;
                charIndex++;
                Uitext.text = text.Substring(0, charIndex);
                
                
                if (charIndex >= text.Length)
                {
                    Uitext = null;
                    
                }
                  
            }
        }
        if (Uitext == null)
        {
            
            full.SetActive(true);
            canvas.SetActive(false);
           // canvascam.SetActive(false);
        }
        
    }
    void OnEnable()
    {
        SceneManager.sceneLoaded += loadInfo;
    }
    void loadInfo(Scene scene,LoadSceneMode mode)
    {
        ad.Play();

        full.SetActive(false);
    }
}
