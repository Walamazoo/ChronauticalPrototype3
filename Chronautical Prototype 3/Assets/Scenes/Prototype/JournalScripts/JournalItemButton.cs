using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class JournalItemButton : MonoBehaviour
{
    [SerializeField] JournalManager journalManager;
    public GameObject photo;
    public GameObject itemName;
    public GameObject fulldescription;
    public int upOrDown; //1 is up, -1 is down
    public int pointer;


    public void OnButtonPressed(){
        journalManager.ChangeJournalListPointer(pointer);
        journalManager.ChangeJournalItemPointer(upOrDown);

    }
}
