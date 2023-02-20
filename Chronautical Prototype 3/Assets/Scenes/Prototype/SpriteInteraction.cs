using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
//using Ink.UnityIntegration;
using PixelCrushers.DialogueSystem.InkSupport;
using PixelCrushers.DialogueSystem;

public class SpriteInteraction : MonoBehaviour
{
    [SerializeField] DialogueSystemInkTrigger trigger;
    private bool interactable= false;

    private Color startcolor;

    public void ToggleInteraction(bool state){
        interactable = state;
    }

    void OnMouseDown(){
        if(interactable){
            trigger.OnUse();
        }
    }

    void OnMouseEnter()
    {
        startcolor = GetComponent<SpriteRenderer>().material.color;
        GetComponent<SpriteRenderer>().material.color = Color.yellow;
     }
    void OnMouseExit()
    {
        GetComponent<SpriteRenderer>().material.color= startcolor;
    }
}
