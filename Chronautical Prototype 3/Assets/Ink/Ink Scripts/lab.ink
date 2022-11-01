//Script for location LAB

//Time Variable
VAR time = 0

//More Variables
VAR roomDescription = ""

//Quest Variables
VAR seenBeginning = false
VAR introDirector = false
VAR investigateVault = false
VAR preDisaster = false
VAR postDisaster = false
VAR seenElection = false
VAR seenResults = false
VAR helpComplete = 0
VAR julesDirector = false
VAR hasCode = false
//More variables needed here for quest specifics

//Variables for if player has met NPC
VAR metJules = false
VAR metChild = false

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false

//Sprite/Background/Speaker
//#speaker:Alistair
//#sprite:Alistair Sad
//#background:labInterior
//#npc:Child
//No space between colon and character/sprite/background


//Knots Start
===lab===
//Room Description for Journal
{ time:
- 1:    
    ~ roomDescription = "here and then"
- 2:    
    ~ roomDescription = "something"
- 3:    
    ~ roomDescription = "something"
- 4:    
    ~ roomDescription = "something"
- 5:    
    ~ roomDescription = "something"
- 6:    
    ~ roomDescription = "something"
- 7:    
    ~ roomDescription = "something"
- 8:    
    ~ roomDescription = "something"
- 9:    
    ~ roomDescription = "something"
- 10:   
    ~ roomDescription = "something"
}

//Content Start
What should I do?
    + [Look around]
        //Room Description for Player
        //Gives the players options to do actions if the variable requirements are met (will divert to different knot) (ex. investigate vault)
        { time:
        - 1:    What does the room look like?
        - 2:    What does the room look like? 
        - 3:    What does the room look like? 
        - 4:    What does the room look like? 
        - 5:    What does the room look like? 
        - 6:    What does the room look like? 
        - 7:    What does the room look like? 
        - 8:    What does the room look like?
        - 9:    What does the room look like?
        - 10:   What does the room look like?
        }
        -> lab
    //NPC Description for Player and variable changes
    + [Look for someone to talk to]
        { time:
        - 1:    Who is there? (Add variable changes for NPCs present)
                ~directorPresent=true
        - 2:    Who is there?
                ~directorPresent=true
        - 3:    Who is there? 
                ~julesPresent=true
                ~directorPresent=true
        - 4:    Who is there?
                ~directorPresent=true
                ~julesPresent=true
        - 5:    Who is there?
                ~directorPresent=true
                ~julesPresent=true
        - 6:    Who is there?
        - 7:    Who is there?
        - 8:    Who is there?
        - 9:    Who is there?
        - 10:   Who is there?
        }
        -> NPCS

===NPCS===
//Allows the player to talk to NPCs based on who is there at the time
Who should I talk to? 
    *{julesPresent} [Jules] -> JULES
    *{directorPresent} [The Director] -> DIRECTOR
    * [Don't talk to anyone] I don't need to talk to anyone right now. -> lab
//Knots below have conversations for NPCs that change depending on the time and if certain quest markers have been met
===JULES===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing if player is not in time 1
}
//HelpOpenVaultConvo
//Ask for help to get into vault, says no, not going to help break into it
//We have bigger issues at hand, planet exploding
//Darling pops in, says there must be a way, keep searching

//Has seen election
//Return to Jules and suggest him that he run for director, respected and such (only works in certain times)
//Sees election did not help, have some minor election knot changes
//Darling plants idea to help Jules to get elected
//End of Demo

===DIRECTOR===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
=InitialMeeting
//Knots will be added for specific quest events/actions
//Speak to lab head, shut down idea, say that alistair can not get into the vault, no longer employeed, can not get into vault, classifed (haven't you given us enough trouble?)
//Darling directs player to find Jules
//Create variable for uniquie convo with Jules following this
-> DONE