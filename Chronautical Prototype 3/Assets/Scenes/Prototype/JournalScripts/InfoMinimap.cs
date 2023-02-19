using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InfoMinimap : MonoBehaviour
{
    [SerializeField] SliderController sliderController;
    public int myYear;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnorOff(){
        if(sliderController.currentYear % 10 == myYear){
            gameObject.SetActive(true);
        }
        else{
            gameObject.SetActive(false);
        }
    }
}
