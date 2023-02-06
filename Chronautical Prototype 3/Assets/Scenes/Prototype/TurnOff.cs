using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using PixelCrushers.DialogueSystem;
using PixelCrushers.DialogueSystem.InkSupport;
using Ink.Runtime;

public class TurnOff : MonoBehaviour
{
    //[SerializeField] GameObject player;

    void OnConversationEnd(){
        gameObject.SetActive(false);
    }
}
