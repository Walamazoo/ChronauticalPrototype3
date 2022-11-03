using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OpenAndClose : MonoBehaviour
{
    [SerializeField] JournalManager journalManager;

    public void OnButtonPressed(){
        journalManager.OpenAndClose();
    }
}
