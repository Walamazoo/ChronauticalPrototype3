using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

//https://www.youtube.com/watch?v=ijVA5Z-Mbh8
//https://www.youtube.com/watch?v=yTWPcimAdvY

public class TitleMenu : MonoBehaviour
{
    //[Header("File Storage Config")]
    [SerializeField] private Button newGameButton;
    [SerializeField] private Button continueGameButton;
    [SerializeField] private Button settingsButton;
    [SerializeField] private GameObject conformationPopupMenu;

    /*
    private void start(){
        if(!DataPersistenceManager.instance.HasGamedata()){
            continueGameButton.interactable = false;
        }
    }
    */

    public void OnNewGameClicked(){
        DisableMenuButtons();
        conformationPopupMenu.SetActive(true);
    }

    public void OnConfirmClicked(){
        conformationPopupMenu.SetActive(false);

        //Create a new game - which will initiate our game data
        //DataPersistenceManager.instance.NewGame();
        //Load the gameplay scene - which will in turn save the game because of
        //OnSceneLoaded() in the DataPersistenceManager

        //Clears player prefs
        //PlayerPrefs.DeleteAll();

        SceneManager.LoadSceneAsync("Prologue");
    }

    public void OnCancelClicked(){
        conformationPopupMenu.SetActive(false);
        EnableMenuButtons();
    }

    public void OnContinueGameClicked(){
        DisableMenuButtons();
        //Save the game anytime before loading a new scene
        //DataPersistenceManager.instance.SaveGame();
        //Load the next scene - which will in turn Load the game because of
        //OnSceneLoaded() in the DataPersistenceManager
        SceneManager.LoadSceneAsync("Prologue");
        //TODO - Replace with current scene parameter
    }

    public void OnSettingsClicked(){
        DisableMenuButtons();
    }

    private void DisableMenuButtons(){
        newGameButton.interactable = false;
        continueGameButton.interactable = false;
        settingsButton.interactable = false;
    }

    private void EnableMenuButtons(){
        newGameButton.interactable = true;
        continueGameButton.interactable = true;
        settingsButton.interactable = true;
    }
}
