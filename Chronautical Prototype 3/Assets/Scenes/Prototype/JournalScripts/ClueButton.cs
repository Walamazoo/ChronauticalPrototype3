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
            year.GetComponent<Text>().color = Color.blue;
            description.GetComponent<Text>().text = clueHoverText.GetComponent<Text>().text;
            description.GetComponent<Text>().color = Color.blue;
        }
        else if(type.ToLower() == "itemclue"){
            year.GetComponent<Text>().text = clueText.GetComponent<Text>().text;
            year.GetComponent<Text>().color = Color.green;
            description.GetComponent<Text>().text = clueHoverText.GetComponent<Text>().text;
            description.GetComponent<Text>().color = Color.green;
        }
        else{
            year.GetComponent<Text>().text = clueText.GetComponent<Text>().text;
            year.GetComponent<Text>().color = Color.red;
            description.GetComponent<Text>().text = clueHoverText.GetComponent<Text>().text;
            description.GetComponent<Text>().color = Color.red;
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
