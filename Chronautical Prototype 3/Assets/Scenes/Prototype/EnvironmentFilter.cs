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
            foreach(Transform child in possibleFilter.transform){
                if(child.TryGetComponent<SpriteRenderer>(out var renderer)){
                    Color childColor = renderer.color;
                    renderer.color = new Color(childColor.r,childColor.g,childColor.b,0.5f);
                    if(child.TryGetComponent<SpriteInteraction>(out var spriteInteraction)){
                        spriteInteraction.ToggleInteraction(false);
                    }
                }
                else{
                    foreach(Transform childChild in child.transform){
                        if(childChild.TryGetComponent<Animator>(out var animator)){
                            animator.speed=0;
                        }
                    }
                }
            }
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
                if(child.TryGetComponent<SpriteRenderer>(out var renderer)){
                    Color childColor = renderer.color;
                    renderer.color = new Color(childColor.r,childColor.g,childColor.b,1f);
                    if(child.TryGetComponent<SpriteInteraction>(out var spriteInteraction)){
                        spriteInteraction.ToggleInteraction(false);
                    }
                }
                else{
                    foreach(Transform childChild in child.transform){
                        if(childChild.TryGetComponent<Animator>(out var animator)){
                            animator.speed=1;
                        }
                    }
                }
            }

            currentFilter.SetActive(true);
            possibleFilter = blankFilter;
        }
    }
}
