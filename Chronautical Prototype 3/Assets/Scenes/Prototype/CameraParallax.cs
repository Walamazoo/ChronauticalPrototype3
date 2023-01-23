using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraParallax : MonoBehaviour
{
    Vector2 startPosition;
    bool canMove;
    bool couldMoveBefore;

    //bool establishingShot;
    //float shotSpeed = 0.3f;
    //float startingShot = 0.3f;

    [SerializeField] int moveSpeed;
    [SerializeField] GameObject background;
    // Start is called before the first frame update
    void Start()
    {
        canMove = false;
        couldMoveBefore = false;
        startPosition = transform.position;
        //establishingShot = false;
    }

    // Update is called once per frame
    void Update()
    {
        if(canMove && (Input.mousePosition.x >= Screen.width * 0.9f || Input.mousePosition.x <= Screen.width * 0.1f)){
            Vector2 mousePosition = Camera.main.ScreenToViewportPoint(Input.mousePosition);

            float xPos = Mathf.Lerp(transform.position.x, startPosition.x + (mousePosition.x * moveSpeed), 2f * Time.deltaTime);
            /*float yPos = Mathf.Lerp(transform.position.y, startPosition.y + (mousePosition.y * moveSpeed), 2f * Time.deltaTime);

            if(yPos > 0.55f){
                yPos = 0.55f;
            }
            if(yPos < -0.55f){
                yPos = -0.55f;
            }*/
            if(xPos > background.gameObject.transform.right.x){
                xPos = 1.0f;
            }
            if(xPos < -background.gameObject.transform.right.x){
                xPos = -1.0f;
            }
            transform.position = new Vector3(xPos, 0.0f, -10.0f);
        }

        /*if(establishingShot){
            startingShot -= shotSpeed * Time.deltaTime;
            if(startingShot <= 0.0f){
                gameObject.GetComponent<Camera>().orthographicSize -= shotSpeed * Time.deltaTime;
                if(gameObject.GetComponent<Camera>().orthographicSize <= 4.5f){
                    gameObject.GetComponent<Camera>().orthographicSize = 4.5f;
                    if(couldMoveBefore){
                        canMove = true;
                    }
                    establishingShot = false;
                    startingShot = 0.3f;
                }
            }
        }*/
    }
    public void CameraCanMove(bool move){
        Debug.Log("I was called");
        canMove = move;
        couldMoveBefore = move;
    }

    public void ResetCamera(){
        transform.position = new Vector3(0.0f, 0.0f, -10.0f);
    }

    /*public void EstablishShot(){
        canMove = false;
        transform.position = new Vector3(0.0f, 0.0f, -10.0f);
        gameObject.GetComponent<Camera>().orthographicSize = 5.0f;
        establishingShot = true;
    }*/
}
