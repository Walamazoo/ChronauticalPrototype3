using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class SwitchRoom : MonoBehaviour
{
    [SerializeField] GameObject MiniCharacter;
    
    public void OnClick(){
        StartCoroutine(MoveMiniCharacter());
    }

    private IEnumerator MoveMiniCharacter(){
        Tween moveTween = MiniCharacter.transform.DOMove(transform.position, 0.5f, false);
        yield return moveTween.WaitForCompletion();
    }
}
