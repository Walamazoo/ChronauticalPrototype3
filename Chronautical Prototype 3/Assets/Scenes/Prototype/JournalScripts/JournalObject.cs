using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JournalObject
{
    //name is the name of the object.
    //type is the type. Ex: item, person, personclue.
    //hoverDescription is not yet implemented, but is for a shorter description given when hovering an object with the mouse.
    //fullDescription is a longer description given when the item is selected and being looked at by the player in the journal.
    //image is the associated image of the object, and is not needed for TimelineClues yet.
    public string name;
    public string type;
    public string hoverDescription;
    public string fullDescription;
    public Sprite image;
}
