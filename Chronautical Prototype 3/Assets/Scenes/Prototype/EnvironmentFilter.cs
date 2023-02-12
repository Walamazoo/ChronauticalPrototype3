using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnvironmentFilter : MonoBehaviour
{
    [SerializeField] int currentLocationNumber;
    [SerializeField] int currentTimeNumber;
    [SerializeField] int possibleTimeNumber;
    [SerializeField] GameObject blankFilter;

    [SerializeField] GameObject[] locationOneFilters;
    [SerializeField] GameObject[] locationTwoFilters;
    [SerializeField] GameObject[] locationThreeFilters;
    void start(){
        setFilter(true);
        setFilter(false);
    }

    public GameObject currentFilter;
    public GameObject possibleFilter;
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
            Debug.Log("not new");
            foreach(Transform child in possibleFilter.transform){
                Debug.Log("checking children");
                if(child.GetType() == typeof(Sprite)){
                    Debug.Log("that's a sprite");
                    Color childColor = child.GetComponent<SpriteRenderer>().color;
                    child.GetComponent<SpriteRenderer>().color = new Color(childColor.r,childColor.g,childColor.b,0.5f);
                    Debug.Log("setting to half alpha");
                    if(child.TryGetComponent<SpriteInteraction>(out var spriteInteraction)){
                        spriteInteraction.ToggleInteraction(false);
                        Debug.Log("setting to uninteractable");
                    }
                }
                else if(child.GetType() == typeof(Animator)){
                    Debug.Log("that's an animation");
                    child.GetComponent<Animator>().SetBool("AshPlaying", false);
                    Debug.Log("setting to not playing");
                }
            }
            //Debug.Log("Setting filter to 0.5 opacity");
            //Debug.Log("Current filter is" + currentFilter);
            //Debug.Log("Possible filter is" + possibleFilter);
        }
        else{
             Debug.Log("is new");
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
                if(child.GetType() == typeof(Sprite)){
                    Color childColor = child.GetComponent<SpriteRenderer>().color;
                    child.GetComponent<SpriteRenderer>().color = new Color(childColor.r,childColor.g,childColor.b,1f);
                    Debug.Log("setting to full alpha");
                    if(child.TryGetComponent<SpriteInteraction>(out var spriteInteraction)){
                        spriteInteraction.ToggleInteraction(false);
                        Debug.Log("setting to interactable");
                    }
                }
                else if(child.GetType() == typeof(Animator)){
                    child.GetComponent<Animator>().SetBool("AshPlaying", true);
                    Debug.Log("setting to playing");
                }
            }

            currentFilter.SetActive(true);
            possibleFilter = blankFilter;
            //Debug.Log("Current filter is" + currentFilter);
            //Debug.Log("Possible filter is" + possibleFilter);
        }
    }
}
