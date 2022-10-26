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
//VARIABLES FOR THE SIDE QUEST STUFF
VAR julesDirector = false
VAR hasCode = false

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false //formally Lab Head
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false

//Knots Start
    
===lab===
//Room Description for Journal
{ time:
- 1:    ~ roomDescription = "something"
- 2:    ~ roomDescription = "something"
- 3:    ~ roomDescription = "something"
- 4:    ~ roomDescription = "something"
- 5:    ~ roomDescription = "something"
- 6:    ~ roomDescription = "something"
- 7:    ~ roomDescription = "something"
- 8:    ~ roomDescription = "something"
- 9:    ~ roomDescription = "something"
- 10:   ~ roomDescription = "something"
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
    + [Look for someone to talk to]
        //NPC Description for Player
        { time:
        - 1:    Who is there? (Add variable changes for NPCs present)
        - 2:    Who is there?
        - 3:    Who is there?
        - 4:    Who is there?
        - 5:    Who is there?
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
    *{shopownerPresent} [The Shopowner] -> SHOPOWNER
    *{childPresent} [The Child] -> CHILD
    *{oldladyPresent} [The Old Lady] -> OLDLADY
    * [Don't talk to anyone] I don't need to talk to anyone right now. -> lab
//Knots below have conversations for NPCs that change depending on the time and if certain quest markers have been met
===JULES===
{time == 1:
    This is written if yourVariable is true.
    //Each NPC should have some base questions that they can be asked (~2) Questions to elaborate or get info (think Skyrim NPCs) These questions are used for the player to get information about the world or to get information to further quests
    //In addition, some dialogue options will only be visible if the player has met previous requirements, these options will always further the plot/puzzle and should appear as the first thing in the list of dialogue options
  - else:
    prints nothing if player is not in time 1
}
//repeat for times 2-10


===DIRECTOR===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10

===SHOPOWNER===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10

===CHILD===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10

===OLDLADY===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10

//Knots will be added for specific quest events/actions