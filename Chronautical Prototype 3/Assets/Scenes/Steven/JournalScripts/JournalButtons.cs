using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JournalButtons : MonoBehaviour
{
    public int journalNumber;
    [SerializeField] JournalManager journalManager;

    public void OnButtonPressed(){
        journalManager.GoToPage(journalNumber);
    }
}
