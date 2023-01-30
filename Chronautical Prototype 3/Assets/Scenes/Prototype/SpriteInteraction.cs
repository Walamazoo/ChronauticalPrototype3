using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpriteInteraction : MonoBehaviour
{
    private bool interactable= false;

    public void ToggleInteraction(bool state){
        interactable = state;
    }

    void OnMouseDown(){
        if(interactable){
            Debug.Log(this.name + "was clicked");
        }
    }
}
