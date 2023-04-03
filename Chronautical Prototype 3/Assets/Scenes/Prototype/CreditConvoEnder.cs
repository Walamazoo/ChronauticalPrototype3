using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using PixelCrushers.DialogueSystem.InkSupport;
using PixelCrushers.DialogueSystem;
using UnityEngine;

public class CreditConvoEnder : MonoBehaviour
{
    
    [SerializeField] GameObject dialogueSystem;

    void Start()
    {
        dialogueSystem = FindObjectOfType<DialogueSystemExtender>().gameObject;
        PixelCrushers.DialogueSystem.DialogueManager.StopAllConversations();
        //dialogueSystem.SetActive(false);
        
    }

}
