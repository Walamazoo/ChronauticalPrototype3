using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class CustomInkFunctions : MonoBehaviour
{
    [SerializeField] GameObject timeSliderUI;
    [SerializeField] Button travelButton;
    [SerializeField] Slider slider;

    public void ToggleSlider(bool state){
        if(state == true){
            timeSliderUI.SetActive(true);
        }
        else{
            timeSliderUI.SetActive(false);
        }
    }

    public void ToggleSliderInteractable(bool state){
        if(state == false){
            slider.interactable = false;
            travelButton.interactable = false;
            //foreach(Button room in miniMap){
                //room.interactable = false;
            //}
        }
        else{
            slider.interactable = true;
            travelButton.interactable = true;
            //foreach(Button room in miniMap){
                //room.interactable = true;
            //}
        }
    }
}
