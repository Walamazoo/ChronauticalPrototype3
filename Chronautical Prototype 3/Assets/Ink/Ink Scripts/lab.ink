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
    ~ roomDescription = "A group is listening to a news projection."
- 2:    
    ~ roomDescription = "The lab is busy, seems like there's plenty of work coming in."
- 3:    
    ~ roomDescription = "The room is filled with booths of scientists showing off their work, must be a fair."
- 4:    
    ~ roomDescription = "Not much seems to be happening in the lab."
- 5:    
    ~ roomDescription = "The Director is giving an announcement."
- 6:    
    ~ roomDescription = "Room is empty but lots of noise coming from the library. "
- 7:    
    ~ roomDescription = "The Lab Director election has concluded."
- 8:    
    ~ roomDescription = "Much of the equipment and furniture is gone."
- 9:    
    ~ roomDescription = "Rumbling from below."
- 10:   
    ~ roomDescription = "Lab is gone, the planet will be destroyed soon."
}

//Content Start
What should I do?
    + [Look around]
        //Room Description for Player
        //Gives the players options to do actions if the variable requirements are met (will divert to different knot) (ex. investigate vault)
        { time:
        - 1:    A handful of scientists huddle around a projected figure I don't recognize, but they seem to be listening somberly.
                +Listen in -> OtherPlanetAnnounce
        - 2:    The lab is filled with a buzzling excitement and energy as scientists, assistants, and cityfolk move about from task to task. 
        - 3:    The room is lined with booths, boards, and flashy experiments. Judges walk around with their hands behind their backs as eager young scientists stand at attention.
                +Investigate -> ScienceFair
        - 4:    The lab is quiet. A desk clerk taps their pen against a clipboard at random.
        - 5:    A large crowd of various employees of the lab crowd around a projection of the Director, even the wasteman strains to listen.
                Everyone is silent.
                +Investigate -> AnnounceDestruction
        - 6:    The lab is empty, but I hear the roar of a crowd coming from the library. 
        - 7:    The lab is litered with balloon arches and confetti liters the ground. 'DIRECTOR'S NAME continues reign' is sprawled everywhere on posers and decorations.
                Lab employees simply step over the confetti and continue their work.
        - 8:    The lab is incredibly bare. I see very few lab stations remaining and everything that wasn't attached to the floor or the wall is gone, replaced only by a clean spot in the layer of dust.
        - 9:    A layer of dust covers everything in the lab, but there was hardly anything for it to cover besides the floor and walls. I feel a quiet and deep rumbling far below me.
        - 10:   What was once a lab has now been completely swallowed up by a monsterous hole. Fire has consumed most of the other sections of the building, but the hole seems to shoot straight down to the center of the planet.
        }
        -> lab
    //NPC Description for Player and variable changes
    + [Look for someone to talk to]
        { time:
        - 1:    here
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

===OtherPlanetAnnounce===


===ScienceFair===


===AnnounceDestruction===