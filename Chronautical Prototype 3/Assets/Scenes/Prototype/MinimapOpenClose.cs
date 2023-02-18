using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MinimapOpenClose : MonoBehaviour
{
    [SerializeField] GameObject minimapObject;
    bool offOrOn;
    public void OnButtonPressed(bool state){
        offOrOn = state;
        if(offOrOn){
            minimapObject.GetComponent<RectTransform>().localPosition = new Vector2(-5f, -50f);
        }
        else{
            minimapObject.GetComponent<RectTransform>().localPosition = new Vector2(-5f, 200f);
        }
    }
}
