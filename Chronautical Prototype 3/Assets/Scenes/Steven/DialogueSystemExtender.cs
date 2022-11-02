using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using PixelCrushers.DialogueSystem.InkSupport;
using PixelCrushers.DialogueSystem;
using UnityEngine;
using DG.Tweening;

public class DialogueSystemExtender : DialogueSystemInkIntegration
{
    int storedNumber;
    [SerializeField] GameObject button;
    [SerializeField] JournalManager JournalManager;
    [SerializeField] GameObject customInkFunctions;
    [SerializeField] GameObject[] backgrounds;
    [SerializeField] GameObject currentBackground;

    Tween fadeInTween;
    Tween fadeOutTween;
    private const string BACKGROUND_TAG = "Background";
    private const string SPEAKER_TAG = "Speaker";
    private const string SPRITE_TAG = "Sprite";
    private const string NPC_TAG = "NPC";
    protected override void BindExternalFunctions(Story story)
    {
        base.BindExternalFunctions(story);
        story.BindExternalFunction("STORE_NUMBER", (int stored_number) => {this.storedNumber = stored_number;});
        story.BindExternalFunction("GET_NUMBER", () => {story.variablesState["number"] = storedNumber;});
        story.BindExternalFunction("SHOW_BUTTON", () => {button.SetActive(true);});
        story.BindExternalFunction("BUTTON_GONE", () => {button.SetActive(false);});
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
            story.UnbindExternalFunction("TOGGLE_SLIDER");
            story.UnbindExternalFunction("TOGGLE_SLIDER_INTERACTABLE");
        }

        protected override void ProcessTags(Story activeStory, DialogueEntry entry){
        foreach (var tag in activeStory.currentTags)
            {
                string[] splitTag = tag.Split(':');
                if(splitTag.Length != 2){
                    Debug.Log("Tag could not be appropriately parsed: " + tag);
                }
                string tagKey = splitTag[0].Trim();
                string tagValue = splitTag[1].Trim();

                switch(tagKey){
                    case BACKGROUND_TAG:
                        SetBackground(tagValue);
                        break;
                    case SPEAKER_TAG:
                        break;
                    case SPRITE_TAG:
                        break;
                    case NPC_TAG:
                        break;
                    default:
                        Debug.Log("Tag came in but is not currently being handeled: " + tag);
                        break;
                }
            }
    }

    public void SetBackground(string backgroundName)
    {
        foreach (GameObject background in backgrounds)
        {
            if (background.name == backgroundName)
            {
                StartCoroutine(ChangeBackground(background));
            }
        }
    }

    private IEnumerator ChangeBackground(GameObject background)
    {
        if(currentBackground != null){
            fadeOutTween = currentBackground.GetComponent<SpriteRenderer>().DOFade(0, 0.75f);
            yield return fadeOutTween.WaitForCompletion();
        }
        currentBackground = background;
        fadeInTween = currentBackground.GetComponent<SpriteRenderer>().DOFade(1, 0.75f);
        yield return fadeInTween.WaitForCompletion();
    }
}
