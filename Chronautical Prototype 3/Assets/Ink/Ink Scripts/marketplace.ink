//Script for location MARKETPLACE

//Creates time variable
VAR time = 0

//Journal Variables
VAR roomDescription = ""

//Quest Variables
//here

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false //formally Lab Head
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false

//Knots Start
    
===MARKETPLACE===
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


//DESCRIPTION OF ROOM PROVIDED BY ABOVE
What will I do?
    + [Look around]
        //Room Description for Player
        //Gives the players options to do if the time requirement is met (will divert to different knot)
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
        -> MARKETPLACE
    + [Look for someone to talk to]
        //NPC Description for Player
        { time:
        - 1:    Who is there?
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
    + //MORE OPTIONS DEPENDENT ON QUEST

===NPCS===
//Allows the player to talk to NPCs based on who is there at the time
Who should I talk to? 
    * Jules -> JULES
    * The Director -> DIRECTOR
    * The Shopowner -> SHOPOWNER
    * The Child -> CHILD
    * The Old Lady -> OLDLADY
    * [Don't talk to anyone] I don't need to talk to anyone right now. -> MARKETPLACE
//LOGIC NEEDED: only display options if the correct time is true
//Knots below have conversations for NPCs that change depending on the time and if certain quest markers have been met
===JULES===
HERE

===DIRECTOR===
HERE

===SHOPOWNER===
HERE

===CHILD===
HERE

===OLDLADY===
HERE