using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class SwitchRoom : MonoBehaviour
{
    [SerializeField] GameObject MiniCharacter;
    [SerializeField] string roomName;
    [SerializeField] SliderController controller;
    
    public void OnClick(){
        controller.currentLocation = roomName;
        StartCoroutine(MoveMiniCharacter());
    }

    private IEnumerator MoveMiniCharacter(){
        Tween moveTween = MiniCharacter.transform.DOMove(transform.position, 0.5f, false);
        yield return moveTween.WaitForCompletion();
    }
}
