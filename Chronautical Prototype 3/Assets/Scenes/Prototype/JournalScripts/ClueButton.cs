using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ClueButton : MonoBehaviour
{
    [SerializeField] GameObject clueText;
    [SerializeField] GameObject clueHoverText;
    [SerializeField] GameObject clueHoverBackground;
    public string type;

    void Start(){
        updateType(type);
    }

    public void OnPointerEnter(){
        clueText.SetActive(true);
        clueHoverText.SetActive(true);
        clueHoverBackground.SetActive(true);
        
    }

    public void OnPointerExit(){
        clueText.SetActive(false);
        clueHoverText.SetActive(false);
        clueHoverBackground.SetActive(false);
    }

    public void updateType(string typeIn){
        if(typeIn.ToLower() == "personclue"){
            type = "PersonClue";
            clueText.GetComponent<Text>().color = Color.blue;
            clueHoverText.GetComponent<Text>().color = Color.blue;
        }
        else if(typeIn.ToLower() == "itemclue"){
            type = "ItemClue";
            clueText.GetComponent<Text>().color = Color.green;
            clueHoverText.GetComponent<Text>().color = Color.green;
        }
        else{
            type = "PlaceClue";
            clueText.GetComponent<Text>().color = Color.red;
            clueHoverText.GetComponent<Text>().color = Color.red;
        }
    }
}
