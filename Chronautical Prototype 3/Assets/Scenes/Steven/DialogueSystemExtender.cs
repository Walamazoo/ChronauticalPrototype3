using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using PixelCrushers.DialogueSystem.InkSupport;
using UnityEngine;

public class DialogueSystemExtender : DialogueSystemInkIntegration
{
    int storedNumber;
    [SerializeField] GameObject button;
    [SerializeField] JournalManager JournalManager;
    [SerializeField] GameObject customInkFunctions;

    protected override void BindExternalFunctions(Story story)
    {
        base.BindExternalFunctions(story);
        story.BindExternalFunction("STORE_NUMBER", (int stored_number) => {this.storedNumber = stored_number;});
        story.BindExternalFunction("GET_NUMBER", () => {story.variablesState["number"] = storedNumber;});
        story.BindExternalFunction("SHOW_BUTTON", () => {button.SetActive(true);});
        story.BindExternalFunction("BUTTON_GONE", () => {button.SetActive(false);});
        story.BindExternalFunction("MAKE_LOG", () => {button.GetComponent<testbuttonscript>().makeLog();});
        story.BindExternalFunction("CREATE_JOURNAL_OBJECT", (string name, string type, string hoverDescription, string fullDescription) => 
                                                            {JournalManager.createJournalObject(name, type, hoverDescription, fullDescription);});
        story.BindExternalFunction("TOGGLE_SLIDER", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSlider(state);});
        story.BindExternalFunction("TOGGLE_SLIDER_INTERACTABLE", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSliderInteractable(state);});
    }

    protected override void UnbindExternalFunctions(Story story)
        {
            base.UnbindExternalFunctions(story);
            story.UnbindExternalFunction("STORE_NUMBER");
            story.UnbindExternalFunction("GET_NUMBER");
            story.UnbindExternalFunction("SHOW_BUTTON");
            story.UnbindExternalFunction("BUTTON_GONE");
            story.UnbindExternalFunction("MAKE_LOG");
            story.UnbindExternalFunction("TOGGLE_SLIDER");
            story.UnbindExternalFunction("TOGGLE_SLIDER_INTERACTABLE");
        }
}
