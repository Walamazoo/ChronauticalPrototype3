using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AudioSettings : MonoBehaviour
{
    [SerializeField] Slider Master;
    [SerializeField] Slider Music;
    [SerializeField] Slider Ambience;
    [SerializeField] Slider SoundEffects;

    FMOD.Studio.Bus MasterBus;

    // Start is called before the first frame update
    void Start()
    {
        MasterBus = FMODUnity.RuntimeManager.GetBus("bus:/");
        Music.value = 1f;
        Ambience.value = 1f;
        SoundEffects.value = 1f;
        Master.value = 1f;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void MusicVolumeLevel(){
        FMODUnity.RuntimeManager.StudioSystem.setParameterByName("MusicVolume", Music.value);
        Debug.Log(Music.value);
    }

    public void SoundEffectsVolumeLevel(){
        FMODUnity.RuntimeManager.StudioSystem.setParameterByName("SFXVolume", SoundEffects.value);
        Debug.Log(SoundEffects.value);
    }

    public void AmbienceVolumeLevel(){
        FMODUnity.RuntimeManager.StudioSystem.setParameterByName("AmbienceVolume", Ambience.value);
        Debug.Log(Ambience.value);
    }

    public void MasterVolumeLevel(){
        MasterBus.setVolume(Master.value);
    }
}
