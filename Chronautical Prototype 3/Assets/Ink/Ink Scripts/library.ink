//Script for location LIBRARY
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
VAR julesDirector = false
VAR hasCode = false
VAR seenPepTalk = false
//More variables needed here for quest specifics

//Variables for if player has met NPC
VAR metJules = false
VAR metChild = false

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false */
//Jules = Jules Ambrose
//Child = Temperance Ward
//Old Lady/Storyteller = Miriam Harcourt
//Shopkeep = Uriah Bramble
//Director = Bennet Crabb

//Sprite/Background/Speaker
//#speaker:Alistair
//#sprite:Alistair_Sad
//#background:labInterior
//#NPC:Child_Neutral
//Maybe change asset name
//No space between colon and character/sprite/background


//Sets up if player has seen opening, if has seen it, skips the beginning knot
=== SeeBeginning ===
{seenBeginning: -> library|-> beginning}

//Knots start
===beginning===
~ TOGGLE_SLIDER_INTERACTABLE(false)
~PLAY_MUSIC("event:/Music/Prologue Music")
~PLAY_AMBIENCE("event:/Sound/Ambience/Prologue Ambience")
~ time = 10
~ seenBeginning = true
#background:Library_Interior
//~SET_PARAMETER("PrologueAmbience", 5)

When I was a boy, I put all my thoughts and dreams into a book. Sketches, diagrams, torn-out pages.
It was full of what I would become. Dreams of adventure in the stars piercing through the dark.
I was gripped with a frenzy to explore beyond my bubble of libraries and teahouses.
But, most of all, I dreamed of the star system lost.
Atlantis.
//Some sort of change in background here

#sprite:Alistair_Sad
#speaker:Alistair
//Shannon 
My colleagues are all gone. 
The lab will be lost.
The planet will be lost.
(But perhaps there's still a book, a piece of information, I haven't found yet.)
#sprite:Alistair_Neutral
(All this mustn't end in failure.)
There are so few tomes left, most have been consumed by fire or thrown to the ground by earthquakes.
The planet, Elore-Nabyke, will be lost. 
(But perhaps I can still save it.)
I throw myself to a bookshelf nearby and yank out tomes. There are so few left. Most have been consumed by fire.
(Perhaps I haven't tried this yet.)

#NPC:Darling_Neutral
#speaker:D4RL1N6
"Alistair."
//Shannon

#speaker:Alistair
'There's still time. I can still fix this, I just need to-'

#speaker:D4RL1N6
"Alistair, it is unwise to ignore me."

#speaker:Alistair
"I'm sorry, I'm not- I just need to find this book, I think I remember it saying something about the core."

#speaker:D4RL1N6
"The core is gone."
//Shannon

#speaker:Alistair
"It's not, I know better now, I can find a way to revive it-"

#speaker:D4RL1N6
"This is attempt number 37 Alistair. The core is gone. Is it not clear we can do nothing regarding the destruction of the planet?"
"During the last attempt, you right up to the planet's destruction."
"You barely gave yourself enough time to go back in time again."

#speaker:Alistair
* [I'm a failure] "If I can't even save this planet, what's the point?"
* [There must be a way] "There must be something I'm just not thinking of."

#speaker:D4RL1N6
- "You have done everything you can."
"I am sorry, Alistair, this quest of yours is futile. You need to save what is important."

#speaker:Alistair
"..."
"The vault. I need to get something out of there for him. He'll need it."
"I can at least save that..."
The vault shimmers under the immense heat in the library. It's tucked into the back of the room. It's clear even from this distance that touching the handle would burn my skin.

#speaker:D4RL1N6
"You will have to use your Astrolabe to return to a time before all this destruction." 
"One year in the past should be sufficient for now."
"Pull the slider to the year you would like to travel to, then activiate."
//Shannon

#speaker:Alistair
"Wha-"
"I know all this, I've done this many times."

#speaker:D4RL1N6
"My apologies, Alistair, it is part of my programming."
//Shannon
"Shall we go back in time?"

#speaker:Alistair
"Perhaps then we can find a way into the vault."
(Though I doubt it will be as simple as just opening it...)

#speaker:D4RL1N6
"Precisely."
#NPC:None
-> library
    
    
===library===
~ TOGGLE_SLIDER_INTERACTABLE(false)
//~TOGGLE_SLIDER_INTERACTABLE(true)
//Room Description for Journal
{ time:
- 1:    
        ~ roomDescription = "Bustling with rumors and security won't let me close to the vault."
        ~SET_PARAMETER("PrologueAmbience", 0)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 2:    
        ~ roomDescription = "Under rennovations and filled with security."
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 3:    
        ~ roomDescription = "Under rennovations and filled with security."
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)
        
- 4:    
        ~ roomDescription = "Nearly done with rennovations but filled with security."
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 5:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
        ~SET_PARAMETER("PrologueAmbience", 0)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 6:    
        ~ roomDescription = "There's a huge crowd in the room because of the election."
        ~SET_PARAMETER("PrologueAmbience", 2)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 7:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
        ~SET_PARAMETER("PrologueAmbience", 0)
        ~SET_PARAMETER("PrologueCharacters", 1)
- 8:    
        ~ roomDescription = "Library is empty and the vault is abandoned."
        ~SET_PARAMETER("PrologueAmbience", 3)
        ~SET_PARAMETER("PrologueCharacters", 4)
- 9:    
        ~ roomDescription = "Library is empty and the vault is abandoned. I feel rumbling below me."
        ~SET_PARAMETER("PrologueAmbience", 4)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 10:   
        ~ roomDescription = "Library is lost. Fire everywhere, metal melting, vault too hot to touch."
        ~SET_PARAMETER("PrologueAmbience", 5)
        ~SET_PARAMETER("PrologueCharacters", 0)
}

//Content Start
What should I do?
    + [Look around]
        //Room Description for Player
        //Gives the players options to do actions if the variable requirements are met (will divert to different knot) (ex. investigate vault)
        { time:
        - 1:    Employees sit in tight circles around the library. There's no reading to be done, instead, there's an electricity in the air in the form of hush whispers.
                +Investigate the vault -> Security
        - 2:    Scaffolding grazes the arched cielings of the library and the smell of paint, hard wood, and oil linger in the air as carpenters navigate the space. Lab security keeps a close eye on the newcomers. 
                +Investigate the vault -> Security
        - 3:    Carpenters dip their brushes into fine oils and touch up the shelving and masons repair chips in the floor. The room is sectioned off and lab security stands at attention. 
                +Investigate the vault -> Security
        - 4:    A foreman walks around the newly rennovated library with a clip board and lab security following her everystep. Looks like rennovations are almost done. 
                +Investigate the vault -> Security
        - 5:    The library shines with newfound gusto and even the books seem a little newer. Lab employees gather around to marvel at it. 
                +Investigate the vault -> InvestigateVault
        - 6:    People stand shoulder to shoulder, all looking at a group of lab board members sitting in a circle toward the front of the room. Everyone is eager to listen and some even stand on ladders to get the best vantage point. 
                +Listen in -> Election
        - 7:    The library sits silently and shines coldly. Lab employees huddle like silent vultures over their books.
                +Investigate the vault -> InvestigateVault
        - 8:    The library is gloom. Shelves of books soar to the cieling in the darkness and some tomes have been abandoned where they lay open on reading desks.
                +Investigate the vault -> InvestigateVault
        - 9:    The floor vibrates and occasionally shutters under my feet. The books lining the library shift briefly then hold still once more. 
                +Investigate the vault -> InvestigateVault
        - 10:   Flames have claimed the library. Any metal is now liquid and only aids the fire in its quest for destruction.
                +Investigate the vault -> HotVault
        }
        -> library
    

    //NPC Description for Player and variable changes
    + [Look for someone to talk to]
        { time:
        - 1:    Plenty of lab employees mill about, but all of them look too busy to talk to me.
                ~noNPCS=true
        - 2:    All I see are carpenters and the lab's security.
                ~noNPCS=true
        - 3:    All I see are carpenters and the lab's security.
                ~noNPCS=true
        - 4:    All I see are carpenters and the lab's security.
                ~noNPCS=true
        - 5:    Plenty of lab employees mill about, but all of them look too busy to talk to me.
                ~noNPCS=true
        - 6:    There are hundreds of people stuffed into the library. They're all listening to dozen board members speaking at the front of the room. It would be impossible for me to get a word in. 
                +Listen in->Election
        - 7:    Jules stands alone in the center of the room with his hands behind his back as he looks at the spines of books on the shelves.
                ~julesPresent = true
                ~noNPCS = false
        - 8:    I see a child sitting at one of the reading desks with their head in their hands. They don't notice me.
                ~childPresent = true
                ~noNPCS=false
        - 9:    There's not a soul in sight.
                ~noNPCS=true
        - 10:   There's not a soul in sight.
                ~noNPCS=true
        }
        -> NPCS

===NPCS===
{noNPCS:
    There is no one to talk to at this time. -> END
  - else:
  ~ TOGGLE_SLIDER_INTERACTABLE(false)
    Who should I talk to? 
    +{julesPresent} [Jules] -> JULES
    +{childPresent} [The Child] -> CHILD
    + [Don't talk to anyone]
    ~ TOGGLE_SLIDER_INTERACTABLE(true)
    -> END
}

//Knots below have conversations for NPCs that change depending on the time and if certain quest markers have been met
===JULES===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{metJules: -> Questions|-> meetJules}
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
#NPC:Jules_Neutral
#speaker:Jules
"What can I help you with?"
    + [Why are you here?] ->WhyHere
    + [What have you been up to?] ->WhatUp
    + [Nothing for now]
    #speaker:Jules
    "Let's speak again soon, Alistair."
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
        #NPC:None
        -> END //library

=WhyHere
#speaker:Alistair
"Why are you here, Jules?"

#speaker:Jules
"Ah."
"Well."
"I wanted to see the library again."
"The planet will fold in on itself within a few years."
"And evacuation plans are underway."
"Everyone will be off the planet soon..."
"But the library reminds me of our time as interns here at the lab."
"Remember that time?"
"It's truely nostolgic..."
        ->JULES

=WhatUp
#speaker:Alistair
"What have you been up to while I've been away?"
        
#speaker:Jules
"So much has changed since we were interns here at the lab."
"Many of the people we used to know have moved off planet."
"And well, I have a family now. It's funny how having children can change your perspective."
"... But you haven't changed much Alistair."
    + [Have changed] 
        #speaker:Alistair
        "I think I've changed, I've been all over the place."
        
    + [Have not changed] 
        #speaker:Alistair
        "I suppose I haven't changed that much after all..."
    - 
        #speaker:Jules
        "Perhaps you have. But you're still the same at your core."
        "... That's a good thing, Alistair. Don't lose your sense of wonder, your adventurous spirit."
        ++ [Promise] 
            #speaker:Alistair
            "I don't think I ever will, you can count on that."
            
            #speaker:Jules
            "Good."
                -> JULES
        ++ [We'll see] 
            #speaker:Alistair
            "I'm not sure Jules, there's..."
            
            #speaker:Jules
            "What is it Alistair?"
            
            #speaker:Alistair
            "There's just, there's a lot going on..."
            "It's complicated..."
            "I'll tell you some other time, alright?"
            
            #speaker:Jules
            "Of course."
                -> JULES

===CHILD===
{metChild: -> Questions|-> meetChild}
~ TOGGLE_SLIDER_INTERACTABLE(false)
#NPC:Child_Neutral
=meetChild
#speaker:Alistair
    "Hello there! What's your name?"
    
    #speaker:Child
    "..."
    
    #speaker:Alistair
    "Oh, well..."
    "My name is Alistair!"
    
    #speaker:Child
    "..."
    
    #speaker:Alistair
    "You... doing alright?"
    
    #speaker:Child
    "I'm fine."
    ~metChild = true
-> CHILD

=Questions
#speaker:Child
"... What do you want?"
    + [Lost?] -> Lost
    + [Parents?] -> Parents
    + [Nothing for now]
    #speaker:Child
    "Fine."
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
        #NPC:None
        -> END //library
=Lost
"Are you... lost? I don't think children are supposed to be in the lab." #speaker:Alistair
        #speaker:Child
        "I'm not lost."
        "I'm exploring."
        "Nobody is in the lab anyway. Everyone is getting ready to evacuate."
            ++ [You evacuate too?] 
                #speaker:Alistair
                "Shouldn't you be getting ready too?"
                
                #speaker:Child
                "I am ready. I have everything I need."
                #speaker: Alistair
            "Oh." 
            "Okay."
                -> CHILD
            
            ++ [Exploring the lab?] 
                #speaker:Alistair
                "You like exploring the lab then?"
                
                #speaker:Child
                "I've always wanted to see it."
                "This is the only way I'm able to. When everyone is gone..."
                #speaker: Alistair
            "Oh." 
            "Okay."
                -> CHILD
-> Questions

=Parents
"Do your parents know you're here?" #speaker:Alistair
        #speaker:Child
        "No."
        "They're packing up everything."
        "We're leaving the planet on a big Spacer."
        "It'll be cool to be on one, but..."
        "I just wanna stay here..."
        -> CHILD
-> Questions


//Quest Specific Knots
===InvestigateVault===
~ TOGGLE_SLIDER_INTERACTABLE(false)
#background:Vault
The vault is a marvel in of itself. It's a mass of bronze and golden circles that intersect messily like a bird's nest.
In the center, I see a series of numbers: 0-9. 
{seenPepTalk: | ->DarlingPepTalk}
    //* [Guess the code]
    + [Pry open door] 
        I squeeze my fingers into the door frame and put my foot on the door.
        I lean back and use all my strength to try to pry open the door, but the thing doesn't budge at all.
        Worth a shot.
        -> InvestigateVault
    + [Kick door] 
        I take a few steps back then give the vault door a good kick square in the center. 
        The vault doesn't shift.
        The only indication that I had kicked the thing at all was the slight pain that was growing in my foot.
        Ouch.
        -> InvestigateVault
    * {hasCode} [Input code]
        ->Ending
    ~ TOGGLE_SLIDER_INTERACTABLE(true)
    + [Do nothing] -> END //library


->DarlingPepTalk
===DarlingPepTalk===
~ TOGGLE_SLIDER_INTERACTABLE(false)
~seenPepTalk=true
#speaker:Alistair
"I've seen the vault opened before. It needs a code to be opened."

#speaker:D4RL1N6
#NPC:Darling_Neutral
"Did you see what the code was?"
//Shannon

#speaker:Alistair
"Well, yes, but the code is changed everytime by the Lab Director."
"They take security very seriously here."
"Unfortunately."

#speaker:D4RL1N6
"Then we have to find this Director."

#speaker:Alistair
"And somehow convince him to let us into the vault."

#speaker:D4RL1N6
"Don't be so melodramatic. We'll find a way. We've got to get your treasure."
//Shannon
"We may also be able to gather information from exploring this place."

#speaker:Alistair
"You're right as usual."
"We'll find a way to get my 'treasure'."
"If I remember corrently, the Director is usually somewhere in the lab."
"Jules used to say that he slept in his office, it seemed like the Director never left!"
#NPC:None
-> library

===Security===
~ TOGGLE_SLIDER_INTERACTABLE(false)
As I approach the vault, I see one of the vault's security promptly slide over and put himself directly into my path.
He crosses his arms and just stands there.
    + [Say hello] "Hello there!" #speaker:Alistair
                    The vault security guard just looks down at me.
                    He doesn't respond.
                    "Uh. I said hello there!" #speaker:Alistair
                    The guard still does not respond, but I see his eyebrow twitch.
                    Maybe it's best not to press him.
                    ++[Say hello again] "I said, hello-" #speaker:Alistair
                        "I heard you..." #speaker:Guard
                        "Oh! Apologies..." #speaker:Alistair
                        ~ TOGGLE_SLIDER_INTERACTABLE(true)
                        (He's not very talkative is he...)-> END //library
                    ++[Nevermind] I just smile and turn on my heel.
                                    ~ TOGGLE_SLIDER_INTERACTABLE(true)
                                    (Maybe I'll look elsewhere.) -> END //library

    + [Nevermind] I just smile and turn on my heel. 
                ~ TOGGLE_SLIDER_INTERACTABLE(true)
                (Maybe I'll look elsewhere.) -> END //library

//More interactions can be added here if/when we add options to try to break into the vault
~ TOGGLE_SLIDER_INTERACTABLE(true)
-> DONE



===HotVault===
~ TOGGLE_SLIDER_INTERACTABLE(false)
The vault shimmers under the immense heat in the library. It's clear even from this distance that touching the handle would burn my skin.
The treasure might even have melted inside the vault anyway.
~ TOGGLE_SLIDER_INTERACTABLE(true)
-> END //library



===Election===
~ TOGGLE_SLIDER_INTERACTABLE(false)
//variables will need to be added to change the election outcome and stance of the NPCs
As crowds of people close in on the board, I push and wriggle my way closer to the front.
Now that I'm closer, I can hear a bit more of the board members' speech.
#speaker:Board member
"Come forth, any of you who wish to speak."
"The floor is open for community comments on the appointment of Bennet Crabb as Lab Director or otherwise miscellaneous topics kindred to the community's concerns." -> ShopownerMono
    =ShopownerMono
        #speaker:Shopowner
        #NPC:Shopkeep_Neutral
        ~SET_PARAMETER("PrologueCharacters", 3)
        "I can speak first."
        "I think I speak on behalf of the entire community when I say that we are all very thankful for the years of dedicated work Doctor Crabb has devoted to the lab and to Elore-Nabyke."
        "But."
        "I think I also speak for the community when I say that the lab and the director's handling of the evacuation of the planet to be entirely abhorent."
        "Is it not the lab itself that discovered the core's damaged state? 
        "Why have you not put more work into fixing it?"
        "Why is the lab still functioning as if the planet is not going to explode in a few years?"
        "I pose these questions not as a way to tear down all the work you all have done, but this is our planet too that you are asking us to leave!"
        "I won't take much more of your time. But I don't believe that Bennet Crabb is suited to deal with this catastrophe. Perhaps it is time for someone younger with more gumption to lead us."
        The faces of the board remain steely, but I hear the crowd around me murmur turbulently in excitement and concern. -> ChildMono
    =ChildMono
        #speaker:Child
        #NPC:Child_Neutral
        ~SET_PARAMETER("PrologueCharacters", 4)
        "Okay..."
        "Well."
        "Um, so."
        "I know I'm not very old."
        "But when I was little, I wanted to work on the core."
        "I wanted to see all the artifacts the lab gets from all over the universes."
        "I..."
        "I thought that you people were just... I thought you just wanted to do that, just be dedicated to science and discovery."
        "But you're not."
        "You just want to keep things as they are, the old way, and stay right here..."
        "That's all I wanted to say."
        "Yeah..." ->OldLadyMono
    =OldLadyMono
        #speaker:Storyteller
        #NPC:Storyteller_Neutral
        ~SET_PARAMETER("PrologueCharacters", 5) //Shannon wrong parameter, change to hushed
        As the Old Lady steps up to speak, I hear the crowd sigh and groan.
        //Shannon
        A few board members shake their heads and cast their eyes downward.
        "Yes!"
        "Yes, you all complain and sqwauk because you know you are about to hear everything you wish not to accept as truth!"
        "I will open your eyes- Listen now!"
        "The planet will not be destroyed- Elor-Nabyke will not fall!"
        "They are distracting us- lying to us!"
        "Our planet does not matter."
        "There are hidden planets in the multiverse, hidden in the strings that we can not see!"
        "And there are contraptions of extordinatary power, they are hiding them from us! To collect it for themselves and-"
        The Old Lady's ravings are drowned out as the crowd's murmuring and muttering rise to a crashendo.
        //Shannon change parameter back to loud
        I can't hear her words, but the woman writhes and grins at the board as spittle sprays in their direction.
#speaker:Lab Director
#NPC:Labhead_Neutral
"Silence!"
"I will have order!"
#speaker:Alistair
It takes awhile for the room to quiet down despite the Director's shouting. Once the Director can speak over the crowd, the meeting resumes as the board members begin to resume their deliberations monotonously. 
//Shannon change parameter back to hushed
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> END



===Ending===
//placeholder for ending
//Shannon input code sound
-> DONE