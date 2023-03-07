using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class JournalManager : MonoBehaviour
{
    [SerializeField] GameObject JournalMain;
    //Journal Pages that the player will go through and their associated number for the navigation buttons.
    [SerializeField] GameObject JournalTimeline; //1
    [SerializeField] GameObject JournalPeopleAndItems; //2
    [SerializeField] GameObject JournalInfo; //3
    [SerializeField] GameObject JournalOptions; //4
    
    //Current page that the player can see
    public GameObject currentPage;
    [SerializeField] GameObject exitButton;

    //The object that contains the sprites the Journal uses for Items, places, and people.
    [SerializeField] GameObject JournalSpriteContainer;

    //The photo, name, and description objects when the player is looking at their known locations, known people, and held items.
    //listName is the name of the list the player is currently accessing for the journal.
    /*[SerializeField] GameObject photo;
    [SerializeField] GameObject clickphoto;
    [SerializeField] GameObject itemName;
    [SerializeField] GameObject fulldescription;
    [SerializeField] GameObject hoverdescription;*/
    [SerializeField] GameObject[] ItemAndPeopleList;
    [SerializeField] InfoMinimap[] minimapPeople;

    //Int that determines whether the journal will be opened or be closed on the next button press.
    private int OpenOrClose;

    //Initialization of the List objects that will contain our Timeline Clues, our Items, known People, and known Locations.
    public GameObject exclamationClue;
    public GameObject personClue;
    public GameObject questionClue;
    private Dictionary<int, List<TimelineClue>> personClues;
    
    private Dictionary<int, List<TimelineClue>> placeClues;
    private Dictionary<int, List<TimelineClue>> itemClues;

    private Dictionary<int, Dictionary<string, List<TimelineClue>>> timelineClues;
    [SerializeField] SliderController sliderController;
    public List<JournalObject> items = new List<JournalObject>();
    public List<JournalObject> people = new List<JournalObject>();

    //Initialization of the List that contains our previous lists for the purpose of properly showing the player what they're
    //looking at inside the journal. Then the pointers to determine which list and which item they're being given.
    private List<List<JournalObject>> JournalList;
    private int JournalListPointer;
    private int JournalItemPointer;

    //The current list the player is looking at.
    private List<JournalObject> currentList;

    [SerializeField] GameObject dialogueLog;
    [SerializeField] TimeChanged hand;
    [SerializeField] GameObject highlight;
    [SerializeField] EnvironmentFilter environmentFilter;
    Tween fadeInTween;
    Tween fadeOutTween;

    void Start(){
        //CurrentPage should always start as JournalMain as it's the first page
        currentPage = JournalInfo;
        //OpenOrClose should always start as 1 as the journal starts as closed.
        OpenOrClose = 1;

        //Assigning the lists their values, this will change later when the contents are saved.
        personClues = new Dictionary<int, List<TimelineClue>>();
        placeClues = new Dictionary<int, List<TimelineClue>>();
        itemClues = new Dictionary<int, List<TimelineClue>>();
        //timelineClues = new Dictionary<int, Dictionary<string, List<TimelineClue>>>();

        //Assigning the tracking of the lists
        JournalList = new List<List<JournalObject>>();
        JournalList.Add(items);
        JournalList.Add(people);
        JournalListPointer = 1;
        JournalItemPointer = 0;

        //Assigning the currentList that will be shown.
        //currentList = JournalList[JournalListPointer];
        //updateTimeline();

        updateTimeline();
    }

    //Method called in other classes in order to traverse the journal pages
    //given a number associated with each page.
    public void GoToPage(int pageNumber){
        currentPage.SetActive(false);

        switch(pageNumber){
            case 1: 
                currentPage = JournalTimeline;
                break;
            case 2:
                currentPage = JournalPeopleAndItems;
                break;
            case 3:
                currentPage = JournalInfo;
                break;
            case 4:
                currentPage = JournalOptions;
                break;
        }
        FMODUnity.RuntimeManager.PlayOneShot("event:/Sound/SFX/UI/Page turn"); //might remove later
        currentPage.SetActive(true);
    }

    //Method to open or close the journal, AKA: hide it from the player.
    public void OpenAndClose(){
        if(OpenOrClose == 1){
            JournalMain.SetActive(true);
            currentPage.SetActive(true);
            //hand.rotateHand(sliderController.currentYear);
            OpenOrClose += 1;
            updateTimeline();
            exitButton.SetActive(true);
            foreach(InfoMinimap person in minimapPeople){
                person.OnorOff();
            }
            //MainCamera.GetComponent<CameraParallax>().CameraCanMove(false);

            JournalItemPointer = 0;
            ChangeJournalListPointer(1);
            UpdateSelected();
            ChangeJournalListPointer(2);
            UpdateSelected();
            ToggleFilterInteractable(false);
            FMODUnity.RuntimeManager.PlayOneShot("event:/Sound/SFX/UI/Journal open");
        }
        else{
            JournalMain.SetActive(false);
            GoToPage(3);
            currentPage.SetActive(false);
            OpenOrClose += 1;
            exitButton.SetActive(false);
            ToggleFilterInteractable(true);
            //MainCamera.GetComponent<CameraParallax>().CameraCanMove(true);
            FMODUnity.RuntimeManager.PlayOneShot("event:/Sound/SFX/UI/Journal close");
        }
        if(OpenOrClose > 2){
            OpenOrClose = 1;
        }
    }

    public void CloseJournal(){
        OpenOrClose = 2;
        OpenAndClose();
    }

    //This is used by the arrow buttons to change where the pointer is for the JournalList.
    //Ex: Items to People
    //Then it calls UpdateSelected and passes in true, as we're changing the List we're looking at.
    public void ChangeJournalListPointer(int pointer){
        JournalListPointer = pointer;
        if(pointer < 2){
            currentList = items;
        }
        else{
            currentList = people;
        }
    }

    //this is used by the arrow buttons to change where the pointer is for the item in our JournalList.
    //Ex: Wrench to Fish
    //Then it calls UpdateSelected and passes in false, as we're changing the Item we're looking at in the list.
    //We also make sure the currentList has something in it, as we don't want to try to access something that doesn't exist.
    public void ChangeJournalItemPointer(int upOrDown){
        if(currentList.Count != 0){
            JournalItemPointer = JournalItemPointer + upOrDown;
            if(JournalItemPointer < 0){
                JournalItemPointer = currentList.Count - 1;
            }
            else if(JournalItemPointer > currentList.Count - 1){
                JournalItemPointer = 0;
            }
            UpdateSelected();
        }
    }

    /*public void FullDescAndClickPhoto(){
        if(currentList.Count != 0){
            clickphoto.GetComponent<Image>().sprite = photo.GetComponent<Image>().sprite;
            clickphoto.SetActive(true);
            fulldescription.GetComponent<Text>().text = currentList[JournalItemPointer].fullDescription;
            fulldescription.SetActive(true);
        }
    }*/

    private void UpdateSelected(){
        //False means we change the item selected from one of our lists
        //True means we change the list itself and reset the individual pointer 
        JournalItemButton tempButton = ItemAndPeopleList[JournalListPointer].GetComponent<JournalItemButton>();
        //Make sure we have something in our list before continuing.
        //If listOrItem is true, reset the JournalItemPointer to 0
        //then set the name, description, and photo to the appropriate version.
        //Then set the name, description, and photo to active to make sure they're properly shown to the player.
        if(currentList.Count != 0){
            tempButton.itemName.GetComponent<Text>().text = currentList[JournalItemPointer].name;
            tempButton.itemName.SetActive(true);
            tempButton.fulldescription.GetComponent<Text>().text = currentList[JournalItemPointer].fullDescription;
            tempButton.photo.GetComponent<Image>().sprite = currentList[JournalItemPointer].image;
            tempButton.photo.SetActive(true);
        }
        else{
            tempButton.itemName.SetActive(false);
            tempButton.photo.SetActive(false);
            tempButton.fulldescription.GetComponent<Text>().text = "";
        }
    }

    //This is the method for creating a JournalObject, the custom data structure that will be used for housing things needed in the journal.
    //Each JournalObject is comprised of FOUR strings, and ONE Sprite object. name, type, hoverDescription, fullDescription, image.
    //name is the name of the object.
    //type is the type. Ex: item, person, personclue.
    //hoverDescription is not yet implemented, but is for a shorter description given when hovering an object with the mouse.
    //fullDescription is a longer description given when the item is selected and being looked at by the player in the journal.
    //image is the associated image of the object, and is not needed for TimelineClues yet.

    public void createJournalObject(string name, string type, string hoverDescription, string fullDescription){
        //The method starts by assigning the passed string values to the object's string values.
        JournalObject journalObject = new JournalObject(name, type, hoverDescription, fullDescription);

        //Then it goes into different cases based on the object's type.
        //And we set the currentList to be the list added to.
        switch(type.ToLower()){
            //giveObjectImage() is called to find the object's related image based on its name. All images are contained in the
            //Journal Sprite Container object, and have to exactly match the passed in JournalObject's name.
            //Then the object is added into the appropriate list.
            case "item":
                giveObjectImage(journalObject);
                items.Add(journalObject);
                //currentList = items;
                break;
            case "person":
                giveObjectImage(journalObject);
                people.Add(journalObject);
                //currentList = people;
                break;
            case "place":
                giveObjectImage(journalObject);
                //places.Add(journalObject);
                //currentList = places;
                break;
        }
        //UpdateSelected(true);
        StartCoroutine(journalUpdated());
    }

    public void createTimelineClue(string name, string type, string hoverDescription, string fullDescription){
        Debug.Log("Create timeline clue called");
        TimelineClue timelineClue = new TimelineClue(name, type, hoverDescription, fullDescription);
        int currentYear = sliderController.currentYear;

        switch(type.ToLower()){
            case "personclue":
                if(personClues.ContainsKey(currentYear)){
                    List<TimelineClue> temp = personClues[currentYear];
                    temp.Add(timelineClue);
                    personClues[currentYear] = temp;
                }
                else{
                    List<TimelineClue> temp = new List<TimelineClue>();
                    temp.Add(timelineClue);
                    personClues.Add(currentYear, temp);
                }
                break;
            case "itemclue":
                if(itemClues.ContainsKey(currentYear)){
                    List<TimelineClue> temp = itemClues[currentYear];
                    temp.Add(timelineClue);
                    itemClues[currentYear] = temp;
                }
                else{
                    List<TimelineClue> temp = new List<TimelineClue>();
                    temp.Add(timelineClue);
                    itemClues.Add(currentYear, temp);
                }
                break;
            case "placeclue":
                if(placeClues.ContainsKey(currentYear)){
                    List<TimelineClue> temp = placeClues[currentYear];
                    temp.Add(timelineClue);
                    placeClues[currentYear] = temp;
                }
                else{
                    List<TimelineClue> temp = new List<TimelineClue>();
                    temp.Add(timelineClue);
                    placeClues.Add(currentYear, temp);
                }
                break;
        }
        StartCoroutine(journalUpdated());
    }

    //Grabs and stores the GameObject that matches the passed in JournalObject's name.
    //Assign the journalObject's image to the GameObject's sprite.
    void giveObjectImage(JournalObject journalObject){
        GameObject imageObject = JournalSpriteContainer.transform.Find(journalObject.name).gameObject;
        journalObject.image = imageObject.GetComponent<SpriteRenderer>().sprite;
    }

    //NOT YET FULLY IMPLEMENTED
    //Will be used to format and properly assign the Timeline Page.
    public void updateTimeline(){
        int count = 0;
        float xCount = 0f;
        for(int i = 0; i < 3; i++){
            switch(i){
                case 0:
                count = 0;
                    foreach(int variable in personClues.Keys){
                        List<TimelineClue> tempList = personClues[variable];

                        foreach(TimelineClue clue in tempList){
                            GameObject timelineButton = JournalTimeline.transform.GetChild(0).gameObject.transform.GetChild(variable % 10).gameObject;
                            GameObject tempClue = Instantiate<GameObject>(personClue, timelineButton.transform.position + new Vector3(xCount, 0f, 0f), 
                                Quaternion.identity, timelineButton.transform) as GameObject;
                            tempClue.transform.GetChild(1).GetComponent<Text>().text = tempList[count].fullDescription;
                            tempClue.transform.GetChild(2).GetComponent<Text>().text = variable.ToString();
                            tempClue.GetComponent<ClueButton>().updateType("PersonClue");
                            if(variable % 10 > 0 && variable % 10 < 6){
                                GameObject temp = JournalTimeline.transform.GetChild(1).gameObject.transform.GetChild(0).gameObject;
                                tempClue.GetComponent<ClueButton>().SetYearBackgroundDescription(temp.transform.GetChild(0).gameObject, temp, temp.transform.GetChild(1).gameObject);
                            }
                            else{
                                GameObject temp2 = JournalTimeline.transform.GetChild(1).gameObject.transform.GetChild(1).gameObject;
                                tempClue.GetComponent<ClueButton>().SetYearBackgroundDescription(temp2.transform.GetChild(0).gameObject, temp2, temp2.transform.GetChild(1).gameObject);
                            }
                            Debug.Log("Person is being called in update journal");
                            count++;
                            xCount += 20f; 
                        }
                    }   
                    break;
                case 1:
                count = 0;
                    foreach(int variable in placeClues.Keys){
                        List<TimelineClue> tempList = placeClues[variable];

                        foreach(TimelineClue clue in tempList){
                            GameObject timelineButton = JournalTimeline.transform.GetChild(0).gameObject.transform.GetChild(variable % 10).gameObject;
                            GameObject tempClue = Instantiate<GameObject>(exclamationClue, timelineButton.transform.position + new Vector3(xCount, 0f, 0f), 
                                Quaternion.identity, timelineButton.transform) as GameObject;
                            tempClue.transform.GetChild(1).GetComponent<Text>().text = tempList[count].fullDescription;
                            tempClue.transform.GetChild(2).GetComponent<Text>().text = variable.ToString();
                            tempClue.GetComponent<ClueButton>().updateType("PlaceClue");
                            if(variable % 10 > 0 && variable % 10 < 6){
                                GameObject temp3 = JournalTimeline.transform.GetChild(1).gameObject.transform.GetChild(0).gameObject;
                                tempClue.GetComponent<ClueButton>().SetYearBackgroundDescription(temp3.transform.GetChild(0).gameObject, temp3, temp3.transform.GetChild(1).gameObject);
                            }
                            else{
                                GameObject temp4 = JournalTimeline.transform.GetChild(1).gameObject.transform.GetChild(1).gameObject;
                                tempClue.GetComponent<ClueButton>().SetYearBackgroundDescription(temp4.transform.GetChild(0).gameObject, temp4, temp4.transform.GetChild(1).gameObject);
                            }
                            Debug.Log("Place is being called in update journal");
                            count++;
                            xCount += 20f;
                        }
                    } 
                    break;
                case 2:
                count = 0;
                    foreach(int variable in itemClues.Keys){
                        List<TimelineClue> tempList = itemClues[variable];
                        
                        foreach(TimelineClue clue in tempList){
                            GameObject timelineButton = JournalTimeline.transform.GetChild(0).gameObject.transform.GetChild(variable % 10).gameObject;
                            GameObject tempClue = Instantiate<GameObject>(questionClue, timelineButton.transform.position + new Vector3(xCount, 0f, 0f),
                                Quaternion.identity, timelineButton.transform) as GameObject;
                            tempClue.transform.GetChild(1).GetComponent<Text>().text = tempList[count].fullDescription;
                            tempClue.transform.GetChild(2).GetComponent<Text>().text = variable.ToString();
                            tempClue.GetComponent<ClueButton>().updateType("ItemClue");
                            Debug.Log("Item is being called in update journal");
                            if(variable % 10 > 0 && variable % 10 < 6){
                                GameObject temp = JournalTimeline.transform.GetChild(1).gameObject.transform.GetChild(0).gameObject;
                                tempClue.GetComponent<ClueButton>().SetYearBackgroundDescription(temp.transform.GetChild(0).gameObject, temp, temp.transform.GetChild(1).gameObject);
                            }
                            else{
                                GameObject temp2 = JournalTimeline.transform.GetChild(1).gameObject.transform.GetChild(1).gameObject;
                                tempClue.GetComponent<ClueButton>().SetYearBackgroundDescription(temp2.transform.GetChild(0).gameObject, temp2, temp2.transform.GetChild(1).gameObject);
                            }
                            count++;
                            xCount += 20f;
                        }
                    } 
                    break;
            }
        }
    }

    private IEnumerator journalUpdated(){
        FMODUnity.RuntimeManager.PlayOneShot("event:/Sound/SFX/UI/Page turn");
        for(int i = 0; i <= 4; i++){
        fadeOutTween = highlight.GetComponent<Image>().DOFade(0, 0.25f);
        yield return fadeOutTween.WaitForCompletion();
        fadeInTween = highlight.GetComponent<Image>().DOFade(1, 0.25f);
        yield return fadeInTween.WaitForCompletion();
        }
        fadeOutTween = highlight.GetComponent<Image>().DOFade(0, 0.25f);
        yield return fadeOutTween.WaitForCompletion();
    }

    public void AddToJournalDialogueLog(string adder){
        dialogueLog.GetComponent<Text>().text += adder + System.Environment.NewLine;
    }

    public void ToggleFilterInteractable(bool state){
        foreach(Transform child in environmentFilter.currentFilter.transform){
            if(child.TryGetComponent<SpriteInteraction>(out var spriteInteraction)){
                spriteInteraction.ToggleInteraction(state);
            }
        }
    }
}