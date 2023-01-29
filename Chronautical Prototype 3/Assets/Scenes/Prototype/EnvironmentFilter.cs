using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnvironmentFilter : MonoBehaviour
{
    [SerializeField] int currentLocationNumber;
    [SerializeField] int currentTimeNumber;
    [SerializeField] int possibleTimeNumber;

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

    public void setCurrentTime(int time){
        currentTimeNumber = time;
    }

    public void setPossibleTime(int time){
        possibleTimeNumber = time;
    }

    public void setFilter(bool isNew){
        if(possibleFilter){
            possibleFilter.SetActive(false);
        }

        switch(currentLocationNumber){
            case 1:
                if(locationOneFilters[possibleTimeNumber] != currentFilter){
                    possibleFilter = locationOneFilters[possibleTimeNumber];
                    possibleFilter.SetActive(true);
                }
                break;
            case 2:
                if(locationTwoFilters[possibleTimeNumber] != currentFilter){
                    possibleFilter = locationTwoFilters[possibleTimeNumber];
                    possibleFilter.SetActive(true);
                }
                break;
            case 3:
                if(locationThreeFilters[possibleTimeNumber] != currentFilter){
                    possibleFilter = locationThreeFilters[possibleTimeNumber];
                    possibleFilter.SetActive(true);
                }
                break;
            default:
                Debug.Log("ERRROR: Invalid time and place");
                break;
        }

        if(!isNew){
            foreach(Transform child in possibleFilter.transform){
                child.GetComponent<SpriteRenderer>().color = new Color(1,1,1,0.5f);
            }
            //Debug.Log("Setting filter to 0.5 opacity");
            //Debug.Log("Current filter is" + currentFilter);
            //Debug.Log("Possible filter is" + possibleFilter);
        }
        else{
            currentFilter.SetActive(false);
            possibleFilter.SetActive(false);
            
            switch(currentLocationNumber){
            case 1:
                currentFilter = locationOneFilters[currentTimeNumber];
                break;
            case 2:
                currentFilter = locationTwoFilters[currentTimeNumber];
                break;
            case 3:
                currentFilter = locationThreeFilters[currentTimeNumber];
                break;
            default:
                Debug.Log("ERRROR: Invalid time and place");
                break;
            }

            foreach(Transform child in currentFilter.transform){
                child.GetComponent<SpriteRenderer>().color = new Color(1,1,1,1);
            }

            currentFilter.SetActive(true);
            possibleFilter = null;
            //Debug.Log("Current filter is" + currentFilter);
            //Debug.Log("Possible filter is" + possibleFilter);
        }
    }
}
