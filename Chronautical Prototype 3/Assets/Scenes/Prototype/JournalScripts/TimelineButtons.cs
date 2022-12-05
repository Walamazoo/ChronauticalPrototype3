using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimelineButtons : MonoBehaviour
{
    [SerializeField] JournalManager journalManager;
    [SerializeField] string timelineType;

    public void onClick(){
        journalManager.updateTimeline(timelineType);
    }
}
