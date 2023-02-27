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
    private new SpriteRenderer renderer;

    public void ToggleInteraction(bool state){
        interactable = state;
    }

    public void ToggleVisible(bool state){
        renderer = GetComponent<SpriteRenderer>();
        Color childColor = renderer.color;
        if(state == true){
            renderer.color = new Color(childColor.r,childColor.g,childColor.b,1f);
        }
        else{
            renderer.color = new Color(childColor.r,childColor.g,childColor.b,0f);
        }
    }

    void OnMouseDown(){
        if(interactable){
            trigger.OnUse();
            ToggleVisible(false);
        }
    }

    void OnMouseEnter()
    {
        startcolor = GetComponent<SpriteRenderer>().material.color;
        if(interactable){
            GetComponent<SpriteRenderer>().material.color = new Color(1.0f, 0.64f, 0.0f);
        }
    }

    void OnMouseExit()
    {
        GetComponent<SpriteRenderer>().material.color= startcolor;
    }
}
