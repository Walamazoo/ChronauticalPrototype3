//Script for location LIBRARY

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
VAR directorPresent = false
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false

//Knots Start

{seenBeginning:

    -> library
    - else:
    -> beginning
}

===beginning===
~ time = 10
~ seenBeginning = true
//Similar to Yarn opening
//Alistair is trying to prevent planet from exploding, cannot do it (imply that he's done this many times before and failed)
//Darling tells Alistair that he has to save what's important "treasure" from vault and bring up finding the "treasure" for "him"
//Give player some branching dialogue though it doesn't have much of an impact, just changes Darling's responses
//Darling explains that Alistair has to go back in time to find a way to get into the vault, he can start by going back and examining it before time 10 when it is pretty much already destroyed
//Darling will tell Alistair to go to time 3
-> library
    
    
===library===
//Room Description for Journal
{ time:
- 1:    
        ~ roomDescription = "Bustling with rumors and security won't let me close to the vault."
- 2:    
        ~ roomDescription = "Under rennovations and filled with security."
- 3:    
        ~ roomDescription = "Under rennovations and filled with security,"
- 4:    
        ~ roomDescription = "Nealy done with rennovations but filled with security."
- 5:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
- 6:    
        ~ roomDescription = "There's a huge crowd in the room because of the election."
- 7:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
- 8:    
        ~ roomDescription = "Library is empty and the vault is abandoned."
- 9:    
        ~ roomDescription = "Library is empty and the vault is abandoned. I feel rumbling below me."
- 10:   
        ~ roomDescription = "Library is lost. Fire everywhere, metal melting, vault too hot to touch."
}

//Content Start
What should I do?
    + [Look around]
        //Room Description for Player
        //Gives the players options to do actions if the variable requirements are met (will divert to different knot) (ex. investigate vault)
        { time:
        - 1:    Employees sit in tight circles around the library. There's no reading to be done, instead, there's an electricity in the air in the form of hush whispers.
        - 2:    Scaffolding grazes the arched cielings of the library and the smell of paint, hard wood, and oil linger in the air as carpenters navigate the space. Lab security keeps a close eye on the newcomers. 
        - 3:    Carpenters dip their brushes into fine oils and touch up the shelving and masons repair chips in the floor. The room is sectioned off and lab security stands at attention. //something messed up here
                * [Investigate the vault] -> InvestigateVault
                * [Keep looking around] -> library
        - 4:    A foreman walks around the newly rennovated library with a clip board and lab security following her everystep. Looks like rennovations are almost done. 
        - 5:    The library shines with newfound gusto and even the books seem a little newer. Lab employees gather around to marvel at it. 
        - 6:    People stand shoulder to shoulder, all looking at a group of lab board members sitting in a circle toward the front of the room. Everyone is eager to listen and some even stand on ladders to get the best vantage point. 
        - 7:    The library sits silently and shines coldly. Lab employees huddle like silent vultures over their books.
        - 8:    The library is gloom. Shelves of books soar to the cieling in the darkness and some tomes have been abandoned where they lay open on reading desks.
        - 9:    The floor vibrates and occasionally shutters under my feet. The books lining the library shift briefly then hold still once more.
        - 10:   Flames have claimed the library. Any metal is now liquid and only aids the fire in its quest for destruction.
        }
        -> library
    + [Look for someone to talk to]
        //NPC Description for Player and variable changes
        { time:
        - 1:    Who is there? (Add variable changes for NPCs present)
        - 2:    Who is there?
        - 3:    Who is there?
        - 4:    Who is there?
        - 5:    Who is there?
        - 6:    Who is there?
                ~shopownerPresent = true
                ~childPresent = true
                ~oldladyPresent = true
        - 7:    Who is there?
                ~julesPresent = true
        - 8:    Who is there?
                ~childPresent = true
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
    * [Don't talk to anyone] I don't need to talk to anyone right now. -> library
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

//Quest Specific Knots
===InvestigateVault===
//Get shooed out of the vault area (only current employees can get into vault or with permission of the director)
->DarlingPepTalk
===DarlingPepTalk===
//Pep talk with Darling and plant leads
//Talk to current lab head (in a different location)
