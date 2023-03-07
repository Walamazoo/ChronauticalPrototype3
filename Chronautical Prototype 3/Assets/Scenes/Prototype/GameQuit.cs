using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameQuit : MonoBehaviour
{
    [SerializeField] private GameObject conformationPopupMenu;
    [SerializeField] private CustomInkFunctions customInkFunctions;
    [SerializeField] GameObject journalButton;
    [SerializeField] GameObject minimapButton;

    void Update()
    {
        if (Input.GetKey("escape"))
        {
            customInkFunctions.ToggleFilterInteractable(false);
            customInkFunctions.ToggleSliderInteractable(false);
            journalButton.GetComponent<Button>().interactable = false;
            minimapButton.GetComponent<Button>().interactable = false;
            conformationPopupMenu.SetActive(true);
        }
    }

    public void ConfirmQuit(){
        Application.Quit();
    }

    public void ConfirmCancel(){
        customInkFunctions.ToggleFilterInteractable(true);
        customInkFunctions.ToggleSliderInteractable(true);
        journalButton.GetComponent<Button>().interactable = true;
        minimapButton.GetComponent<Button>().interactable = true;
        conformationPopupMenu.SetActive(false);
    }
}
