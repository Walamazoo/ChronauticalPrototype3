using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
using Ink.UnityIntegration;
using PixelCrushers.DialogueSystem.InkSupport;
using PixelCrushers.DialogueSystem;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using System.IO;

public class DialogueSystemExtender : DialogueSystemInkIntegration
{
    [SerializeField] private InkFile globalsInkFile;
    [SerializeField] GameObject button;
    [SerializeField] JournalManager JournalManager;
    [SerializeField] GameObject customInkFunctions;
    [SerializeField] GameObject[] backgrounds;
    [SerializeField] GameObject currentBackground;
    [SerializeField] GameObject speakerText;
    [SerializeField] SpriteList spriteList;
    [SerializeField] GameObject playerSprite;
    [SerializeField] GameObject NPCSprite;

    Tween fadeInTween;
    Tween fadeOutTween;
    private const string BACKGROUND_TAG = "background";
    private const string SPEAKER_TAG = "speaker";
    private const string SPRITE_TAG = "sprite";
    private const string NPC_TAG = "NPC";

    public Dictionary<string, Ink.Runtime.Object> inkVariableStorage = new Dictionary<string, Ink.Runtime.Object>();

    protected override void Awake()
    {
        base.Awake();
        initializeVariables();
    }

    protected override void BindExternalFunctions(Story story)
    {
        base.BindExternalFunctions(story);

        story.BindExternalFunction("SHOW_BUTTON", () => {button.SetActive(true);});
        story.BindExternalFunction("BUTTON_GONE", () => {button.SetActive(false);});
        story.BindExternalFunction("CREATE_JOURNAL_OBJECT", (string name, string type, string hoverDescription, string fullDescription) => 
                                                            {JournalManager.createJournalObject(name, type, hoverDescription, fullDescription);});
        story.BindExternalFunction("TOGGLE_SLIDER", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSlider(state);});
        story.BindExternalFunction("TOGGLE_SLIDER_INTERACTABLE", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSliderInteractable(state);});



        
        story.BindExternalFunction("PLAY_MUSIC", (string music) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayMusic(music);});
        story.BindExternalFunction("PLAY_AMBIENCE", (string ambience) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayAmbience(ambience);});
        story.BindExternalFunction("STOP_MUSIC", () => {customInkFunctions.GetComponent<CustomInkFunctions>().Stop();});
        story.BindExternalFunction("PLAY_SOUND", (string sound) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlaySound(sound);});
        story.BindExternalFunction("START_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StartEmitter();});
        story.BindExternalFunction("STOP_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StopEmitter();});
        story.BindExternalFunction("SET_PARAMETER", (string parName, int value) => {customInkFunctions.GetComponent<CustomInkFunctions>().SetParameter(parName, value);});
        
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

            story.BindExternalFunction("PLAY_MUSIC", (string music) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayMusic(music);});
            story.BindExternalFunction("PLAY_AMBIENCE", (string ambience) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayAmbience(ambience);});
            story.BindExternalFunction("STOP_MUSIC", () => {customInkFunctions.GetComponent<CustomInkFunctions>().Stop();});
            story.BindExternalFunction("PLAY_SOUND", (string sound) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlaySound(sound);});
            story.BindExternalFunction("START_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StartEmitter();});
            story.BindExternalFunction("STOP_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StopEmitter();});
            story.BindExternalFunction("SET_PARAMETER", (string parName, float value) => {customInkFunctions.GetComponent<CustomInkFunctions>().SetParameter(parName, value);});
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
                        speakerText.GetComponent<Text>().text = tagValue;
                        break;
                    case SPRITE_TAG:
                        string[] spriteStrings = tagValue.Split('_');
                        string spriteName = spriteStrings[0].Trim();
                        string spriteExpression = tagValue;
                        SetSprite(spriteName, spriteExpression, playerSprite);
                        break;
                    case NPC_TAG:
                        if(tagValue == "None"){
                            SetSprite("None", "None", NPCSprite);
                        }
                        else{
                            string[] NPCspriteStrings = tagValue.Split('_');
                            string NPCspriteName = NPCspriteStrings[0].Trim();
                            string NPCspriteExpression = tagValue;
                            SetSprite(NPCspriteName, NPCspriteExpression, NPCSprite);
                        }
                        break;
                    default:
                        Debug.Log("Tag came in but is not currently being handeled: " + tag);
                        break;
                }
            }
    }

    private void initializeVariables(){
        string filePath = globalsInkFile.filePath;
        string inkFileContents = File.ReadAllText(filePath);
        Ink.Compiler compiler = new Ink.Compiler(inkFileContents);
        Story globalVariablesStory = compiler.Compile();

        foreach(string name in globalVariablesStory.variablesState){
            Ink.Runtime.Object value = globalVariablesStory.variablesState.GetVariableWithName(name);
            inkVariableStorage.Add(name, value);
            Debug.Log(name + " was added to the dictionary with value = " + value);
        }
    }

    protected override void ObserveStoryVariables(Story story)
    {
        variablesToStory(story);
        base.ObserveStoryVariables(story);
    }

    protected override void OnVariableChange(string variableName, object newValue)
    {
        if(inkVariableStorage.ContainsKey(variableName)){
            Debug.Log("Before removal " + variableName + " was = " + inkVariableStorage[variableName]);
            inkVariableStorage.Remove(variableName);
            var activeStory = GetCurrentStory(DialogueManager.lastConversationID);
            Ink.Runtime.Object temp = activeStory.variablesState.GetVariableWithName(variableName);
            inkVariableStorage.Add(variableName, temp);
            Debug.Log("After addition " + variableName + " is = " + inkVariableStorage[variableName]);
        }
        base.OnVariableChange(variableName, newValue);
    }

    protected override void OnConversationEnd(Transform actor)
    {
        base.OnConversationEnd(actor);
        for (int i = 0; i < inkJSONAssets.Count; i++)
            {
                var activeStory = stories[i];
                customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSliderInteractable(true);
            }
        
        
    }

    public void setTime(int value){
        for (int i = 0; i < inkJSONAssets.Count; i++)
            {
                if (string.Equals(inkJSONAssets[i].name, DialogueManager.lastConversationStarted))
                {
                    var activeStory = stories[i];
                    activeStory.variablesState["time"] = value;
                }
            }
    }

    private void variablesToStory(Story story){
        Debug.Log("New story was run");
        foreach(KeyValuePair<string, Ink.Runtime.Object> variable in inkVariableStorage){
            story.variablesState.SetGlobal(variable.Key, variable.Value);
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
