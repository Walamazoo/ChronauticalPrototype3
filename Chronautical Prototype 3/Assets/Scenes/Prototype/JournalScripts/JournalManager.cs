using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class JournalManager : MonoBehaviour
{
    //Journal Pages that the player will go through and their associated number for the navigation buttons.
    [SerializeField] GameObject JournalMain; //1
    [SerializeField] GameObject JournalOptions; //2
    [SerializeField] GameObject JournalTimeline; //3
    [SerializeField] GameObject JournalDialogue; //4
    
    //Current page that the player can see
    public GameObject currentPage;
    public string currentClues = "PersonClues";

    //The object that contains the sprites the Journal uses for Items, places, and people.
    [SerializeField] GameObject JournalSpriteContainer;

    //The photo, name, and description objects when the player is looking at their known locations, known people, and held items.
    //listName is the name of the list the player is currently accessing for the journal.
    [SerializeField] GameObject photo;
    [SerializeField] GameObject clickphoto;
    [SerializeField] GameObject itemName;
    [SerializeField] GameObject fulldescription;
    [SerializeField] GameObject hoverdescription;
    [SerializeField] GameObject listName;

    //Int that determines whether the journal will be opened or be closed on the next button press.
    private int OpenOrClose;

    //Initialization of the List objects that will contain our Timeline Clues, our Items, known People, and known Locations.
    private Dictionary<int, List<TimelineClue>> personClues;
    private Dictionary<int, List<TimelineClue>> placeClues;
    private Dictionary<int, List<TimelineClue>> itemClues;

    private Dictionary<int, Dictionary<string, List<TimelineClue>>> timelineClues;
    [SerializeField] SliderController sliderController;
    private List<JournalObject> items;
    private List<JournalObject> people;
    private List<JournalObject> places;

    //Initialization of the List that contains our previous lists for the purpose of properly showing the player what they're
    //looking at inside the journal. Then the pointers to determine which list and which item they're being given.
    private List<List<JournalObject>> JournalList;
    private int JournalListPointer;
    private int JournalItemPointer;

    //The current list the player is looking at.
    private List<JournalObject> currentList;

    //[SerializeField] Camera MainCamera;
    [SerializeField] TimeChanged hand;
    [SerializeField] GameObject PlanetName;

    void Start(){
        //CurrentPage should always start as JournalMain as it's the first page
        currentPage = JournalMain;
        //OpenOrClose should always start as 1 as the journal starts as closed.
        OpenOrClose = 1;

        //Assigning the lists their values, this will change later when the contents are saved.
        personClues = new Dictionary<int, List<TimelineClue>>();
        placeClues = new Dictionary<int, List<TimelineClue>>();
        itemClues = new Dictionary<int, List<TimelineClue>>();
        //timelineClues = new Dictionary<int, Dictionary<string, List<TimelineClue>>>();
        
        items = new List<JournalObject>();
        people = new List<JournalObject>();
        places = new List<JournalObject>();

        //Assigning the tracking of the lists
        JournalList = new List<List<JournalObject>>();
        JournalList.Add(items);
        listName.GetComponent<Text>().text = "Items";
        JournalList.Add(people);
        JournalList.Add(places);
        JournalListPointer = 0;
        JournalItemPointer = 0;

        //Assigning the currentList that will be shown.
        currentList = JournalList[JournalListPointer];
        //updateTimeline();
        PlanetName.GetComponent<Text>().text = "PlanetName";
    }

    //Method called in other classes in order to traverse the journal pages
    //given a number associated with each page.
    public void GoToPage(int pageNumber){
        currentPage.SetActive(false);

        switch(pageNumber){
            case 1:
                clickphoto.SetActive(false);
                fulldescription.SetActive(false);    
                currentPage = JournalMain;
                break;
            case 2:
                currentPage = JournalOptions;
                break;
            case 3:
                currentPage = JournalTimeline;
                updateTimeline(currentClues);
                break;
            case 4:
                currentPage = JournalDialogue;
                break;
        }
        currentPage.SetActive(true);
    }

    //Method to open or close the journal, AKA: hide it from the player.
    public void OpenAndClose(){
        if(OpenOrClose == 1){
            currentPage.SetActive(true);
            hand.rotateHand(sliderController.currentYear);
            OpenOrClose += 1;
            //MainCamera.GetComponent<CameraParallax>().CameraCanMove(false);
        }
        else{
            GoToPage(1);
            currentPage.SetActive(false);
            OpenOrClose += 1;
            //MainCamera.GetComponent<CameraParallax>().CameraCanMove(true);
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
    public void ChangeJournalListPointer(){
        JournalListPointer += 1;
        if(JournalListPointer > JournalList.Count - 1){
            JournalListPointer = 0;
        }
        UpdateSelected(true);
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
            UpdateSelected(false);
        }
    }

    public void FullDescAndClickPhoto(){
        if(currentList.Count != 0){
            clickphoto.GetComponent<Image>().sprite = photo.GetComponent<Image>().sprite;
            clickphoto.SetActive(true);
            fulldescription.GetComponent<Text>().text = currentList[JournalItemPointer].fullDescription;
            fulldescription.SetActive(true);
        }
    }

    private void UpdateSelected(bool listOrItem){
        //False means we change the item selected from one of our lists
        //True means we change the list itself and reset the individual pointer

        //Change the currentList to whatever the pointer is at, and set the text for the list we're in.
        currentList = JournalList[JournalListPointer];
        if(JournalList[JournalListPointer] == items){
            listName.GetComponent<Text>().text = "Items";
        }
        else if(JournalList[JournalListPointer] == people){
            listName.GetComponent<Text>().text = "People";
        }
        else{
            listName.GetComponent<Text>().text = "Places";
        }    

        //Make sure we have something in our list before continuing.
        //If listOrItem is true, reset the JournalItemPointer to 0
        //then set the name, description, and photo to the appropriate version.
        //Then set the name, description, and photo to active to make sure they're properly shown to the player.
        if(currentList.Count != 0){
            if(listOrItem){
                JournalItemPointer = 0;
            }
            itemName.GetComponent<Text>().text = currentList[JournalItemPointer].name;
            itemName.SetActive(true);
            hoverdescription.GetComponent<Text>().text = currentList[JournalItemPointer].hoverDescription;
            photo.GetComponent<Image>().sprite = currentList[JournalItemPointer].image;
            photo.SetActive(true);
        }
        else{
            itemName.SetActive(false);
            photo.SetActive(false);
            hoverdescription.GetComponent<Text>().text = "";
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
                currentList = items;
                break;
            case "person":
                giveObjectImage(journalObject);
                people.Add(journalObject);
                currentList = people;
                break;
            case "place":
                giveObjectImage(journalObject);
                places.Add(journalObject);
                currentList = places;
                break;
        }
        UpdateSelected(true);
    }

    public void createTimelineClue(string name, string type, string hoverDescription, string fullDescription){
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
    }

    //Grabs and stores the GameObject that matches the passed in JournalObject's name.
    //Assign the journalObject's image to the GameObject's sprite.
    void giveObjectImage(JournalObject journalObject){
        GameObject imageObject = JournalSpriteContainer.transform.Find(journalObject.name).gameObject;
        journalObject.image = imageObject.GetComponent<SpriteRenderer>().sprite;
    }

    //NOT YET FULLY IMPLEMENTED
    //Will be used to format and properly assign the Timeline Page.
    void updateTimeline(string clueType){
        

        /* int count = JournalTimeline.transform.childCount - 1;
        for(int i = 0; i < timelineClues.Count; i++){
            if(count == i){
                break;
            }
            GameObject timelineButton = JournalTimeline.transform.GetChild(count - i).gameObject;
            //timelineButton.transform.GetChild(0).GetComponent<Text>().text = timelineClues[currentYear][clueType].hoverDescription;
            //timelineButton.transform.GetChild(2).GetComponent<Text>().text = timelineClues[i].fullDescription;
            //timelineButton.GetComponent<ClueButton>().type = timelineClues[i].type;
            timelineButton.SetActive(true);
        } */
    }
}