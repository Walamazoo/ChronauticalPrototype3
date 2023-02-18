using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class SwitchRoom : MonoBehaviour
{
    //Get all of the object references that are needed to make each button move and change things properly
    [SerializeField] GameObject MiniCharacter; //The mini character on the minimap to show where the player is
    [SerializeField] string roomName; //Name of where the player currently is
    [SerializeField] GameObject myButton; //The button on the Time Slider that is used to start an Ink script. So Library Button gets LibraryTimeButton.
    [SerializeField] GameObject[] buttons; //All of the buttons on the Time Slider LibraryTimeButton, LabTimeButton, MarketplaceTimeButton
    [SerializeField] SliderController controller; //The SliderController script from the Time Slider object
    [SerializeField] GameObject text; //The textbox that roomName is put into.
    [SerializeField] EnvironmentFilter environmentFilter;
    
    public void OnClick(){
        //When clicked we set the controller's currentLocation to our roomName, then deactivate all the buttons that are not the one that needs to be pressed.
        //This way when we time travel, the script will always be on the ink script we want.
        //Also when we travel by the minimap, we run the TimeButton's ink script automatically. This is handled in the Unity Inspector's On Click.
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
        
        StartCoroutine(MoveMiniCharacter()); //Moves the mini character to this button's position
        switch(roomName){ //Sets the text box's text to our roomName
            case "library":
                text.GetComponent<Text>().text = "Library";
                environmentFilter.setLocation(1);
                environmentFilter.setFilter(true);
                environmentFilter.setFilter(false);
                break;
            case "marketplace":
                text.GetComponent<Text>().text = "Marketplace";
                environmentFilter.setLocation(2);
                environmentFilter.setFilter(true);
                environmentFilter.setFilter(false);
                break;
            case "lab":
                text.GetComponent<Text>().text = "Lab";
                environmentFilter.setLocation(3);
                environmentFilter.setFilter(true);
                environmentFilter.setFilter(false);
                break;
        }
    }

    private IEnumerator MoveMiniCharacter(){
        Tween moveTween = MiniCharacter.transform.DOMove(transform.position, 0.5f, false);
        yield return moveTween.WaitForCompletion();
    }
}
