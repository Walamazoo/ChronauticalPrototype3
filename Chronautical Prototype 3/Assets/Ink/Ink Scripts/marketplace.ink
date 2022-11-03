//Script for location MARKETPLACE

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
VAR directorName = "Bennet Crabb"

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
->marketplace
===marketplace===
#background:Marketplace
#sprite:Alistair_Neutral
//Room Description for Journal
{ time:
- 1:    ~ roomDescription = "Market goers busy with gossip."
- 2:    ~ roomDescription = "Lots of new things and people in the market."
- 3:    ~ roomDescription = "Tourists and visitors from off planet stuff the marketplace."
- 4:    ~ roomDescription = "Place is slow today, not many shoppers."
- 5:    ~ roomDescription = "Projection of the Director is making an announcement."
- 6:    ~ roomDescription = "Marketplace is a ghost town."
- 7:    ~ roomDescription = "Seems like something happened, everyone is talking about it."
- 8:    ~ roomDescription = "Everyone is selling mundane things."
- 9:    ~ roomDescription = "Lots of people are packing up and getting onto Atmos vessals."
- 10:   ~ roomDescription = "The marketplace is completely devoid of life."
}

//Content Start
What should I do?
    + [Look around]
        //Room Description for Player
        //Gives the players options to do actions if the variable requirements are met (will divert to different knot) (ex. investigate vault)
        { time:
        - 1:    The marketplace is full of small shops, booths, and stands.
                The people in the market are bubbling with hushed chatter and gossip.
        - 2:    The marketplace is stuffed with new and exotic goods.
                An unusual amount of people crowd around each booth.
        - 3:    I see many travelers from off planet milling about the marketplace. They all seem the intellectual sort.
        - 4:    A few lone shoppers move from stand to stand.
                One shop owner leans heavily against his display and begins to nod off.
        - 5:    Everyone in the marketplace is gathered around a large projection of the Director, {directorName}. 
        - 6:    The marketplace is completely empty. Booths and stalls still line the square, but no trinkets or produce are displayed and there's not a soul in sight. 
        - 7:    The people in the market are bubbling with hushed chatter and gossip. 
        - 8:    The marketplace is full of random and seemingly useless items. Clothes, trinkets, junk, books, pens, and all sorts of furniture.
        - 9:    Atmos vessals rest in and near the marketplace as lines of people make their way onto them. Most everyone has a suitcase and a somber expresion as they wait to board.
        - 10:   A once large marketplace has now been replaced with empty, collapsing stalls and overgrown walk ways. The stench of smoke fills the market and some stalls even collapse as the planet shutters violently.
        }
        -> marketplace
    //+ [Look for someone to talk to]
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
    * [Don't talk to anyone] I don't need to talk to anyone right now. -> marketplace
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
-> DONE

===DIRECTOR===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10
-> DONE

===SHOPOWNER===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10
-> DONE

===CHILD===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10
-> DONE

===OLDLADY===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10
-> DONE
//Knots will be added for specific quest events/actions