using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JournalItemButton : MonoBehaviour
{
    [SerializeField] JournalManager journalManager;
    public int upOrDown; //1 is up, -1 is down

    public void OnButtonPressed(){
        journalManager.ChangeJournalItemPointer(upOrDown);
    }
}
