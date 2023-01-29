using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraParallax : MonoBehaviour
{
    Vector2 startPosition;
    bool canMove;

    [SerializeField] int moveSpeed;
    [SerializeField] GameObject background;
    // Start is called before the first frame update
    void Start()
    {
        canMove = false;
        startPosition = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        if(canMove){
            if(Input.mousePosition.x >= Screen.width * 0.9f){
                float xPos = transform.position.x + moveSpeed * Time.deltaTime;
                if(xPos > background.gameObject.transform.right.x){
                    xPos = background.gameObject.transform.right.x;
                }
                transform.position = new Vector3(xPos, 0.0f, -10.0f);
            }
            else if(Input.mousePosition.x <= Screen.width * 0.1f){
                float xPos = transform.position.x - moveSpeed * Time.deltaTime;
                if(xPos < -background.gameObject.transform.right.x){
                    xPos = -background.gameObject.transform.right.x;
                }
                transform.position = new Vector3(xPos, 0.0f, -10.0f);
            }
        }
    }
    public void CameraCanMove(bool move){
        canMove = move;
    }

    public void ResetCamera(){
        transform.position = new Vector3(0.0f, 0.0f, -10.0f);
    }
}
