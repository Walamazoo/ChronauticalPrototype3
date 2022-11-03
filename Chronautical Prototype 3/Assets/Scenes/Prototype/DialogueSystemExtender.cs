using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using PixelCrushers.DialogueSystem.InkSupport;
using PixelCrushers.DialogueSystem;
using UnityEngine;
using DG.Tweening;

public class DialogueSystemExtender : DialogueSystemInkIntegration
{
    private int storedNumber;
    [SerializeField] GameObject button;
    [SerializeField] JournalManager JournalManager;
    [SerializeField] GameObject customInkFunctions;
    [SerializeField] GameObject[] backgrounds;
    [SerializeField] GameObject currentBackground;
    [SerializeField] SpriteList spriteList;
    [SerializeField] GameObject playerSprite;
    [SerializeField] GameObject NPCSprite;

    Tween fadeInTween;
    Tween fadeOutTween;
    private const string BACKGROUND_TAG = "Background";
    private const string SPEAKER_TAG = "Speaker";
    private const string SPRITE_TAG = "Sprite";
    private const string NPC_TAG = "NPC";

    private Dictionary<string, bool> inkBoolStorage = new Dictionary<string, bool>();
    private Dictionary<string, int> inkIntStorage = new Dictionary<string, int>();
    protected override void BindExternalFunctions(Story story)
    {
        base.BindExternalFunctions(story);
        story.BindExternalFunction("STORE_NUMBER", (string number_key, int stored_number) => {inkIntStorage[number_key] = stored_number;});
        story.BindExternalFunction("GET_NUMBER", (string number_key) => {return inkIntStorage[number_key];});
        story.BindExternalFunction("STORE_BOOL", (string bool_key, bool stored_bool) => {inkBoolStorage[bool_key] = stored_bool;});
        story.BindExternalFunction("GET_BOOL", (string bool_key) => {return inkBoolStorage[bool_key];});
        story.BindExternalFunction("SHOW_BUTTON", () => {button.SetActive(true);});
        story.BindExternalFunction("BUTTON_GONE", () => {button.SetActive(false);});
        story.BindExternalFunction("CREATE_JOURNAL_OBJECT", (string name, string type, string hoverDescription, string fullDescription) => 
                                                            {JournalManager.createJournalObject(name, type, hoverDescription, fullDescription);});
        story.BindExternalFunction("TOGGLE_SLIDER", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSlider(state);});
        story.BindExternalFunction("TOGGLE_SLIDER_INTERACTABLE", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSliderInteractable(state);});



        /*
        story.BindExternalFunction("PLAY_MUSIC", (string music) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayMusic(music);});
        story.BindExternalFunction("STOP_MUSIC", () => {customInkFunctions.GetComponent<CustomInkFunctions>().Stop();});
        story.BindExternalFunction("PLAY_SOUND", (string sound) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlaySound(sound);});
        story.BindExternalFunction("START_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StartEmitter();});
        story.BindExternalFunction("STOP_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StopEmitter();});
        story.BindExternalFunction("SET_PARAMETER", (string name, float par) => {customInkFunctions.GetComponent<CustomInkFunctions>().SetParameter(name, par);});
        */
    }

    protected override void UnbindExternalFunctions(Story story)
        {
            base.UnbindExternalFunctions(story);
            story.UnbindExternalFunction("STORE_NUMBER");
            story.UnbindExternalFunction("GET_NUMBER");
            story.UnbindExternalFunction("STORE_BOOL");
            story.UnbindExternalFunction("GET_BOOL");
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
                        string[] spriteStrings = tagValue.Split(' ');
                        string spriteName = spriteStrings[0].Trim();
                        string spriteExpression = spriteStrings[1].Trim();
                        SetSprite(spriteName, spriteExpression, playerSprite);
                        break;
                    case NPC_TAG:
                        string[] NPCspriteStrings = tagValue.Split(' ');
                        string NPCspriteName = NPCspriteStrings[0].Trim();
                        string NPCspriteExpression = NPCspriteStrings[1].Trim();
                        SetSprite(NPCspriteName, NPCspriteExpression, playerSprite);
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

    private void SetSprite(string spriteName, string expressionName, GameObject currentSprite)
    {
        if(spriteName == "None" || expressionName == "None"){
            currentSprite.GetComponent<SpriteRenderer>().sprite = null;
            return;
        }
        foreach (CharacterSprite character in spriteList.characterSprites)
        {
            if (character.name == spriteName)
            {
                foreach (Sprite expression in character.Expressions)
                {
                    if (expression.name == expressionName)
                    {
                        StartCoroutine(ChangeSprite(expression, currentSprite));
                    }
                }
            }
        }      
    }

    private IEnumerator ChangeSprite(Sprite expression, GameObject currentSprite)
    {
        fadeOutTween = currentSprite.GetComponent<SpriteRenderer>().DOFade(0, 0.25f);
        yield return fadeOutTween.WaitForCompletion();
        currentSprite.GetComponent<SpriteRenderer>().sprite = expression;
        fadeInTween = currentSprite.GetComponent<SpriteRenderer>().DOFade(1, 0.25f);
        yield return fadeInTween.WaitForCompletion();
    }
}
