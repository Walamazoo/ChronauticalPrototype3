using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnvironmentFilter : MonoBehaviour
{
    [SerializeField] int currentLocationNumber;
    [SerializeField] int currentTimeNumber;

    [SerializeField] GameObject[] locationOneFilters;
    [SerializeField] GameObject[] locationTwoFilters;
    [SerializeField] GameObject[] locationThreeFilters;

    void start(){
        setFilter(true);
    }

    public GameObject currentFilter;
    private GameObject possibleFilter = null;
    //[SerializeField]bool startingFilter;

    public void setLocation(int location){
        currentLocationNumber = location;
    }

    public void setTime(int time){
        currentTimeNumber = time;
    }

    public void setFilter(bool isNew){
        if(possibleFilter){
            possibleFilter.SetActive(false);
        }

        switch(currentLocationNumber){
            case 1:
                possibleFilter = locationOneFilters[currentTimeNumber];
                break;
            case 2:
                possibleFilter = locationTwoFilters[currentTimeNumber];
                break;
            case 3:
                possibleFilter = locationThreeFilters[currentTimeNumber];
                break;
            default:
                Debug.Log("ERRROR: Invalid time and place");
                break;
        }

        if(!isNew){
            foreach(Transform child in possibleFilter.transform){
                child.GetComponent<SpriteRenderer>().color = new Color(1,1,1,0.5f);
            }
            possibleFilter.SetActive(true);
            //Debug.Log("Setting filter to 0.5 opacity");
        }
        else{
            currentFilter.SetActive(false);
            currentFilter = possibleFilter;
            foreach(Transform child in currentFilter.transform){
                child.GetComponent<SpriteRenderer>().color = new Color(1,1,1,1);
            }
            currentFilter.SetActive(true);
        }
    }
}
