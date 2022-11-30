using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimelineClue
{
    //name is the name of the object.
    //type is the type. Ex: itemclue, placeclue, personclue.
    //hoverDescription is not yet implemented, but is for a shorter description given when hovering an object with the mouse.
    //fullDescription is a longer description given when the item is selected and being looked at by the player in the journal.
    public string name;
    public string type;
    public string hoverDescription;
    public string fullDescription;

    public TimelineClue(string name, string type, string hoverDescription, string fullDescription){
        this.name = name;
        this.type = type;
        this.hoverDescription = hoverDescription;
        this.fullDescription = fullDescription;
    }
}
