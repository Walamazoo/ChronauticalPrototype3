using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameQuit : MonoBehaviour
{
    [SerializeField] private GameObject conformationPopupMenu;
    [SerializeField] private CustomInkFunctions customInkFunctions;

    void Update()
    {
        if (Input.GetKey("escape"))
        {
            customInkFunctions.ToggleFilterInteractable(false);
            customInkFunctions.ToggleSliderInteractable(false);
            conformationPopupMenu.SetActive(true);
        }
    }

    public void ConfirmQuit(){
        Application.Quit();
    }
}
