using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class CustomInkFunctions : MonoBehaviour
{
    [SerializeField] GameObject timeSliderUI;
    [SerializeField] Button[] travelButtons;
    [SerializeField] Button[] miniMap;
    [SerializeField] Slider slider;

    FMOD.Studio.EventInstance gameMusic;
    FMOD.Studio.EventInstance gameAmbience;

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
            foreach(Button bt in travelButtons){
                bt.interactable = false;
            }
            foreach(Button room in miniMap){
                room.interactable = false;
            }
        }
        else{
            slider.interactable = true;
            foreach(Button bt in travelButtons){
                bt.interactable = true;
            }
            foreach(Button room in miniMap){
                room.interactable = true;
            }
        }
    }

    
    public void PlayMusic (string music)
    {
        gameMusic = FMODUnity.RuntimeManager.CreateInstance(music);
        gameMusic.start();
    }

    public void PlayAmbience (string ambience)
    {
        gameAmbience = FMODUnity.RuntimeManager.CreateInstance(ambience);
        gameAmbience.start();
    }

    public void Stop ()
    {
        gameMusic.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
    }

    public void PlaySound (string sound)
    {
        FMODUnity.RuntimeManager.PlayOneShot(sound);
    }

    public void StartEmitter ()
    {
        GameObject.Find("Variable Storage").GetComponent<FMODUnity.StudioEventEmitter>().Play();
    }
    
    public void StopEmitter ()
    {
        GameObject.Find("Variable Storage").GetComponent<FMODUnity.StudioEventEmitter>().Stop();
    }

    public void SetParameter (string parName, int value)
    {
        Debug.Log("Parameter name is: " + parName);
        Debug.Log("Value is: " + value);
        FMODUnity.RuntimeManager.StudioSystem.setParameterByName(parName, value);
        //gameMusic.setParameterByName(parName, value);
    }
    
}
