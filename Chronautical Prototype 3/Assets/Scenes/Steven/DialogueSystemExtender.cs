using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using PixelCrushers.DialogueSystem.InkSupport;
using UnityEngine;

public class DialogueSystemExtender : DialogueSystemInkIntegration
{
    int storedNumber;
    [SerializeField] GameObject button;

    protected override void BindExternalFunctions(Story story)
    {
        base.BindExternalFunctions(story);
        story.BindExternalFunction("STORE_NUMBER", (int stored_number) => {this.storedNumber = stored_number;});
        story.BindExternalFunction("GET_NUMBER", () => {story.variablesState["number"] = storedNumber;});
        story.BindExternalFunction("SHOW_BUTTON", () => {button.SetActive(true);});
        story.BindExternalFunction("MAKE_LOG", () => {button.GetComponent<testbuttonscript>().makeLog();});
    }

    protected override void UnbindExternalFunctions(Story story)
        {
            base.UnbindExternalFunctions(story);
            story.UnbindExternalFunction("STORE_NUMBER");
            story.UnbindExternalFunction("GET_NUMBER");
            story.UnbindExternalFunction("SHOW_BUTTON");
            story.UnbindExternalFunction("MAKE_LOG");
        }
}
