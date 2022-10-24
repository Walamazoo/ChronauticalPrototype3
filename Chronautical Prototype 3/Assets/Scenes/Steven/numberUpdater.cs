using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using PixelCrushers.DialogueSystem.InkSupport;
using Ink.Runtime;

public class numberUpdater : MonoBehaviour
{

    // Set this file to your compiled json asset
	public TextAsset inkAsset;
	Story story;
    
    [SerializeField] TextMeshProUGUI text;

    void Awake()
    {
        story = new Story(inkAsset.text);
        story.BindExternalFunction("SetVariables", () => { this.SetVariables(); });
    }

    public void NumUpdate(){
        int num=(int)DialogueSystemInkIntegration.GetInkNumber("number")+1;
        DialogueSystemInkIntegration.SetInkNumber("number", num);
        story.variablesState["number"] = (double)num;
    }

    public void TextUpdate(){
        text.text = "Number: " + (int)DialogueSystemInkIntegration.GetInkNumber("number");
    }

    public void SetVariables(){
        story.variablesState["number"] = DialogueSystemInkIntegration.GetInkNumber("number");
    }

}
