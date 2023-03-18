using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using PixelCrushers.DialogueSystem;
using PixelCrushers.DialogueSystem.InkSupport;
using Ink.Runtime;

public class SliderController : MonoBehaviour
{
    // Set this file to your compiled json asset
	public TextAsset[] inkAssets;
	List<Story> stories;
    public string currentLocation;

    [SerializeField] DialogueSystemExtender extender;

    [SerializeField] DialogueSystemInkIntegration dialogueManager;
    [SerializeField] GameObject playerActor;
    [SerializeField] GameObject conversantActor;

    [SerializeField] EnvironmentFilter environmentFilter;

    public int currentYear;
    public static float currentSliderValue = 1;
    [SerializeField] TextMeshProUGUI sliderTimeDisplay;
    [SerializeField] TextMeshProUGUI currentYearText;
    [SerializeField] int startYear;
    [SerializeField] int yearGap;
    [SerializeField] Slider slider;
    //FMOD.Studio.EventInstance sliderSFX;

    void Awake()
    {
        //foreach(TextAsset txt in inkAssets){
            //stories.Add(new Story(txt.text));
        //}

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
        environmentFilter.setPossibleTime((int)currentSliderValue-1);
        environmentFilter.setFilter(false);
    }

    public void LaunchNewTime()
    {
        FMODUnity.RuntimeManager.PlayOneShot("event:/Sound/SFX/UI/Time Travel");
        
        currentYearText.text = currentYear.ToString();
        extender.setTime((int)currentSliderValue);
        environmentFilter.setCurrentTime((int)currentSliderValue-1);
        environmentFilter.setFilter(true);
    }
}
