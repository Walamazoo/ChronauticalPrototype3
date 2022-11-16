//Script for location MARKETPLACE
INCLUDE Globals.ink
//Time Variable
/* VAR time = 0

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

//Placeholder: VARIABLES FOR THE SIDE QUEST STUFF
VAR julesDirector = false
VAR hasCode = false

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false 
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false
VAR metJules = false
VAR metChild = false
VAR metShopowner = false
VAR metOldlady = false */

//Knots Start
->marketplace
===marketplace===
~ TOGGLE_SLIDER_INTERACTABLE(false)
#background:Marketplace
#sprite:Alistair_Neutral
//Room Description for Journal
{ time:
- 1:    
    ~ roomDescription = "Market goers busy with gossip."
    ~SET_PARAMETER("PrologueAmbience", 10)
    {SET_PARAMETER("PrologueCharacters", 4)}
- 2:    
    ~ roomDescription = "Lots of new things and people in the market."
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 4)}
- 3:
    ~ roomDescription = "Tourists and visitors from off planet stuff the marketplace."
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 5)}
- 4:    
    ~ roomDescription = "Place is slow today, not many shoppers."
    {SET_PARAMETER("PrologueAmbience", 11)}
    {SET_PARAMETER("PrologueCharacters", 5)}
- 5:    
    ~ roomDescription = "Projection of the Director is making an announcement."
    {SET_PARAMETER("PrologueAmbience", 11)}
    {SET_PARAMETER("PrologueCharacters", 3)}
- 6:    
    ~ roomDescription = "Marketplace is a ghost town."
    {SET_PARAMETER("PrologueAmbience", 13)}
    {SET_PARAMETER("PrologueCharacters", 0)}
- 7:    
    ~ roomDescription = "Seems like something happened, everyone is talking about it."
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 3)}
- 8:    
    ~ roomDescription = "Everyone is selling mundane things."
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 1)}
- 9:    
    ~ roomDescription = "Lots of people are packing up and getting onto Atmos vessals."
    {SET_PARAMETER("PrologueAmbience", 12)}
    {SET_PARAMETER("PrologueCharacters", 1)}
- 10:   
    ~ roomDescription = "The marketplace is completely devoid of life."
    {SET_PARAMETER("PrologueAmbience", 13)}
    {SET_PARAMETER("PrologueCharacters", 0)}
}

//Content Start
What should I do?
    + [Look around]
        //Room Description for Player
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
        -> END //marketplace
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
    + [Look for someone to talk to]
        //NPC Description for Player
        { time:
        - 1:    //PLACEHOLDER
                ~ childPresent = true
                ~ oldladyPresent = true
        - 2:    //PLACEHOLDERWho is there?
                ~ julesPresent = true
                ~ childPresent = true
                ~ oldladyPresent = true
        - 3:    //PLACEHOLDERWho is there?
                ~ shopownerPresent = true
                ~ childPresent = true
                ~ oldladyPresent = true
        - 4:    //PLACEHOLDERWho is there?
                ~ shopownerPresent = true
                ~ oldladyPresent = true
        - 5:    //PLACEHOLDERWho is there?
                ~ shopownerPresent = true
                ~ oldladyPresent = true
        - 6:    //PLACEHOLDERWho is there?
                ~noNPCS=true
        - 7:    //PLACEHOLDERWho is there?
                ~ shopownerPresent = true
                ~ childPresent = true
        - 8:    //PLACEHOLDERWho is there?
                ~ julesPresent = true
                ~ shopownerPresent = true
                ~ childPresent = true
        - 9:    //PLACEHOLDERWho is there?
                ~ julesPresent = true
        - 10:   //PLACEHOLDERWho is there?
                ~noNPCS=true
        }
        -> NPCS

===NPCS===
{noNPCS:
    There is no one to talk to at this time. ->END
  - else:
    ~ TOGGLE_SLIDER_INTERACTABLE(false)
Who should I talk to? 
    *{julesPresent} [Jules] -> JULES
    *{shopownerPresent} [The Shopowner] -> SHOPOWNER
    *{childPresent} [The Child] -> CHILD
    *{oldladyPresent} [The Old Lady] -> OLDLADY
    *[Don't talk to anyone] I don't need to talk to anyone right now. 
    ~ TOGGLE_SLIDER_INTERACTABLE(true)
    -> END
}

//Jules Ambrose NPC Convo
===JULES===
~ TOGGLE_SLIDER_INTERACTABLE(false)
//{SET_PARAMETER("PrologueCharacters", 1)}
{SET_PARAMETER("PrologueCharacters", 1)}
{metJules: -> Questions| -> meetJules}

=meetJules
//INTRODUCTION PLACEHOLDER
~metJules = true
-> JULES

=Questions
//Intro convo
//+ [Convo 1] -> Convo1
+ [Nothing for now] -> END
~ TOGGLE_SLIDER_INTERACTABLE(true)
//1 option for a miscellaneous convo (something to do with this specific time and what's happening in the world or to the character)

=Convo1
//placeholder CONTENT
-> Questions




//Uriah Bramble (shopowner/shopkeep) NPC Convo
===SHOPOWNER===
~ TOGGLE_SLIDER_INTERACTABLE(false)
//{SET_PARAMETER("PrologueCharacters", 3)}
{metShopowner: -> Questions| -> meetShopowner}

=meetShopowner
//INTRODUCTION PLACEHOLDER
~metShopowner = true
-> SHOPOWNER

=Questions
//Intro convo
//+ [Convo 1] -> Convo1
+ [Nothing for now] -> END
~ TOGGLE_SLIDER_INTERACTABLE(true)
//1 option for a miscellaneous convo (something to do with this specific time and what's happening in the world or to the character)

=Convo1
//placeholder CONTENT
-> Questions




//Temperance Ward (Child) NPC Convo
===CHILD===
~ TOGGLE_SLIDER_INTERACTABLE(false)
//{SET_PARAMETER("PrologueCharacters", 4)}
{SET_PARAMETER("PrologueCharacters", 4)}
{metChild: -> Questions| -> meetChild}

=meetChild
//INTRODUCTION PLACEHOLDER
~metChild = true
-> CHILD

=Questions
//Intro convo
//+ {time = X} [Convo 1] -> Convo1
+ [Nothing for now] -> END
~ TOGGLE_SLIDER_INTERACTABLE(true)
//1 option for a miscellaneous convo (something to do with this specific time and what's happening in the world or to the character)

=Convo1
//placeholder CONTENT
-> Questions


//Miriam Harcourt (Old Lady/Storyteller) NPC Convo
===OLDLADY===
~ TOGGLE_SLIDER_INTERACTABLE(false)
//{SET_PARAMETER("PrologueCharacters", 5)}
{SET_PARAMETER("PrologueCharacters", 5)}
{metOldlady: -> Questions| -> meetOldlady}

=meetOldlady
//INTRODUCTION PLACEHOLDER
~metOldlady = true
-> OLDLADY

=Questions
//Intro convo
//+ [Convo 1] -> Convo1
+ [Nothing for now] -> END
~ TOGGLE_SLIDER_INTERACTABLE(true)
//1 option for a miscellaneous convo (something to do with this specific time and what's happening in the world or to the character)

=Convo1
//placeholder CONTENT
-> Questions



//Quest Specific Knots
//Placeholder