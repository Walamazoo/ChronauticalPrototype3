using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using PixelCrushers.DialogueSystem.InkSupport;
using Ink.Runtime;

public class SliderController : MonoBehaviour
{
    // Set this file to your compiled json asset
	public TextAsset inkAsset;
	Story story;

    [SerializeField] DialogueSystemInkIntegration dialogManager;

    public int currentYear;
    public static float currentSliderValue = 1;
    [SerializeField] TextMeshProUGUI sliderTimeDisplay;
    [SerializeField] TextMeshProUGUI currentYearText;
    [SerializeField] int startYear;
    [SerializeField] int yearGap;
    //[SerializeField] GameObject[] filters;
    //public GameObject currentFilter;
    [SerializeField] Slider slider;
    //FMOD.Studio.EventInstance sliderSFX;

    void Awake()
    {
        story = new Story(inkAsset.text);

        //Integrate with save system

        //sliderSFX = FMODUnity.RuntimeManager.CreateInstance("event:/Sound/SFX/UI/Time Slider");
        //sliderSFX.start();
    }

    public void Start()
    {
        currentSliderValue = slider.value;
        SliderDisplayUpdate();
    }

    public void SliderUpdate()
    {
        currentSliderValue = slider.value;
        //sliderSFX.setParameterByName("Time Slider Values", slider.value);
    }
    
    public void SliderDisplayUpdate()
    {
        switch(currentSliderValue){
            case 1:
                currentYear = startYear;
                break;
            case 2:
                currentYear = startYear+yearGap;
                break;
            case 3:
                currentYear = startYear+(yearGap*2);
                break;
            case 4:
                currentYear = startYear+(yearGap*3);
                break;
            case 5:
                currentYear = startYear+(yearGap*4);
                break;
            case 6:
                currentYear = startYear+(yearGap*5);
                break;
            case 7:
                currentYear = startYear+(yearGap*6);
                break;
            case 8:
                currentYear = startYear+(yearGap*7);
                break;
            case 9:
                currentYear = startYear+(yearGap*8);
                break;
            case 10:
                currentYear = startYear+(yearGap*9);
                break;
            default:
                Debug.Log("ERRROR: Current value not on slider");
                break;
        }
        sliderTimeDisplay.text = currentYear.ToString();
        /*
        if(currentFilter != null){
            currentFilter.SetActive(false);
            currentFilter.GetComponent<SpriteRenderer>().color = new Color(1,1,1,0.5f);
        }
        currentFilter = filters[((int)currentSliderValue)-1];
        currentFilter.SetActive(true);
        */
    }

    public void LaunchNewTime()
    {
        //sliderSFX.stop(FMOD.Studio.STOP_MODE.ALLOWFADEOUT);
        //FMODUnity.RuntimeManager.PlayOneShot("event:/Sound/SFX/UI/Time Travel");
        /*
        if(currentFilter != null){
            currentFilter.GetComponent<SpriteRenderer>().color = new Color(1,1,1,1);
        }
        */
        
        currentYearText.text = currentYear.ToString();

        DialogueSystemInkIntegration.SetInkNumber("CurrentSliderValue", currentSliderValue);
        DialogueSystemInkIntegration.SetInkNumber("CurrentYear", currentYear);

        story.variablesState["CurrentYear"] = (double)currentYear;

        //dialogueManager.StartConversation("Some Conversation", actor.transform, conversant.transform);
    }
}
