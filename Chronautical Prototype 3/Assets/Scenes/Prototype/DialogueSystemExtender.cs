using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;
//using Ink.UnityIntegration;
using PixelCrushers.DialogueSystem.InkSupport;
using PixelCrushers.DialogueSystem;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using System.IO;
using Ink;
using System;

public class DialogueSystemExtender : DialogueSystemInkIntegration
{
    [SerializeField] private TextAsset globalsInkFile;
    [SerializeField] GameObject journalButton;
    [SerializeField] GameObject minimapButton;
    [SerializeField] MinimapOpenClose minimap;
    [SerializeField] JournalManager JournalManager;
    [SerializeField] CameraParallax CameraParallax;
    [SerializeField] GameObject customInkFunctions;
    [SerializeField] GameObject[] backgrounds;
    [SerializeField] GameObject currentBackground;
    [SerializeField] GameObject speakerText;
    [SerializeField] SpriteList spriteList;
    [SerializeField] GameObject playerSprite;
    [SerializeField] GameObject NPCSprite;
    [SerializeField] GameObject[] fadeouts;
    [SerializeField] GameObject[] fadeins;

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

        story.BindExternalFunction("TOGGLE_JOURNAL", (bool state) => {journalButton.SetActive(state);});
        story.BindExternalFunction("TOGGLE_MINIMAP", (bool state) => {minimap.OnButtonPressed(state);});
        story.BindExternalFunction("TOGGLE_JOURNAL_INTERACTABLE", (bool state) => journalButton.GetComponent<Button>().interactable = state);
        story.BindExternalFunction("TOGGLE_MINIMAP_INTERACTABLE", (bool state) => minimapButton.GetComponent<Button>().interactable = state);

        story.BindExternalFunction("CREATE_JOURNAL_OBJECT", (string name, string type, string hoverDescription, string fullDescription) => 
                                                            {JournalManager.createJournalObject(name, type, hoverDescription, fullDescription);});
        story.BindExternalFunction("CREATE_TIMELINE_CLUE", (string name, string type, string hoverDescription, string fullDescription) =>
                                                            {JournalManager.createTimelineClue(name, type, hoverDescription, fullDescription);});
        story.BindExternalFunction("TOGGLE_SLIDER", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSlider(state);});
        story.BindExternalFunction("TOGGLE_SLIDER_INTERACTABLE", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSliderInteractable(state);});
        story.BindExternalFunction("TOGGLE_FILTER", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleFilter(state);});
        story.BindExternalFunction("TOGGLE_FILTER_INTERACTABLE", (bool state) => {customInkFunctions.GetComponent<CustomInkFunctions>().ToggleFilterInteractable(state);});
        
        story.BindExternalFunction("PLAY_MUSIC", (string music) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayMusic(music);});
        story.BindExternalFunction("PLAY_AMBIENCE", (string ambience) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayAmbience(ambience);});
        story.BindExternalFunction("STOP_MUSIC", () => {customInkFunctions.GetComponent<CustomInkFunctions>().Stop();});
        story.BindExternalFunction("PLAY_SOUND", (string sound) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlaySound(sound);});
        story.BindExternalFunction("START_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StartEmitter();});
        story.BindExternalFunction("STOP_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StopEmitter();});
        story.BindExternalFunction("SET_PARAMETER", (string parName, int value) => {customInkFunctions.GetComponent<CustomInkFunctions>().SetParameter(parName, value);});

        story.BindExternalFunction("TOGGLE_CAMERA", (bool state) => {CameraParallax.CameraCanMove(state);});

        story.BindExternalFunction("CHANGE_SCENE", (string sceneName) => {customInkFunctions.GetComponent<CustomInkFunctions>().ChangeScene(sceneName);});
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
            story.UnbindExternalFunction("TOGGLE_FILTER");
            story.UnbindExternalFunction("TOGGLE_FILTER_INTERACTABLE");
            story.UnbindExternalFunction("CREATE_JOURNAL_OBJECT");
            story.UnbindExternalFunction("CREATE_TIMELINE_CLUE");

            story.UnbindExternalFunction("TOGGLE_CAMERA");

            story.UnbindExternalFunction("CHANGE_SCENE");

            story.BindExternalFunction("PLAY_MUSIC", (string music) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayMusic(music);});
            story.BindExternalFunction("PLAY_AMBIENCE", (string ambience) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlayAmbience(ambience);});
            story.BindExternalFunction("STOP_MUSIC", () => {customInkFunctions.GetComponent<CustomInkFunctions>().Stop();});
            story.BindExternalFunction("PLAY_SOUND", (string sound) => {customInkFunctions.GetComponent<CustomInkFunctions>().PlaySound(sound);});
            story.BindExternalFunction("START_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StartEmitter();});
            story.BindExternalFunction("STOP_EMITTER", () => {customInkFunctions.GetComponent<CustomInkFunctions>().StopEmitter();});
            story.BindExternalFunction("SET_PARAMETER", (string parName, int value) => {customInkFunctions.GetComponent<CustomInkFunctions>().SetParameter(parName, value);});
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
                        JournalManager.AddToJournalDialogueLog(tagValue + ": ");
                        break;
                    case SPRITE_TAG:
                        if(tagValue == "None"){
                            SetSprite("None", "None", playerSprite);
                        }
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

    protected override void OnConversationStart(Transform actorTransform)
    {
        starting();
        /*for(int i = 0; i < inkJSONAssets.Count; i++){
            if (string.Equals(inkJSONAssets[i].name, DialogueManager.lastConversationStarted)){
                var story = stories[i];
                variablesToStory(story);
            }
        }*/
        CameraParallax.CameraCanMove(false);
        CameraParallax.ResetCamera();
        customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSlider(false);
        customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSliderInteractable(false);
        customInkFunctions.GetComponent<CustomInkFunctions>().ToggleFilterInteractable(false);
        base.OnConversationStart(actorTransform);
    }
    protected override void OnConversationEnd(Transform actor)
    {
        base.OnConversationEnd(actor);
        CameraParallax.CameraCanMove(true);
        SetSprite("None", "None", NPCSprite);
        speakerText.GetComponent<Text>().text = "";
        customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSlider(true);
        customInkFunctions.GetComponent<CustomInkFunctions>().ToggleSliderInteractable(true);
        customInkFunctions.GetComponent<CustomInkFunctions>().ToggleFilterInteractable(true);
        customInkFunctions.GetComponent<CustomInkFunctions>().ToggleFilterVisisble(true);
        ending();
        
    }

    private void ending()
    {
        foreach(GameObject objects in fadeouts){
            objects.SetActive(false);
        }
        foreach(GameObject objects in fadeins){
            objects.SetActive(true);
        }
    }

    private void starting(){
        foreach(GameObject objects in fadeouts){
            objects.SetActive(true);
        }
        foreach(GameObject objects in fadeins){
            objects.SetActive(false);
        }
    }
    private void initializeVariables(){
        /*string filePath = globalsInkFile.filePath;
        string inkFileContents = File.ReadAllText(filePath);
        Ink.Compiler compiler = new Ink.Compiler(globalsInkFile.LoadInkFileContents());
        Story globalVariablesStory = compiler.Compile();

        foreach(string name in globalVariablesStory.variablesState){
            Ink.Runtime.Object value = globalVariablesStory.variablesState.GetVariableWithName(name);
            inkVariableStorage.Add(name, value);
            Debug.Log(name + " was added to the dictionary with value = " + value);
        }*/

        var compiler = new Ink.Compiler(globalsInkFile.ToString());
        Ink.Runtime.Story story = compiler.Compile();

        foreach(string name in story.variablesState){
            Ink.Runtime.Object value = story.variablesState.GetVariableWithName(name);
            inkVariableStorage.Add(name, value);
            Debug.Log(name + " was added to the dictionary with value = " + value);
        }
        
        /*var compiler2 = new Ink.Compiler(globalsInkFile.ToString(), new Compiler.Options
        {
	        countAllVisits = true,
	        fileHandler = new UnityInkFileHandler(System.IO.Path.GetDirectoryName("Assets/StreamingAssets/Globals.ink"))
        });
        Ink.Runtime.Story story2 = compiler.Compile();*/
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
        if(currentSprite.Equals(playerSprite)){
            if(spriteName == "None" || expressionName == "None"){
                currentSprite.GetComponent<Image>().sprite = null;
                 currentSprite.GetComponent<Image>().color = new Color32(217,198,155,100);
                return;
            }
        }
        else{
            if(spriteName == "None" || expressionName == "None"){
                currentSprite.GetComponent<SpriteRenderer>().sprite = null;
                return;
            }
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
        if(currentSprite.Equals(NPCSprite)){
            fadeOutTween = currentSprite.GetComponent<SpriteRenderer>().DOFade(0, 0.25f);
            yield return fadeOutTween.WaitForCompletion();
            currentSprite.GetComponent<SpriteRenderer>().sprite = expression;
            fadeInTween = currentSprite.GetComponent<SpriteRenderer>().DOFade(1, 0.25f);
            yield return fadeInTween.WaitForCompletion();
        }

        else{
            fadeOutTween = currentSprite.GetComponent<Image>().DOFade(0,0.25f);
            yield return fadeOutTween.WaitForCompletion();
            currentSprite.GetComponent<Image>().sprite = expression;
            fadeInTween = currentSprite.GetComponent<Image>().DOFade(1,0.25f);
            yield return fadeInTween.WaitForCompletion();
        }
    }

    private void AddToDialogueLog(string adder){
        JournalManager.AddToJournalDialogueLog(adder);
    }

    protected override void OnPrepareConversationLine(DialogueEntry entry)
    {
        if (entry.id == 0 || !storyDict.ContainsKey(entry.conversationID))
            {
                // START entry or not a fake Ink conversation: Do nothing special.
                return;
            }
            var activeStory = storyDict[entry.conversationID];
            var inkConversation = (lastInkConversation != null && lastInkConversation.id == entry.conversationID) ? lastInkConversation
                : DialogueManager.masterDatabase.GetConversation(entry.conversationID);
            lastInkConversation = inkConversation;

            if (debug) Debug.Log($"[{Time.frameCount}] PrepareLine [{entry.conversationID}:{entry.id}]");

            //-----------------------------------------------------------------------------------------------------------------------------
            // If entry id 1, continue Ink story and show next Ink content as subtitle (or player menu if always force player menu):
            if (entry.id == 1)
            {
                // If jump is specified, jump there:
                if (!string.IsNullOrEmpty(jumpToKnot))
                {
                    activeStory.ChoosePathString(jumpToKnot);
                    jumpToKnot = string.Empty;
                }

                entry.outgoingLinks.Clear();
                inkConversation.dialogueEntries.RemoveAll(x => x.id >= 2);

                // If we can't continue, show choices or stop conversation: (early exit)
                if (!activeStory.canContinue)
                {
                    if (activeStory.currentChoices.Count > 0)
                    {
                        entry.DialogueText = activeStory.currentText;
                        AddChoices(activeStory, inkConversation, entry);
                    }
                    else
                    {
                        entry.DialogueText = string.Empty;
                        entry.Sequence = "Continue()";
                        return;
                    }
                }

                // Get next story text:
                var text = isResuming ? activeStory.currentText : activeStory.Continue();
                var text2 = text;

                if (isPlayerSpeaking)
                {
                    if (!string.IsNullOrEmpty(lastPlayerChoice) && !text.StartsWith(lastPlayerChoice))
                    {
                        // Player line was silent, so this is the next line:
                        isPlayerSpeaking = false;
                    }
                }
                lastPlayerChoice = string.Empty;
                if (trimText) text = text.Trim();
                var currentStoryPlayerID = GetCurrentPlayerID(entry.conversationID);
                var currentStoryActorID = GetCurrentActorID(entry.conversationID);
                entry.ActorID = isPlayerSpeaking ? currentStoryPlayerID : currentStoryActorID;
                entry.ConversantID = isPlayerSpeaking ? currentStoryActorID : currentStoryPlayerID;
                if (isPlayerSpeaking && appendNewlineToPlayerResponses) text += "\n";
                isResuming = false;
                if (actorNamesPrecedeLines) TryExtractPrependedActor(ref text, entry);
                ProcessTags(activeStory, entry);
                AddToDialogueLog(text2);
                entry.DialogueText = text;
                entry.Sequence = string.Empty;
                var isPlayerLine = entry.ActorID == PlayerActorID || 
                    (storyPlayerIDDict.ContainsKey(entry.conversationID) && entry.ActorID == storyPlayerIDDict[entry.conversationID]);
                var hasChoices = activeStory.currentChoices.Count > 0;
                var forceSingleChoiceMenu = !isPlayerSpeaking && !hasChoices && isPlayerLine && DialogueManager.displaySettings.inputSettings.alwaysForceResponseMenu;
                isPlayerSpeaking = false;

                // Prepare outgoing links:
                if (forceSingleChoiceMenu)
                {
                    AddForcedResponse(activeStory, inkConversation, entry);
                }
                else if (hasChoices)
                {
                    AddChoices(activeStory, inkConversation, entry);
                }
                else if (activeStory.canContinue)
                {
                    // Add loopback entry:
                    var loopEntry = template.CreateDialogueEntry(2, inkConversation.id, "Forced Choice");
                    loopEntry.ActorID = currentStoryActorID;
                    loopEntry.Sequence = "Continue()";
                    loopEntry.outgoingLinks.Add(new Link(inkConversation.id, 2, inkConversation.id, 1));
                    inkConversation.dialogueEntries.Add(loopEntry);
                    entry.outgoingLinks.Add(new Link(inkConversation.id, 1, inkConversation.id, 2));
                }
            }

            //-----------------------------------------------------------------------------------------------------------------------------
            // If looping back from forced choice, reset entry 1:
            else if (entry.Title == "Forced Choice")
            {
                if (debug) Debug.Log($"[{Time.frameCount}] Loopback from forced choice [{entry.conversationID}]");

                var entry1 = inkConversation.dialogueEntries.Find(x => x.id == 1);
                entry1.ActorID = StoryActorID; // Prevent menu.
            }

            //-----------------------------------------------------------------------------------------------------------------------------
            // Choice entry: Choose choice.
            else
            {
                var choiceIndex = Field.LookupInt(entry.fields, "Choice Index");

                if (debug) Debug.Log($"[{Time.frameCount}] ChooseChoice [{entry.conversationID}:{entry.id}] {choiceIndex}");

                if (!(0 <= choiceIndex && choiceIndex < activeStory.currentChoices.Count))
                {
                    Debug.LogWarning($"Dialogue System: Internal Ink integration error. Choice index is {choiceIndex} but story only has {activeStory.currentChoices.Count} choices.");
                }
                else
                {
                    activeStory.ChooseChoiceIndex(choiceIndex);
                }

                var entry1 = inkConversation.dialogueEntries.Find(x => x.id == 1);
                entry1.ActorID = StoryActorID; // Prevent menu.
                isPlayerSpeaking = true;
                lastPlayerChoice = entry.subtitleText;
                if (activeStory.canContinue)
                {
                    var savedState = activeStory.state.ToJson();
                    activeStory.Continue();
                    if (!string.IsNullOrEmpty(activeStory.currentText.Trim()))
                    {
                        //Debug.Log("<color=yellow>Keeping next line after: </color>" + lastPlayerChoice + ":[" + activeStory.currentText + "]");
                        activeStory.state.LoadJson(savedState);
                    }
                    else
                    {
                        //Debug.Log("<color=yellow>Dumping blank line after:</color> " + lastPlayerChoice);
                    }
                }
            }
    }

}
