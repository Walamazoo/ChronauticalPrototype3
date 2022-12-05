//Script for location MARKETPLACE
INCLUDE Globals.ink
//Time Variable for testing
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
        - 10:   A once large marketplace has now been replaced with empty, collapsing stalls and overgrown walkways. The stench of smoke fills the market and some stalls. Some shops crumble as the planet shutters violently.
        }
        -> END //marketplace
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
    + [Look for someone to talk to]
        //NPC Description for Player
        { time:
        - 1:    An old storyteller waves her hands excitedly. Most of the adults who stop to listen soon scoff and move on, but the younger folk seem enthralled. One child in paritcular listens ecitedly, all starry-eyed.
                ~ childPresent = true
                ~ oldladyPresent = true
                ~noNPCS=false
        - 2:    The old storyteller strains to be heard among the bustling crowd, the shoppers cambering over the new goods. An energetic child runs past. Following their movement I happen to spot Jules, both helping direct shipments and taking glances at the wares.
                ~ julesPresent = true
                ~ childPresent = true
                ~ oldladyPresent = true
                ~noNPCS=false
        - 3:    A large number of visitors from off-planet flood the market, no doubt here to see the showcase in the lab. A shopkeep stands out on the street, taking the opportunity to try and sell souvenirs. The old storyteller desperately tries to catch the attention of the foreigners as well, but her only audience member seems to be a young teen. 
                ~ shopownerPresent = true
                ~ childPresent = true
                ~ oldladyPresent = true
                ~noNPCS=false
        - 4:    The old storyteller is the most animated thing here, weaving tales to pass the time. A shopkeep idlely cleans a window, only half listening.
                ~ shopownerPresent = true
                ~ oldladyPresent = true
                ~noNPCS=false
        - 5:    Everyone seems focused on a large projection of the lab director. A shopkeep I recognize has left their store to watch, and even the old storyteller stays quiet and watches in tently.
                ~ shopownerPresent = true
                ~ oldladyPresent = true
                ~noNPCS=false
        - 6:    The market is barren, everyone seems to be elsewhere at the moment.
                ~noNPCS=true
        - 7:    The people milling about seem more interesting in gossip than shopping. A shopkeep shoos away a teen loitering in front of their store, and they sulk as they leave.
                ~ shopownerPresent = true
                ~ childPresent = true
                ~noNPCS=false
        - 8:    I spot Jules from across the way, moving through the market somewhat listlessly. A shopkeep calls out to him, but to no avail. A teen bumps into him roughly before quickly moving away. 
                ~ julesPresent = true
                ~ shopownerPresent = true
                ~ childPresent = true
                ~noNPCS=false
        - 9:    I scan the lines of people waiting to board, and spot Jules near the front of one. His wife is with him, though she steps forward to be cleared to board.
                ~ julesPresent = true
                ~noNPCS=false
        - 10:   The marketplace is devoid of life.
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
#NPC:Jules_Neutral
~metJules=true

    #speaker:Alistair
    "Jules? Is that you?"
    
    #speaker:Jules
    "Alistair!"
    "Alistair, you-"
    "You've been gone for so long."
    "Of all times, why are you back now?"
    
    #speaker:Alistair
    "Well, it's quite a long story..."
    "But it's good to see you again!"
    
    #speaker:Jules
    "I'm sorry, it is good to see you too..."
    "Where have you been? You were gone for so long, we were all worried something had happened."
    
    +[Been out and about] 
        #speaker:Alistair
        "Oh I've been out and about."
        
        #speaker:Jules
        "Out and about? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        
        #speaker:Jules
        "You are too easy to read my friend." -> JULES
    +[Adventuring] 
        
        #speaker:Alistair
        "Oh I've been... adventuring."
        
         #speaker:Jules
        "Out and about? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        
        #speaker:Jules
        "You are too easy to read my friend." -> JULES

=Questions
#speaker:Jules
"What can I help you with?"
+ {time == 2} [Busy?] ->Busy
+ {time == 8} [You okay?] ->Okay
+ {time == 9} [Heading out?] ->Heading
+ [Nothing for now]
    #speaker:Jules
    "Let's speak again soon, Alistair."
    #NPC:None 
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
        -> DONE

=Busy
#speaker:Alistair
"Sure is busy, huh? I would have expected you to be in the lab with all this going on."

#speaker:Jules
"Ah, well, I'm still doing lab work. I've been tasked with making sure artefacts that need to be examined, well, end up getting examined."
"A lot of what's here is very intruiging."

#speaker:Alistair
+ [Any side benefits?] 
    #speaker:Alistair
    "And I'm sure you benefit from getting the first look."
    "In case any of it makes it back to market, I mean."
    
    #speaker:Jules
    "Oh come now, you know how the lab operates. I'd be lucky if these get to see the light of day again!"
    "Probably out of my price range, too." 
    "I've got other things to focus on."
    
    #speaker:Alistair
    "Ha ha... Yeah, I suppose being frugal is a vrtue."
    (Never see the light of day, huh?)
    (... So much will be lost...)
        -> Questions
    
+ [You sure are dilligent.] 
    #speaker:Alistair
    "You're quite the hard worker, to do all this. It's always been impressive."
    
    #speaker:Jules
    "Flattery won't get you anywhere, old friend."
    "Especially not to where you can get your hands on these very interesting and breakable artefacts."
    
    #speaker:Alistair
    I scoff in an exaggerated manner.
    "Jules! You wound me! Me, messing with artifacts, perish the thought!"
    "...I meant it, though. I've been hard at work lately, and it's been encouraging to see I'm not the only one."
    
    #speaker:Jules
    "Well then, thank you, Alistair. I wish you luck."
    "Now if you'll excuse me, I really must be going."
    "these boxes won't label themselves."
        -> Questions

=Okay
#speaker:Alistair
    "Jules! Are you alright?"
    "You seem... Not all yourself."
    
#speaker:Jules
    "Alistair..."
    "It's just... The lives of all these people, laid out to be pawned off."
    "I came to see what I could possibly get for Christa and myself, but..."
    "Seeing it all just... It's all sudeenly hit me."
    
#speaker:Alistair
    "I'm... Sorry."
    (For everything, my friend. I'm so sorry.)
    
#speaker:Jules
    "No, no need for that, Alistair."
    "Just me wallowing a bit. A bad habit as of late."
    "Seeing you, saying it out loud, has helped."
    "I'm going to look around a bit more..."
-> Questions

=Heading
#speaker:Alistair
    "Jules... Safe travels."
    
#speaker:Jules
    "Thank you. You as well."
    "Wait... You are going to get leave as well, correct? Why aren't you in line?"
    
#speaker:Alistair
    (Ah... That's right, it is strange. Hm.)
    + [Private ship]
    #speaker:Alistair
    "I actualy have my own vessel. It's parked not too far from here."
    "The... Solar Wind. A fine ship."
    + [Still have unfinished buisiness]
    #speaker:Alistair
    "I... Stil have a bit of business here. I can't leave quite yet."
    "It's important that I stay."
    -
    #speaker:Jules
    "Alistair, you-"
    
    #speaker:
    Before Jules can finish, the Atmos security personnel calls for him to be checked. Jules spares one last look at me before turning to go.
    
    #speaker:Jules
    "Please, be safe."
    
    #speaker:Alistair
    "I promise, Jules. I promise."
    (And this is a promise I intend not to break...)
    
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
#speaker:Shopowner
//34578
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
//INTRODUCTION PLACEHOLDER (pull over from library)
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