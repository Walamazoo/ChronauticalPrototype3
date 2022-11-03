using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HoverButton : MonoBehaviour
{
    [SerializeField] GameObject hoverText;
    [SerializeField] GameObject JournalManager;

    public void OnClick(){
        JournalManager.GetComponent<JournalManager>().FullDescAndClickPhoto();
    }

    public void OnPointerEnter(){
        hoverText.SetActive(true);
    }

    public void OnPointerExit(){
        hoverText.SetActive(false);
    }
}
