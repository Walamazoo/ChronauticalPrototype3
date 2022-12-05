using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeChanged : MonoBehaviour
{
    [SerializeField] RectTransform rectTransform;
    
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void rotateHand(int time){
        switch(time){
            case 3921:
                rectTransform.Rotate(0f, 0f, 45f, Space.Self);
                break;
            case 3922:
                rectTransform.Rotate(0f, 0f, 225f, Space.Self);
                break;
            case 3923:
                rectTransform.Rotate(0f, 0f, 135f, Space.Self);
                break;
            case 3924:
                rectTransform.Rotate(0f, 0f, 72f, Space.Self);
                break;
            case 3925:
                rectTransform.Rotate(0f, 0f, 187f, Space.Self);
                break;
            case 3926:
                rectTransform.Rotate(0f, 0f, 322f, Space.Self);
                break;
            case 3927:
                rectTransform.Rotate(0f, 0f, 279f, Space.Self);
                break;
            case 3928:
                rectTransform.Rotate(0f, 0f, 189f, Space.Self);
                break;
            case 3929:
                rectTransform.Rotate(0f, 0f, 0f, Space.Self);
                break;
            case 3930:
                rectTransform.Rotate(0f, 0f, 250f, Space.Self);
                break;
        }
    }
}
