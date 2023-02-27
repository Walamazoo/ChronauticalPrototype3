using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using PixelCrushers.DialogueSystem.InkSupport;
using PixelCrushers.DialogueSystem;
using Ink;

public class SaveLoadSystem : MonoBehaviour
{
    [SerializeField] private TextAsset globalsInkFile;
    [SerializeField] DialogueSystemExtender dialogueSystemExtender;
    [SerializeField] JournalManager journalManager;
    [SerializeField] EnvironmentFilter environmentFilter;
    [SerializeField] SliderController sliderController;

    void Awake()
    {
        Load();
    }

    //Save should be able to be called whenever the player has access to the journal
    public void Save()
    {
        /*
        Take current ink variables from globalsInkFile
        Take journal objects from journalManager
        Take currentLocationNumber and currentPlaceNumber from environmentFilter
        Take currentYear and currentSliderValue from sliderController
        Serialize and save to file
        */
    }   

    //Load should only be called when the player starts up the prologue scene
    void Load(){
        /*
        Take values from file
        Call sialogueSystemExtender's InitializeVariables (will have to modify how it works so it draws the proper variables)
        Call journalManager's createJournalObjects and cretateTiemlineClue methods as many times as needed (based on stored list length)
        Call environmentFilter's setLocation, setCurrentTime, and setFilter(true)
        Call sliderController's SliderDisplayUpdate
        */
    }

    //Only called on the title screen when the player decides to start a new game
    void Clear(){
        /*
        Clear all variables from the serialized file/serialize a new file with blank/default values
        */
    }
}
