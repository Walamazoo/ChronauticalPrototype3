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
        if(type.ToLower() == "personclue"){
            clueText.GetComponent<Text>().color = Color.blue;
            clueHoverText.GetComponent<Text>().color = Color.blue;
        }
        else if(type.ToLower() == "itemclue"){
            clueText.GetComponent<Text>().color = Color.green;
            clueHoverText.GetComponent<Text>().color = Color.green;
        }
        else{
            clueText.GetComponent<Text>().color = Color.red;
            clueHoverText.GetComponent<Text>().color = Color.red;
        }
    }

    public void OnPointerEnter(){
        clueHoverText.SetActive(true);
        clueHoverBackground.SetActive(true);
    }

    public void OnPointerExit(){
        clueHoverText.SetActive(false);
        clueHoverBackground.SetActive(false);
    }
}
