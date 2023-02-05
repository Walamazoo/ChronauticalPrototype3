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

    public void ToggleInteraction(bool state){
        interactable = state;
    }

    void OnMouseDown(){
        if(interactable){
            trigger.OnUse();
        }
    }
}
