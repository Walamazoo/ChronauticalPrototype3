using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ClueButton : MonoBehaviour
{
    public GameObject background;
    public GameObject year;
    public GameObject description;
    [SerializeField] GameObject clueText;
    [SerializeField] GameObject clueHoverText;
    [SerializeField] GameObject clueHoverBackground;
    public string type;

    void Start(){
        updateType(type);
    }

    public void OnPointerEnter(){
        background.SetActive(true);
        if(type.ToLower() == "personclue"){
            year.GetComponent<Text>().text = clueText.GetComponent<Text>().text;
            year.GetComponent<Text>().color = new Color32(0, 0, 125, 255);
            description.GetComponent<Text>().text = clueHoverText.GetComponent<Text>().text;
            description.GetComponent<Text>().color = new Color32(0, 0, 125, 255);
        }
        else if(type.ToLower() == "itemclue"){
            year.GetComponent<Text>().text = clueText.GetComponent<Text>().text;
            year.GetComponent<Text>().color = new Color32(0, 125, 0, 255);
            description.GetComponent<Text>().text = clueHoverText.GetComponent<Text>().text;
            description.GetComponent<Text>().color = new Color32(0, 125, 0, 255);
        }
        else{
            year.GetComponent<Text>().text = clueText.GetComponent<Text>().text;
            year.GetComponent<Text>().color = new Color32(125, 0, 0, 255);
            description.GetComponent<Text>().text = clueHoverText.GetComponent<Text>().text;
            description.GetComponent<Text>().color = new Color32(125, 0, 0, 255);
        }
        
    }

    public void OnPointerExit(){
        background.SetActive(false);
    }

    public void SetYearBackgroundDescription(GameObject year1, GameObject background1, GameObject description1){
        background = background1;
        year = year1;
        description = description1;
    }

    public void updateType(string typeIn){
        if(typeIn.ToLower() == "personclue"){
            type = "PersonClue";
            clueText.GetComponent<Text>().color = new Color32(0, 0, 125, 255);
            clueHoverText.GetComponent<Text>().color = new Color32(0, 0, 125, 255);
        }
        else if(typeIn.ToLower() == "itemclue"){
            type = "ItemClue";
            clueText.GetComponent<Text>().color = new Color32(0, 125, 0, 255);
            clueHoverText.GetComponent<Text>().color = new Color32(0, 125, 0, 255);
        }
        else{
            type = "PlaceClue";
            clueText.GetComponent<Text>().color = new Color32(125, 0, 0, 255);
            clueHoverText.GetComponent<Text>().color = new Color32(125, 0, 0, 255);
        }
    }
}
