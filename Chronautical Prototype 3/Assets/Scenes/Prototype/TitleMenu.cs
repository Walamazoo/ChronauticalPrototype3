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

    public void OnNewGameClicked(){
        DisableMenuButtons();
        conformationPopupMenu.SetActive(true);
    }

    public void OnConfirmClicked(){
        conformationPopupMenu.SetActive(false);

        //Make new data

        SceneManager.LoadSceneAsync("Prologue");
    }

    public void OnCancelClicked(){
        conformationPopupMenu.SetActive(false);
        EnableMenuButtons();
    }

    public void OnContinueGameClicked(){
        DisableMenuButtons();
        //Save the game anytime before loading a new scene
        SceneManager.LoadSceneAsync("Prologue");
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
