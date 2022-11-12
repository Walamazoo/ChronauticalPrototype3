using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class SwitchRoom : MonoBehaviour
{
    [SerializeField] GameObject MiniCharacter;
    [SerializeField] string roomName;
    [SerializeField] GameObject myButton;
    [SerializeField] GameObject[] buttons;
    [SerializeField] SliderController controller;
    [SerializeField] GameObject text;
    
    public void OnClick(){
        controller.currentLocation = roomName;
        foreach(GameObject button in buttons)
        {
            if(button == myButton)
            {
                button.SetActive(true);
            }
            else
            {
                button.SetActive(false);
            }
        }
        StartCoroutine(MoveMiniCharacter());
        switch(roomName){
            case "library":
                text.GetComponent<Text>().text = "Library";
                break;
            case "marketplace":
                text.GetComponent<Text>().text = "Market Place";
                break;
            case "lab":
                text.GetComponent<Text>().text = "Lab";
                break;
        }
    }

    private IEnumerator MoveMiniCharacter(){
        Tween moveTween = MiniCharacter.transform.DOMove(transform.position, 0.5f, false);
        yield return moveTween.WaitForCompletion();
    }
}
