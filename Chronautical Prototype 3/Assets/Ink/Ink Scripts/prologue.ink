//Script for location LIBRARY
INCLUDE Globals.ink


//Testing
//-> beginning
//~ time = 4

//NPC Names Reference
//Jules = Jules Ambrose
//Child = Temperance Ward
//Old Lady/Storyteller = Miriam Harcourt
//Shopkeep = Uriah Bramble
//Director = Bennet Crabb

//Sprite/Background/Speaker Tags Format
//#speaker:Alistair
//#sprite:Alistair_Sad
//#background:labInterior
//#NPC:Child_Neutral
//No space between colon and character/sprite/background

//Will need something to set these variables to true or false with minimap stuffs

//If the player has seen the beginning, skip beginning knot
=== SeeBeginning ===

{seenBeginning: -> LIBRARY|-> beginning}

//Content knots start
===beginning===
//-> library
~PLAY_MUSIC("event:/Music/Prologue Music")
~PLAY_AMBIENCE("event:/Sound/Ambience/Prologue Ambience")
~ time = 10
~ seenBeginning = true
~ inTutorial = true
~TOGGLE_MINIMAP(false)
~TOGGLE_MINIMAP_INTERACTABLE(false)
#background:Silhouette_Intro

When I was a boy, I put all my thoughts and dreams into a book. Sketches, diagrams, torn-out pages.
It was full of what I would become; dreams of adventure in the stars piercing through the dark emptiness.
I was gripped with a frenzy to explore beyond my bubble of libraries and teahouses.
But, most of all, I dreamed of the star system lost.
Atlantis.

~TOGGLE_FILTER(true)
~SET_PARAMETER("PrologueMusic", 5)
~PLAY_SOUND("event:/Sound/SFX/Prologue/reflective shift")
#background:Library_Interior
#sprite:Alistair_Sad 
#speaker:Alistair
My colleagues are all gone. 
The lab will be lost.
The planet will be lost.
(But perhaps there’s... Something, anything I’m missing. There has to be.
(A book, a piece of information, I haven't found yet.)

#sprite:Alistair_Neutral
(All this mustn't end in failure.)
There are so few tomes left, most have been consumed by fire or thrown to the ground by earthquakes.
The vault shimmers in the heat.
The planet, Elore-Nabyke, will be lost. 
(But perhaps I can still save it.)

~PLAY_SOUND("event:/Character Barks/Darling/DarlingDisappointed")
#NPC:Darling_Neutral
#speaker:D4RL1N6
"Alistair."

#sprite:Alistair_Suspicious
#speaker:Alistair
"There's still time. I can still fix this, I just need to-"

#speaker:D4RL1N6
"Alistair, it is inadvisable to ignore me."

#sprite:Alistair_Distant
#speaker:Alistair
"I'm sorry, I'm not- I just need to find this book, I think I remember it saying something about the core."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingFrustrated")
#speaker:D4RL1N6
"The core is gone."

#speaker:Alistair
"It's not, I know better now, I can find a way to revive it-"

~PLAY_SOUND("event:/Character Barks/Darling/DarlingFrustrated")
#speaker:D4RL1N6
"This is attempt number 37 Alistair. The core is gone."
"Is it not clear we can do nothing regarding the destruction of the planet?"
"During the last attempt, you went right up to the planet's destruction."
"You barely gave yourself enough time to go back in time again." 

#speaker:Alistair
But...
* [I'm a failure] "If I can't even save this planet, what's the point?"
* [There must be a way] "There must be something I'm just not thinking of."

#speaker:D4RL1N6
- "You have done everything you can."
#speaker:D4RL1N6
"I am sorry, Alistair, this quest of yours is futile. You need to save what is important."

#sprite:Alistair_Sad
#speaker:Alistair
"..."
"I have to get something out of the vault for Jack."
"I can at least save that..."
"I have to, he'll need it to find me."

The vault is tucked into the back of the library.
It's clear even from this distance that touching the handle would burn my skin.
//Tutorial Start
~PLAY_SOUND("event:/Character Barks/Darling/DarlingThinking")
#speaker:D4RL1N6
"Then you will have to go back in time."
~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
"This calls for the safety protocol."

#sprite:Alistair_Confident
#speaker:Alistair
"Ah yes."
"The safety protocol."
"We'll have to make sure everything is in working order."
#sprite:Alistair_Neutral
#speaker:D4RL1N6
"Of course, Alistair."
"Time travel can be dangerous after all."
~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
"You will have to use your Astrolabe to return to a time before all this destruction." 
"One year in the past should be sufficient for now."
~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
"Pull the slider to the year you would like to travel to, then activate."
->END


===DEVINTROSKIP===
~TOGGLE_FILTER(true)
~PLAY_SOUND("event:/Sound/SFX/Prologue/reflective shift")
#background:Library_Interior
#sprite:Alistair_Neutral 
~TOGGLE_JOURNAL(true)
~CREATE_JOURNAL_OBJECT("D4RL1N6", "Person", "My robot companion that helps to keep me on task.", "I built D4RL1N6 myself, and he's quickly become one of my best friends as he keeps me company when no one else will.")
//~CREATE_TIMELINE_CLUE("End of beginning", "placeclue", "No way to save the planet.", "All of my attempts have failed to save Elore-Nabyke. I have to retrieve what's in the vault instead.")
~TOGGLE_SLIDER(true)
-> LIBRARY

===Tutorial===
Let's see....
{ time:
- 1:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 2:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 3:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 4:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 5:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 6:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 7:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 8:    #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
- 9:    -> TutorialMinimap
- 10:   #speaker:D4RL1N6
        #NPC:Darling_Neutral
        "This isn't the right time, Alistair. Go to the year 3929."
}
-> END

=TutorialMinimap
#speaker:Alistair
"Perhaps now we can find a way into the vault."

#speaker:D4RL1N6
#NPC:Darling_Neutral
"It seems that even without the fire the vault can not be opened." 
"But, we now have valuable information we can put in the journal."
~TOGGLE_JOURNAL(true)
~CREATE_JOURNAL_OBJECT("D4RL1N6", "Person", "My robot companion that helps to keep me on task.", "I built D4RL1N6 myself, and he's quickly become one of my best friends as he keeps me company when no one else will.")
~CREATE_TIMELINE_CLUE("End of beginning", "placeclue", "No way to save the planet.", "All of my attempts have failed to save Elore-Nabyke. I have to retrieve what's in the vault instead.")
~TOGGLE_SLIDER(true)

#speaker:D4RL1N6
"This is the end of the safety protocol."

#sprite:Alistair_Suspicious
#speaker:Alistair
"Thank you."
"Now, I'd better find some way into this vault..."

~inTutorial = false
~SET_PARAMETER("PrologueMusic", 0)
~TOGGLE_MINIMAP_INTERACTABLE(true)
#speaker:D4RL1N6
"We should investigate the vault further now that it is not too hot for your human hands."
-> LIBRARY


===LIBRARY===
//Tutorial Check
{inTutorial: -> Tutorial}
//Room Description for Journal
{ time:
- 1:    
        ~ roomDescription = "Gossip about the announcement, and security won't let me close to the vault."
        ~SET_PARAMETER("PrologueTime", 1)
        ~SET_PARAMETER("PrologueAmbience", 0)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 2:    
        ~ roomDescription = "Under renovations and filled with security."
        ~SET_PARAMETER("PrologueTime", 1)
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 3:    
        ~ roomDescription = "Under renovations and filled with security."
        ~SET_PARAMETER("PrologueTime", 5)
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)

- 4:    
        ~ roomDescription = "Nearly done with renovations but filled with security."
        ~SET_PARAMETER("PrologueTime", 5)
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 5:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
        ~SET_PARAMETER("PrologueTime", 5)
        ~SET_PARAMETER("PrologueAmbience", 0)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 6:    
        ~ roomDescription = "There's a huge crowd in the room because of the election."
        ~SET_PARAMETER("PrologueTime", 5)
        ~SET_PARAMETER("PrologueAmbience", 2)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 7:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
        ~SET_PARAMETER("PrologueTime", 5)
        ~SET_PARAMETER("PrologueAmbience", 0)
        ~SET_PARAMETER("PrologueCharacters", 1)
- 8:    
        ~ roomDescription = "Library is empty and the vault is abandoned."
        ~SET_PARAMETER("PrologueTime", 5)
        ~SET_PARAMETER("PrologueAmbience", 3)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 9:    
        ~ roomDescription = "Library is empty and the vault is abandoned. I feel rumbling below me."
        ~SET_PARAMETER("PrologueTime", 10)
        ~SET_PARAMETER("PrologueAmbience", 4)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 10:   
        ~ roomDescription = "Library is lost. Fire everywhere, metal melting, vault too hot to touch."
        ~SET_PARAMETER("PrologueTime", 10)
        ~SET_PARAMETER("PrologueAmbience", 5)
        ~SET_PARAMETER("PrologueCharacters", 0)
}
#background:Library_Interior
#NPC:None
#speaker:
#sprite:Alistair_Neutral
Let's see...
-> evaluatelibrary
   // + [Look around]
        //Room Description for player and choices
        { time:
        - 1:    Employees sit in tight circles around the library. There's no reading being done, instead, there's an electricity in the air in the form of hushed whispers.
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 2:    Scaffolding grazes the arched ceilings of the library. The smells of paint, hardwood, and oil linger in the air as carpenters navigate the space. Lab security keeps a close eye on the newcomers. 
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 3:    Carpenters dip their brushes into fine lacquers to coat the rows of shelves as masons repair chipped floors. The room is sectioned off and lab security stands at attention. 
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 4:    A foreman paces around the renovated library carrying a clipboard, lab security following her every step. Looks like renovations are almost done. 
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 5:     Lab employees gather around to marvel at the library that shines with newfound gusto. Even the books seem a little newer.
               +Investigate the vault -> InvestigateVault
               +{seenPepTalk}Check elsewhere -> END
        - 6:    People stand shoulder to shoulder, all looking at a group of lab board members sitting in a circle toward the front of the room. Everyone is eager to listen and some even stand on ladders to get the best vantage point. 
                +Listen in -> Election
                +{seenPepTalk}Check elsewhere -> END
        - 7:    The library sits silently and shines coldly. Lab employees huddle like silent vultures over their books.
                +Investigate the vault -> InvestigateVault
                +{seenPepTalk}Check elsewhere -> END
        - 8:    The library is steeped in gloom. Shelves of books soar to the ceiling in the darkness and some tomes have been abandoned where they lay open on reading desks.
                +Investigate the vault -> InvestigateVault
                +{seenPepTalk}Check elsewhere -> END
        - 9:    The floor vibrates and occasionally shutters under my feet. The books lining the library shift briefly, then hold still once more. 
                +Investigate the vault -> InvestigateVault
                +{seenPepTalk}Check elsewhere -> END
        - 10:   Flames have claimed the library. Any metal is now liquid and only aids the fire in its quest for destruction.
                +Investigate the vault -> HotVault
                +{seenPepTalk}Check elsewhere -> END
        }
        //-> library
        
=== evaluatelibrary ===
{ time:
        - 1:    Employees sit in tight circles around the library. There's no reading being done, instead, there's an electricity in the air in the form of hushed whispers.
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 2:    Scaffolding grazes the arched ceilings of the library. The smells of paint, hardwood, and oil linger in the air as carpenters navigate the space. Lab security keeps a close eye on the newcomers. 
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 3:    Carpenters dip their brushes into fine lacquers to coat the rows of shelves as masons repair chipped floors. The room is sectioned off and lab security stands at attention. 
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 4:    A foreman paces around the renovated library carrying a clipboard, lab security following her every step. Looks like renovations are almost done. 
                +Investigate the vault -> Security
                +{seenPepTalk}Check elsewhere -> END
        - 5:     Lab employees gather around to marvel at the library that shines with newfound gusto. Even the books seem a little newer.
               +Investigate the vault -> InvestigateVault
               +{seenPepTalk}Check elsewhere -> END
        - 6:    People stand shoulder to shoulder, all looking at a group of lab board members sitting in a circle toward the front of the room. Everyone is eager to listen and some even stand on ladders to get the best vantage point. 
                +Listen in -> Election
                +{seenPepTalk}Check elsewhere -> END
        - 7:    The library sits silently and shines coldly. Lab employees huddle like silent vultures over their books.
                +Investigate the vault -> InvestigateVault
                +{seenPepTalk}Check elsewhere -> END
        - 8:    The library is steeped in gloom. Shelves of books soar to the ceiling in the darkness and some tomes have been abandoned where they lay open on reading desks.
                +Investigate the vault -> InvestigateVault
                +{seenPepTalk}Check elsewhere -> END
        - 9:    The floor vibrates and occasionally shutters under my feet. The books lining the library shift briefly, then hold still once more. 
                +Investigate the vault -> InvestigateVault
                +{seenPepTalk}Check elsewhere -> END
        - 10:   Flames have claimed the library. Any metal is now liquid and only aids the fire in its quest for destruction.
                +Investigate the vault -> HotVault
                +{seenPepTalk}Check elsewhere -> END
        }
 

//NPC Convos

//Jules Ambrose
===juleslibrary===
~SET_PARAMETER("PrologueCharacters", 1)
#NPC:Jules_Neutral
{inTutorial: -> TutorialScold}
{metJules: -> Questions|-> meetJules}

=meetJules
    ~metJules=true

    #sprite:Alistair_Suspicious
    #speaker:Alistair
    "Jules? Is that you?"
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesGreeting")
    #speaker:
    Jules’s face breaks into a shocked smile, caught off guard by the familiar voice.
    
    #speaker:Jules
    "Alistair!"
    "Alistair, you-"
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "You've been gone for so long."
    "Of all times, why are you back now?"
    
    #sprite:Alistair_Confident
    #speaker:Alistair
    "Well, it's quite a long story..."
    "But it's good to see you again!"
    
    #speaker:Jules
    "I'm sorry, it is good to see you too..."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "Where have you been? You were gone for so long, we were all worried something had happened."
    
    +[Avoid the question] 
        
        #sprite:Alistair_Assured
        #speaker:Alistair
        "Oh, I've been out and about."
        
        #speaker:Jules
        "Out and about? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #sprite:Alistair_Embarassed
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #NPC:Jules_Confident
        #speaker:Jules
        "Ha! You are too easy to read my friend." -> juleslibrary
    +[Adventuring] 
        
        #sprite:Alistair_Assured
        #speaker:Alistair
        "Oh I've been... adventuring."
        
         #speaker:Jules
        "Adventuring? Where? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #sprite:Alistair_Embarassed
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #NPC:Jules_Confident
        #speaker:Jules
        "Ha! You are too easy to read my friend." -> juleslibrary
//Choices for what player can ask
=Questions
#NPC:Jules_Neutral
#speaker:Jules
"What can I help you with?"
    + [Why are you here?] ->WhyHere
    + [What have you been up to?] ->WhatUp
    * {seenSpeech == true} {time == 5} [Practice address] ->fumbleword
    * {vaultDirector == true} [Help with vault?] ->vault
    * {seenElection == true} [Speech topics] ->topicschange
    * {seenElection == true} [Election] ->runfordirector
    * {julesRun == true} [Ego boost!] ->speechpeptalk
    + [Nothing for now]
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesFarewell")
    #speaker:Jules
    "Let's speak again soon, Alistair."
    -> END

//Question topics
=WhyHere
#sprite:Alistair_Neutral
#speaker:Alistair
"Why are you here, Jules?"

#NPC:Jules_Nervous
#speaker:Jules
"Ah."
"Well."
"I wanted to see the library again."
~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
"The planet will fold in on itself within a few years."
"And evacuation plans are underway."
"Everyone will be off the planet soon..."
"But the library reminds me of our time as interns here at the lab."
#NPC:Jules_Neutral
"Remember that time?"
"It's truly nostalgic..."
        ->juleslibrary

=WhatUp
#speaker:Alistair
"What have you been up to while I've been away?"
        
#speaker:Jules
"So much has changed since we were interns here at the lab."
"Many of the people we used to know have moved off planet."
~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
#NPC:Jules_Nervous
"And well, I have a family now. It's funny how having children can change your perspective."
#NPC:Jules_Neutral
"... But you haven't changed much Alistair."
    + [Have changed] 
        #sprite:Alistair_Confident
        #speaker:Alistair
        "I think I've changed, I've been all over the place."
        
    + [Have not changed] 
        #sprite:Alistair_Distant
        #speaker:Alistair
        "I suppose I haven't changed that much after all..."
    - 
        #NPC:Jules_Confident
        #speaker:Jules
        "Perhaps you have. But you're still the same at your core."
        "... That's a good thing, Alistair. Don’t ever lose your sense of wonder, that adventurous spirit of yours."
        ++ [Promise] 
            #sprite:Alistair_Confident
            #speaker:Alistair
            "I don't think I ever will, you can count on that."
            
            #speaker:Jules
            "Good."
                -> juleslibrary
        ++ [We'll see] 
            #sprite:Alistair_Nervous
            #speaker:Alistair
            "I'm not sure Jules, there's..."
            
            ~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
            #speaker:Jules
            "What is it Alistair?"
            
            #speaker:Alistair
            "There's just, there's a lot going on..."
            "It's complicated..."
            "I'll tell you some other time, alright?"
            
            ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
            #NPC:Jules_Nervous
            #speaker:Jules
            "Of course."
                -> juleslibrary
===vault===
#speaker:Alistair
#sprite:Alistair_Nervous
"Jules, I was hoping to ask you something about the laboratory's vault..."

~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
#speaker:Jules
"The vault?"

#speaker:Alistair
#sprite:Alistair_Neutral
"Yes, you see..."
"I need something from the vault. I forgot something inside."

#speaker:Jules
"You forgot something?"
"Well, you'll have to talk to Bennet about that."
"I can't open the vault!"

#speaker:Alistair
"The thing is, I did talk to him."
"He's completely uninterested in helping me."
#sprite:Alistair_Embarrassed
"I only need what I left behind, he spoke as if I were planning a heist!"

~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
#NPC:Jules_Nervous
#speaker:Jules
"Bennet is a stickler for rules."

#speaker:Alistair
#sprite:Alistair_Neutral
"So, I wanted to ask if you wanted to help me get into the vault."

#speaker:Jules
#NPC:Jules_Confident
"Help you...?"
"Alistair, now you sound like you really are planning a heist."

#speaker:Alistair
#NPC:Jules_Assured
"All I need is what's mine."

#speaker:Jules
#NPC:Jules_Neutral
"Alistair, only the Director can open the vault."
"Bennet has a device in his office to open the vault, a key."
~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
"But, please, do not consider stealing it."

#speaker:Alistair
#sprite:Alistair_Neutral
"I... wasn't thinking that."

#speaker:Jules
"Good."
"Only the Director can open the vault, Alistair."
"But perhaps there is some paperwork you can fill out to get your belongings back."

#speaker:Alistair
#sprite:Alistair_Sad
"And get stuck in bureaucratic hell..."

~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
#speaker:Jules
#NPC:Jules_Nervous
"Oh Alistair."
"I am sorry, I wish I could help you."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingDisappointed")
#NPC:Darling_Neutral
#speaker:D4RL1N6
"Do not give up yet Alistair."

#speaker:Alistair
"Of course."

~CREATE_TIMELINE_CLUE("Jules can't help", "personclue", "this shouldn't matter", "Only the director is able to open the vault with their code, and the code changes each time the director changes. Need to either get in the director's good graces, or get a new one.")
#NPC:Darling_Neutral
#speaker:D4RL1N6
#sprite:Alistair_Neutral
"I am sure that there are more options we have not explored. Keep searching."

{seenElection:
#speaker:Alistair
#sprite:Alistair_Confident
"I recall an election, perhaps we can find some leads there."
}
//CLUE, Jules can't help, only Director can open vault
-> DONE

===runfordirector===
~julesRun = true
{time > 5: ->CannotRun|->CanRun}

=CannotRun
#speaker:Alistair
"Jules, have you ever thought about running for Director?"

~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
#NPC:Jules_Neutral
#speaker:Jules
"Me- Running?"
#NPC:Jules_Nervous
"No!"
"Not to mention, there won't be another election for many years, Alistair."
#NPC:Jules_Neutral
"We just had one not that long ago."

#speaker:Alistair
#sprite:Alistair_Embarassed
"Ah, that's right."
"Forget I said anything."
(Interesting.)
//CLUE, it's after the election has already happened, need to go back to plant the idea beforehand
~CREATE_TIMELINE_CLUE("Jules can't run at the moment", "placeclue", "this shouldn't matter", "It's too late for Jules to run for director, I'll need to go back to a time before the election takes place to get him to run.")
-> END

=CanRun
#speaker:Alistair
#sprite:Alistair_Suspicious
"Jules, how often does the Director election process take place?"

~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
#NPC:Jules_Neutral
#speaker:Jules
"That's a strange question coming from you, Alistair!"
"Why, every five years the Director's role is discussed and put up for debate. Sometimes a new one is appointed."
"But..."
"Bennet has been Director for quite awhile."
"No one has tried to oppose him."

#speaker:Alistair
#sprite:Alistair_Confident
"Don't you think someone should?"

~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
#speaker:Jules
#NPC:Jules_Confident
"Well..."
"Yes, it would be healthy for the lab to have some change in leadership."
"Bennet is quite stuck in his ways. Just focused on keeping things as they are, a steady course neither up nor down."

#speaker:Alistair
#sprite:Alistair_Embarassed
"I think you should run against Bennet."

~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
#speaker:Jules
#NPC:Jules_Nervous
"What-"
"Alistair!"
"I cannot run up against Bennet, I am much, much younger- I lack experience..."

#speaker:Alistair
#sprite:Alistair_Assured
"But you said so yourself that the lab needs some change in leadership."
"I'm sure you're not the only one with that sentiment."

#speaker:Jules
"Perhaps so- but..."
//~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
"Ahh... It is unlikely I would win. Even if the council does want Bennet gone."

#speaker:Alistair
#sprite:Alistair_Neutral
"But what's the harm in trying? The election is still quite far away."

~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
#speaker:Jules
"... Perhaps, I will think about it."
"But I do doubt I would have much success."
#NPC:Jules_Neutral
~CREATE_TIMELINE_CLUE("Jules is running", "personclue", "this shouldn't matter", "Jules is now running for director, I'll need to see if this changes anything in the future.")
"That is quite far away, I'll think about it again once the time is nearer."
//CLUE, Jules is now running but he may need some help, I should go to the future to see the results etc
-> DONE

===topicschange===
#speaker:Alistair
#sprite:Alistair_Suspicious
"Jules, I was thinking, what sort of things do you think the people of Elore-Nabyke would like the Director to talk about?"

~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
#speaker:Jules
#NPC:Jules_Nervous
"That's... a strange question."
"You usually don't care much for lab politics..."

#speaker:Alistair
#sprite:Alistair_Neutral
"Oh, but I'm just curious. I think that perhaps the people would like to hear an apology, you know?"

#speaker:Jules
#NPC:Jules_Neutral
"An apology about what...?"

#speaker:Alistair
#sprite:Alistair_Embarassed
"Oh- I mean, just for the lab to be more transparent with the people of the planet."
"Right now, the lab and the people feel very separate, don't you think?"

~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
#speaker:Jules
"Hm."
"I suppose so. I haven't thought of that."

#speaker:Alistair
"Just some food for thought."
~ speechImproved = true
~ helpComplete = helpComplete +1
-> DONE

===fumbleword===
#speaker:Alistair
#sprite:Alistair_Assured
"Jules..."
"This is sort of a strange question, but, what do you call the numbers and words that represent your home's location?"

#speaker:Jules
#NPC:Jules_Nervous
"... What-"
"Alistair, what are you talking about?"

#speaker:Alistair
#sprite:Alistair_Confident
"Just trust me Jules."

#speaker:Jules
#NPC:Jules_Neutral
"Okay. An... Address?" 

#speaker:Alistair
#sprite:Alistair_Neutral
"Okay, good. Address. Let's practice saying it."

~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
#speaker:Jules
"Alistair, are you okay? Did something happen...?"

#speaker:Alistair
"No, I just want to make sure you can say that word really well."
"I know that sounds strange, but just trust me. It'll make sense later."

#speaker:Jules
"Okay..."
"Address."

#speaker:Alistair
"And there's also 'address' as in, let's address this."

#speaker:Jules
"Address."
~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
#NPC:Jules_Nervous
"Address?"

#speaker:Alistair
#sprite:Alistair_Assured
"Perfect."
~ helpComplete = helpComplete +1
~ addressFix = true
-> DONE

===speechpeptalk===
#speaker:Alistair
#sprite:Alistair_Confident
"You know, I think you would be a good Director."

~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
#speaker:Jules
#NPC:Jules_Nervous
"Oh?"
"Really? Well, I'll run and try my best."
#NPC:Jules_Neutral
"But Crabb has been in the business so long, it's hard to imagine anyone but him being Director."

#speaker:Alistair
"Maybe."
"But you're smart, and you worry about things other than the lab's profit margins."
#sprite:Alistair_Suspicious
"You know, I don't think I've ever even seen Bennet in the market."

#speaker:Jules
"I've heard he hasn't left the lab grounds in years."

#speaker:Alistair
#sprite:Alistair_Assured
"See, this is why you'd be great as a Director."

~PLAY_SOUND("event:/Character Barks/Jules/JulesHappy")
#speaker:Jules
#NPC:Jules_Confident
"Thanks Alistair."
"I'll try my best."
~ helpComplete = helpComplete +1
-> DONE


//Temperance Ward
===childlibrary===
~SET_PARAMETER("PrologueCharacters", 4)
~PLAY_SOUND("event:/Character Barks/Temperance/ChildGreeting")
#NPC:Temperance_Neutral
{metChild: -> Questions|-> meetChild}

=meetChild
#speaker:Alistair
#sprite:Alistair_Neutral
    "Hello there! What's your name?"
    
    #speaker:Child
    "...Temperance."
    
    #speaker:Alistair
    "Oh, well..."
    "My name is Alistair!"
    
    #speaker:Temperance
    "..."
    
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "You... doing alright?"
    
    ~PLAY_SOUND("event:/Character Barks/Temperance/ChildAngry")
    ~CREATE_JOURNAL_OBJECT("Child", "Person", "A young child who wishes to work in the lab one day. Her parents are leaving the planet with her early.", "Temperance Ward is her full name, a young person who always seems to speak her mind regardless of the situation. She wishes to work at the lab, but that's nothing but a pipe dream now.")
    ~metChild = true
    #speaker:Temperance
    "I'm fine."
-> childlibrary

=Questions
#speaker:Temperance
#NPC:Temperance_Neutral
"... What do you want?"
    + [Lost?] -> Lost
    + [Parents?] -> Parents
    + [Nothing for now]
    ~PLAY_SOUND("event:/Character Barks/Temperance/ChildFarewell")
    "Fine."
        -> END
=Lost
#speaker:Alistair
#sprite:Alistair_Nervous
"Are you... lost? I don't think children are supposed to be in the lab." 
        #speaker:Temperance
        "I'm not lost."
        "I'm exploring."
        ~PLAY_SOUND("event:/Character Barks/Temperance/ChildSad")
        "Nobody is in the lab anyway. Everyone is getting ready to evacuate."
            ++ [You evacuate too?] 
                #speaker:Alistair
                "Shouldn't you be getting ready too?"
                
                ~PLAY_SOUND("event:/Character Barks/Temperance/ChildAngry")
                #speaker:Temperance
                "I am ready. I have everything I need."
                #speaker:Alistair
                #sprite:Alistair_Distant
            "Oh." 
            "Okay."
                -> childlibrary
            
            ++ [Exploring the lab?] 
                #speaker:Alistair
                "You like exploring the lab then?"
                
                #speaker:Temperance
                "I've always wanted to see it."
                ~PLAY_SOUND("event:/Character Barks/Temperance/ChildSad")
                "This is the only way I'm able to. When everyone is gone..."
                #speaker:Alistair
                #sprite:Alistair_Distant
            "Oh." 
            "Okay."
                -> childlibrary
-> Questions

=Parents
#speaker:Alistair
#sprite:Alistair_Suspicious
"Do your parents know you're here?"
        #speaker:Temperance
        "No."
        "They're packing up everything."
        "We're leaving the planet on a big Spacer."
        "It'll be cool to be on one, but..."
        ~PLAY_SOUND("event:/Character Barks/Temperance/ChildSad")
        "I just wanna stay here..."
        -> childlibrary
-> Questions


//Quest/Plot Specific Knots
===InvestigateVault===
#background:Vault
The vault is a marvel in and of itself. It's a mass of bronze and golden circles that intersect messily like a bird's nest.
{seenPepTalk: | ->DarlingPepTalk}
    + [Pry open door] 
        I squeeze my fingers into the door frame and put my foot on the door.
        I lean back and use all my strength to try to pry open the door, but the thing doesn't budge at all.
        #sprite:Alistair_Embarassed
        Worth a shot.
        -> InvestigateVault
    + [Kick door] 
        I take a few steps back then give the vault door a good kick square in the center. 
        The vault doesn't shift.
        The only indication that I had kicked the thing at all was the slight pain that's growing in my foot.
        #sprite:Alistair_Sad
        Ouch.
        -> InvestigateVault
    * {hasCode} [Open vault]
        ->EndingWarning
    + [Do nothing] -> END 


->DarlingPepTalk
===DarlingPepTalk===
~seenPepTalk=true
#speaker:Alistair
#sprite:Alistair_Suspicious
"I've seen the vault opened before."
"It doesn't need a code."
"These circles here have to be turned in a specific order then it'll open."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingThinking")
#speaker:D4RL1N6
#NPC:Darling_Neutral
"Did you see what the order was?"

#speaker:Alistair
#sprite:Alistair_Neutral
"Well, yes, but the order is changed every time by the Lab Director."
"They take security very seriously here."
"Unfortunately."

#speaker:D4RL1N6
"Then we have to find this Director."

#speaker:Alistair
#sprite:Alistair_Vervous
"And somehow convince him to let us into the vault."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingFrustrated")
#speaker:D4RL1N6
"Do not be so melodramatic. We will find a way. We must acquire your treasure."
"We may also be able to gather information from exploring this place."
"I recall seeing a marketplace on our way in."
"There must be other people in different places or times that could help us."
~TOGGLE_MINIMAP(true)

#speaker:Alistair
#sprite:Alistair_Assured
"You're right, as usual."
"If I remember correctly, the Director is usually somewhere in the lab."
"Jules used to say that he slept in his office, it seemed like the Director never left!"
->DONE


===Security===
#speaker:Alistair
As I approach the vault, I see one of the vault's security personnel promptly slide over and put himself directly into my path.
He crosses his arms and just stands there.
    + [Say hello]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "Hello there!"
        The vault security guard just looks down at me.
        He doesn't respond.
        #sprite:Alistair_nervous
        "Uh. I said hello there!"
        The guard still does not respond, but I see his eyebrow twitch.
        ++[Say hello again] 
            #speaker:Alistair
            "I said, hello-"
        
            #speaker:Guard
            "I heard you..."
        
            #speaker:Alistair
            "Oh! Apologies..."
            (He's not very talkative is he...)
            -> END
        ++[Nevermind] 
            #speaker:Alistair
            I just smile and turn on my heel.
            (Maybe I'll look elsewhere.)
            -> END 
    + [Nevermind] 
        I just smile and turn on my heel. 
        (Maybe I'll look elsewhere.) -> END 
-> DONE



===HotVault===
#speaker:Alistair
#sprite:Alistair_Nervous
The vault shimmers from the immense heat in the library. It's clear even from this distance that touching the handle would burn my skin.
The treasure’s most likely melted by now anyways.
-> DONE



===Election===
{julesRun: ->JulesSpeechCheck|->ElectionContinue}

=ElectionContinue
~ seenElection = true
~SET_PARAMETER("PrologueMusic", 5)
There are hundreds of people stuffed into the library, all listening intently to the dozen board members speaking at the front of the room.
It would be impossible for me to get a word in. 
As crowds of people close in on the board members, I push and wriggle my way closer to the front.
Now that I'm closer, I can hear a bit more of the board members' speech.
#speaker:Board Member
"Come forth, any of you who wish to speak."
"The floor is open for community comments on the appointment of Bennet Crabb as Lab Director or otherwise miscellaneous topics kindred to the community's concerns." -> ShopownerMono
    =ShopownerMono
        ~SET_PARAMETER("PrologueCharacters", 3)
        #speaker:Uriah
        #NPC:Uriah_Neutral
        "I can speak first."
        "I think I speak on behalf of the entire community when I say that we are all very thankful for the years of dedicated work Doctor Crabb has devoted to the lab and to Elore-Nabyke."
        ~PLAY_SOUND("event:/Character Barks/Uriah/UriahAngry")
        "But."
        "I think I also speak for the community when I say that we find the lab and the director's handling of the evacuation of the planet to be entirely abhorrent."
        "Is it not the lab itself that discovered the core's damaged state? 
        ~PLAY_SOUND("event:/Character Barks/Uriah/UriahFearful")
        "Why have you not put more time into fixing it? Why must we abandon our home?"
        "Why is the lab still functioning as if the planet is not going to explode in a few years?"
        "I feel that the lab is entirely too closed off from the rest of the planet."
        ~PLAY_SOUND("event:/Character Barks/Uriah/UriahAngry")
        "I pose these questions not as a way to tear down all the work you all have done, but this is our planet too that you are asking us to leave!"
        ~PLAY_SOUND("event:/Character Barks/Uriah/UriahThinking")
        "I won't take much more of your time. But I don't believe that Bennet Crabb is suited to deal with this catastrophe. Perhaps it is time for someone younger, with more gumption, to lead us."
        The faces of the board remain steely, but I hear the crowd around me murmur turbulently in excitement and concern. -> ChildMono
    =ChildMono
        ~SET_PARAMETER("PrologueCharacters", 4)
        ~PLAY_SOUND("event:/Character Barks/Temperance/TeenFearful")
        #speaker:Temperance
        #NPC:Temperance_Teen_Neutral
        "Okay..."
        "Well."
        "Um, so."
        "I know I'm not very old."
        //#NPC:Temperance_Teen_Distant
        "But when I was little, I wanted to work on the core."
        ~PLAY_SOUND("event:/Character Barks/Temperance/TeenHappy")
        "I wanted to see all the artifacts the lab gets from all over the universe."
        "I..."
        //#NPC:Temperance_Teen_Neutral
        ~PLAY_SOUND("event:/Character Barks/Temperance/TeenSad")
        "I thought that you people were just... I thought you just wanted to do that, just be dedicated to science and discovery."
        ~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
        "But you're not."
        "You just want to keep things as they are, the old way, and stay right here..."
        "The lab can move to a different planet and continue as things were..."
        ~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
        "But our home is right here."
        "That's all I wanted to say."
        "Yeah..." ->OldLadyMono
    =OldLadyMono
        ~SET_PARAMETER("PrologueCharacters", 5)
        #NPC:Miriam_Neutral
        As the storyteller Miriam steps up to speak, I hear the crowd sigh and groan.
        A few board members shake their heads and cast their eyes downward.
        ~PLAY_SOUND("event:/Character Barks/Miriam/MiriamHappy")
        #NPC:Miriam_Confident
        #speaker:Miriam
        "Yes!"
        "Yes, you all complain and squawk because you know you are about to hear everything you wish not to accept as truth!"
        ~PLAY_SOUND("event:/Character Barks/Miriam/MiriamAngry")
        "I will open your eyes- Listen now!"
        "The planet will not be destroyed- Elor-Nabyke will not fall!"
        #NPC:Miriam_Neutral
        "They are distracting us- lying to us!"
        ~PLAY_SOUND("event:/Character Barks/Miriam/MiriamSad")
        "Our planet does not matter."
        "There are hidden planets in the multiverse, hidden in the strings that we can not see!"
        ~PLAY_SOUND("event:/Character Barks/Miriam/MiriamHappy")
        "And there are contraptions of extraordinary power, they are hiding them from us! To collect it for themselves and-"
        #NPC:Miriam_Confident
        #speaker: 
        The Old Lady's ravings are drowned out as the crowd's murmuring and muttering rise to a crescendo.
        ~SET_PARAMETER("PrologueCharacters", 2)
        I can't hear her words, but the woman writhes and grins at the board as spittle sprays in their direction.
~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetElection")
#speaker:Bennet
#NPC:Bennet_Confident
"Silence!"
"I will have order!"
#speaker: 
#sprite:Alistair_Nervous
It takes a while for the room to quiet down despite the Director's shouting.
Once Bennet can speak over the crowd, the meeting resumes as the board members begin to resume their deliberations monotonously. 
{julesRun:
    -> JulesSpeechCheck
  - else:
    #speaker:D4RL1N6
    #NPC:Darling_Neutral
    "There seems to be much unrest here."
    "Perhaps if there were a new director, these people would find peace..."
    
    #speaker:Alistair
    #sprite:Alistair_Suspicious
    "And perhaps if we could have a friend in a high place we can access the vault."
}
~SET_PARAMETER("PrologueCharacters", 0)
//CLUE, an election happens at this year, it seems people aren't happy with the current leadership
~CREATE_TIMELINE_CLUE("People aren't happy", "placeclue", "this shouldn't matter", "The election for director happens this year. People seem to be displeased with how Bennet is handling evacuation for the planet.")
-> DONE

=JulesSpeechCheck
{speechImproved: ->JulesSpeechGood|->JulesSpeechBad}

=JulesSpeechBad
#speaker:Jules
#NPC:Jules_Neutral
"Ahem-"
"Hello everyone."
"I wanted to just announce that I am going to be running against Doctor Bennet Crabb."
#NPC:Jules_Nervous
"If you'll allow me, I wanted to speak a bit on what I would want to address if I were to become Director."
~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
"I know I'm not very experienced, but as Director, I would want to focus on the evacuation of the planet in the coming years and to help establish the lab on a new planet."
#NPC:Jules_Neutral
"I'm sure you all have many questions and concerns."
"And I am more than happy to {addressFix: address|a dress- ah- excuse me, address} them with you."
~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
#NPC:Jules_Nervous
~CREATE_TIMELINE_CLUE("Jules no speech good", "personclue", "this shouldn't matter", "Jules's speech wasn't as good as it should've been, perhaps I should head back in time to help him prepare more.")
~ seenSpeech = true
Jules' speech was littered with uncertainties and filler words, but his heart was in the right place.
//CLUE, speech was rough, maybe he won't get elected, go back and help him prep?
-> DONE

=JulesSpeechGood
~SET_PARAMETER("PrologueMusic", 5)
#speaker:Jules
#NPC:Jules_Neutral
"Hello everyone."
"I'm speaking to you today to announce that I am putting forth my opposition to Bennet Crabb's reelection." 
"If you'll give me your time, I want to speak on what I would address as Director."
#NPC:Jules_Confident
"These are extremely troubling times and I would call upon the lab to formally apologize to the people of Elore-Nabyke for the mistreatment of the core and the lax reaction to such a catastrophic mistake."
~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
#NPC:Jules_Neutral
"In addition, as Director, I would work with the community to establish an evacuation of the planet as quickly and as comfortably as possible. I would also establish weekly reports to the community that the lab serves to promote full transparency in the years to come."
"I am sure you all have many questions and concerns for me to {addressFix: address."|a dress-a-excuse me, address."}
#NPC:Jules_Confident
"Please, come to me at any time with them and we can discuss."
"Thank you."
~ seenSpeech = true
~SET_PARAMETER("PrologueMusic", 0)
{helpComplete == 3: -> DirectorCheck| -> END}

= DirectorCheck
~ julesDirector = true
//CLUE, Jules' speech was pretty good, no way he's not the Director now, go in the future and check?
~CREATE_TIMELINE_CLUE("Jules talk good here", "personclue", "this shouldn't matter", "The prep paid off for Jules's speech, I should be able to check the future now and see if he's been elected to director.")
-> END


//Lab Section Starts
===LAB===
#background:Lab_Interior
#sprite:Alistair_Neutral
//Room Description for Journal
{ time:
- 1:    
    ~ roomDescription = "A group is listening to a news projection."
    ~SET_PARAMETER("PrologueTime", 1)
    {SET_PARAMETER("PrologueAmbience", 6)}
    {SET_PARAMETER("PrologueCharacters", 0)}
- 2:    
    ~ roomDescription = "The lab is busy, seems like there's plenty of work coming in."
    ~SET_PARAMETER("PrologueTime", 1)
    {SET_PARAMETER("PrologueAmbience", 6)}
    {SET_PARAMETER("PrologueCharacters", 2)}
- 3:    
    ~ roomDescription = "The room is filled with booths of scientists showing off their work, must be a fair."
    ~SET_PARAMETER("PrologueTime", 1)
    {SET_PARAMETER("PrologueAmbience", 6)}
    {SET_PARAMETER("PrologueCharacters", 1)}
- 4:    
    ~ roomDescription = "Not much seems to be happening in the lab."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 0)}
    {SET_PARAMETER("PrologueCharacters", 2)}
- 5:    
    ~ roomDescription = "The Director is giving an announcement."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 6)}
    {SET_PARAMETER("PrologueCharacters", 1)}
- 6:    
    ~ roomDescription = "Room is empty but lots of noise is coming from the library. "
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 7)}
    {SET_PARAMETER("PrologueCharacters", 0)}
- 7:    
    ~ roomDescription = "The Director election has concluded."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 6)}
    {SET_PARAMETER("PrologueCharacters", 0)}
- 8:    
    ~ roomDescription = "Much of the equipment and furniture is gone."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 8)}
    {SET_PARAMETER("PrologueCharacters", 0)}
- 9:    
    ~ roomDescription = "Rumbling from below."
    ~SET_PARAMETER("PrologueTime", 10)
    {SET_PARAMETER("PrologueAmbience", 8)}
    {SET_PARAMETER("PrologueCharacters", 0)}
- 10:   
    ~ roomDescription = "Lab is gone, the planet will be destroyed soon."
    ~SET_PARAMETER("PrologueTime", 10)
    {SET_PARAMETER("PrologueAmbience", 9)}
    {SET_PARAMETER("PrologueCharacters", 0)}
}

Let's see...
-> evaluatelab
 //+ [Look around]
        //Room Description for player and choices
        { time:
        - 1:    A handful of scientists huddle around a projected figure I don't recognize at a distance, but they seem to be listening somberly.
                +Listen in -> OtherPlanetAnnounce
                +Check elsewhere -> END
        - 2:    The lab is filled with a buzzing excitement and energy as scientists, assistants, and cityfolk move about from task to task. 
             -> END
        - 3:    The room is lined with booths, boards, and flashy experiments. Judges walk around with their hands behind their backs as eager young scientists stand at attention.
                +Investigate -> ScienceFair
                +Check elsewhere -> END
        - 4:    The lab is quiet. A desk clerk taps their pen against a clipboard at random.
            -> END
        - 5:    
                A large crowd of various employees of the lab crowd around a projection of the Director. Even the wasteman strains himself to listen.
                Everyone is silent.
                + Investigate -> AnnounceDestruction
                + Check Elsewhere -> END
        - 6:    The lab is empty, but I hear the roar of a crowd coming from the library. 
            -> END
        - 7:    {julesDirector: The lab is filled with balloon arches and confetti litters the ground. "Jules as new Lab Director!" is sprawled everywhere on posters and decorations. |The lab is filled with balloon arches and confetti litters the ground. "Crabb continues reign" is sprawled everywhere on posters and decorations.}
                +{julesDirector} Investigate party -> Congratsparty
                +Check elsewhere -> END
        - 8:    The lab is incredibly bare. Very few lab stations remain and anything that wasn’t bolted to the floor or walls is gone, leaving behind only clean spots in the dust where equipment once was. 
            -> END
        - 9:    A layer of dust covers everything in the lab, but there was hardly anything for it to cover besides the floor and walls. I feel a quiet and deep rumbling far below me.
            -> END
        - 10:   What was once a lab has now been completely swallowed up by a monstrous hole. Fire has consumed most of the other sections of the building, but the hole seems to shoot straight down to the center of the planet.
            -> END
        }
        //-> lab
-> END

=== evaluatelab ===
{time: 
- 1:    A handful of scientists huddle around a projected figure I don't recognize at a distance, but they seem to be listening somberly.
                +Listen in -> OtherPlanetAnnounce
                +Check elsewhere -> END
        - 2:    The lab is filled with a buzzing excitement and energy as scientists, assistants, and cityfolk move about from task to task. 
             -> END
        - 3:    The room is lined with booths, boards, and flashy experiments. Judges walk around with their hands behind their backs as eager young scientists stand at attention.
                +Investigate -> ScienceFair
                +Check elsewhere -> END
        - 4:    The lab is quiet. A desk clerk taps their pen against a clipboard at random.
            -> END
        - 5:    A large crowd of various employees of the lab crowd around a projection of the Director. Even the wasteman strains himself to listen.
                Everyone is silent.
                + [Investigate] -> AnnounceDestruction
                + [Check Elsewhere] -> END
        - 6:    The lab is empty, but I hear the roar of a crowd coming from the library. 
            -> END
        - 7:    {julesDirector: The lab is filled with balloon arches and confetti litters the ground. "Jules as new Lab Director!" is sprawled everywhere on posters and decorations. |The lab is filled with balloon arches and confetti litters the ground. "Crabb continues reign" is sprawled everywhere on posters and decorations.}
                +{julesDirector} [Investigate party] -> Congratsparty
                +Check elsewhere -> END
        - 8:    The lab is incredibly bare. Very few lab stations remain and anything that wasn’t bolted to the floor or walls is gone, leaving behind only clean spots in the dust where equipment once was. 
            -> END
        - 9:    A layer of dust covers everything in the lab, but there was hardly anything for it to cover besides the floor and walls. I feel a quiet and deep rumbling far below me.
            -> END
        - 10:   What was once a lab has now been completely swallowed up by a monstrous hole. Fire has consumed most of the other sections of the building, but the hole seems to shoot straight down to the center of the planet.
            -> END
}
   


//NPCs Convos
===TutorialScold===
#speaker:Alistair
#sprite:Alsitair_Distant
"That's Jules, my friend from when I interned at the lab."
"But I don't need to talk to him right now, I should focus on getting into the vault."
->END

//Jules Ambrose
===juleslab===
{SET_PARAMETER("PrologueCharacters", 1)}
#NPC:Jules_Neutral
{inTutorial: -> TutorialScold}
{metJules: -> Questions|-> meetJules}

=meetJules
~metJules=true

    #sprite:Alistair_Suspicious
    #speaker:Alistair
    "Jules? Is that you?"
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesGreeting")
    #speaker:
    Jules’s face breaks into a shocked smile, caught off guard by the familiar voice.
    
    #speaker:Jules
    "Alistair!"
    "Alistair, you-"
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "You've been gone for so long."
    "Of all times, why are you back now?"
    
    #sprite:Alistair_Confident
    #speaker:Alistair
    "Well, it's quite a long story..."
    "But it's good to see you again!"
    
    #speaker:Jules
    "I'm sorry, it is good to see you too..."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "Where have you been? You were gone for so long, we were all worried something had happened."
    
    +[Been out and about] 
        
        #sprite:Alistair_Assured
        #speaker:Alistair
        "Oh, I've been out and about."
        
        #speaker:Jules
        "Out and about? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #sprite:Alistair_Embarassed
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #NPC:Jules_Confident
        #speaker:Jules
        "Ha! You are too easy to read my friend." -> juleslab
    +[Adventuring] 
        
        #sprite:Alistair_Assured
        #speaker:Alistair
        "Oh I've been... adventuring."
        
         #speaker:Jules
        "Adventuring? Where? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #sprite:Alistair_Embarassed
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #NPC:Jules_Confident
        #speaker:Jules
        "Ha! You are too easy to read my friend." -> juleslab

=Questions
#speaker:Jules
"What can I help you with?"
    + {time == 3} [Booths?] ->fair
    + {time == 4} [What's new?] ->wedding
    + {time == 5} [Announcement?] ->disaster
    * {seenSpeech == true} {time == 5} [Practice address] ->fumbleword
    * {vaultDirector == true} [Help with vault?] ->vault
    * {seenElection == true} [Speech topics] ->topicschange
    //^Could change speech topics to be linked to the marketplace, maybe talk to specific people or nearly everyone to get this option? Might need to revise marketplace dialogue/add new convos, will need to edit what the change in speech is
    * {seenElection == true} [Election] ->runfordirector
    * {julesRun == true} [Ego boost!] ->speechpeptalk
    + [Nothing for now]
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesFarewell")
    "Let's speak again soon, Alistair."
    -> DONE

=fair
#speaker:Alistair
#sprite:Alistair_Neutral
"Jules, do you know anything about why all these people and booths are here...?"

#speaker:Jules
#NPC:Jules_Confident
"Ah!"
~PLAY_SOUND("event:/Character Barks/Jules/JulesHappy")
"Yes, the lab is hosting the planet's annual HESF!"
"That is- the Higher Education Science Fair."
"It's exciting, isn't it?"
"There's so many fresh faces and new experiments all in one place."

#speaker:Alistair
#sprite:Alistair_Confident
"Do you have an experiment set up here?"

#speaker:Jules
"Of course!"
"Though I'm afraid it's a bit of a secret!"
"Perhaps I'll tell you about it another time."
-> DONE

=wedding
#speaker:Alistair
"I just wanted to see if there was anything new."

#speaker:Jules
#NPC:Jules_Confident
"Oh-"
~PLAY_SOUND("event:/Character Barks/Jules/JulesHappy")
"Actually, there is! Something quite new."
"Well..."
"Christa and I got engaged a few months ago."
"We're not quite sure on a date yet, but do you think you'll be on planet in a few months?"
    
#speaker:Alistair
#sprite:Alistair_Nervous
(Oh no.)
(Curses! I can only travel one year at a time...)
    + [Maybe?]
    #speaker:Alistair
    #sprite:Alistair_Sad
    "Uh- Maybe. I'm really not sure, Jules, I'm all over the place, but maybe?"
    "I'm really sorry-"
    + [No]
    #speaker:Alistair
    #sprite:Alistair_Sad
    "Ah Jules..."
    "No, I don't think so, I'm all over the place."
    "I'm sorry."
    - 
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    #speaker:Jules
    #NPC:Jules_Neutral
    "It's alright, Alistair."
    "I know you're busy doing..."
    "Whatever it is you do out in the universe."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "Just come back and visit us more often, alright?"
    
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "I-I will."
    "Thank you Jules..."
-> DONE

=disaster
#speaker:Alistair
#sprite:Alistair_Sad
"Did you hear the announcement that the Director is giving?"

#speaker:Jules
"Yes..."
~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
#NPC:Jules_Nervous
"It's very disturbing news."
#NPC:Jules_Neutral
"The core can no longer sustain itself, it's only a matter of time 'till it is destroyed and the planet with it."

#speaker:Alistair
#sprite:Alistair_Sad
"How much time does the planet have?"

#speaker:Jules
"Five years, give or take."
"It should be enough time to evacuate, but..."
~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
#NPC:Jules_Nervous
"All of this will be gone."
"I just hope Crabb knows what he's doing."
-> DONE

//Bennet Crabb
===directorlab===
{SET_PARAMETER("PrologueCharacters", 2)}
#NPC:Bennet_Neutral
{metDirector: -> Questions|-> meetDirector}

=meetDirector
~metDirector=true
~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetGreeting")
#speaker:Director
"Hm?"
"Greetings, I am Bennet Crabb, the Director of the laboratory."
#speaker:Bennet
"How can I help you?"

#speaker:Alistair
#sprite:Alistair_Embarassed
"Ah-"
"Sir, do you not remember me?"
"I'm Alistair! I interned here with Jules Ambrose?"

#speaker:Bennet
"Alistair?"
"Hm..."
~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetAngry")
#NPC:Bennet_Confident
"Of course. Alistair."
#NPC:Bennet_Neutral
"I would have preferred to have forgotten that name, but it seems you have returned."
"Your poor disciplinary marks have most certainly not been forgotten."
    + [What marks?]
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "I'm-"
    "I'm not sure what you could be referencing, sir!"
    
    ~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetSurprised")
    #speaker:Bennet
    "Do not play coy with me, boy."
    
    + [Sorry]
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "I am quite sorry, sir. My sincerest apologies."
    
    - 
    #speaker:Bennet
    "You abandoned your duties, your job, here at the lab with nary a hint of warning."
    "That sort of behavior is most unprofessional."
    ~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetAngry")
    "Do not think that your return to the planet will secure you a position once again."
    
    #speaker:Alistair
    "Of course not sir."
    "I am... Just visiting."
    
    #speaker:Bennet
    "And visit you may."
    ~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetFarewell")
    #NPC:Bennet_Confident
    "Now, begone."
    ~CREATE_JOURNAL_OBJECT("Director", "Person", "The director of the lab. A stubborn old man that keeps private matters 100% private.", "Bennet Crabb is the current lab director, a man who keeps the lab on schedule and on task without outside intervention. He's cold and not very sweet to most, and has been director for an incredibly long time. If I can get his help or replace him, I may have a shot.")
    "I have much work to attend to."
-> directorlab

=Questions
#speaker:Bennet
"What do you want?"
    + {time== 2} [Lab is busy?] -> Busylab
    + {time== 3} [Booths?] -> Booths
    + {time== 4} [Lots of work?] -> Notbusy
    * {seenPepTalk==true} [Enter vault?] -> VaultTalk
    + [Nothing for now]
        ~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetFarewell")
        "Yes, yes, begone. I am quite busy."
        -> END

=Busylab
#speaker:Alistair
#sprite:Alistair_Assured
"The lab seems busy today!"

#speaker:Bennet
#NPC:Bennet_Confident
"Yes, it's been quite busy for a few weeks now."
"Which is why I have very little time for idle chatter..."

#speaker:Alistair
#sprite:Alistair_Neutral
"Did something happen? Why is the lab so busy?"

#speaker:Bennet
"..."
~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetThinking")
#NPC:Bennet_Neutral
"A Trade Seam to the Gold Belt opened up."
"Trade and artifacts are moving through the lab like water."
"Each artifact must be dated, categorized, analyzed."
"And there are hundreds of cases on my desk now, so-"
"Begone."
-> DONE


=Booths
#speaker:Alistair
#sprite:Alistair_Suspicious
"Any thoughts on the booths in the lab?"

#speaker:Bennet
"It is a necessary distraction for now."
"It is a way for those interested in working for the lab in the future to show off their knowledge and ability."
~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetHappy")
"I have seen some promising experiments on display."
"But few will be able to reach the level of excellence we demand."
#NPC:Bennet_Confident

#speaker:Alistair
#sprite:Alistair_Sad
"I see."
-> DONE


=Notbusy
#speaker:Alistair
#sprite:Alistaire_Suspicious
"Work in the lab seems pretty slow today."

~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetHappy")
#speaker:Bennet
"Indeed..."

#speaker:Alistair
"... What are you working on?"

#speaker:Bennet
"Nothing that concerns you."
"Details on the artifacts we work with are not discussed with civilians."

#speaker:Alistair
#sprite:Alistair_Embarassed
"But I'm not quite just a civilian, aren't I?"
"I worked here!"

~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetAngry")
#speaker:Bennet
#NPC:Bennet_Confient
"Not that it would matter, but you were a mere intern."
"Regardless, I refuse to break protocol for your curiosity..."
-> DONE

=VaultTalk
#speaker:Alistair
"Hello doctor!"
"I wanted to inquire about, well..."
#sprite:Alistair_Embarassed
"I believe I misplaced some of my belongings before I left."

~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetAngry")
#speaker:Bennet
"Out with it, what do you want?"

#speaker:Alistair
"You see..."
"I left behind some of my belongings in the vault, but-"
#sprite:Alistair_Assured
"I really need them! You wouldn't mind just letting me into the vault for a moment would you?"

~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetSurprised")
#speaker:Bennet
"That's preposterous."
#NPC:Bennet_Confident
"You are no longer employed here and you should know that civilians are strictly prohibited from accessing any of the vault’s highly classified materials."
    #speaker:Alistair
    "But..."
    + [I need it]
        #speaker:Alistair
        #sprite:Alistair_Confident
        "Sir, I really need my belongings that I left in the vault."
        "It's imperative that I get them."
    + [Please]
        #speaker:Alistair
        #sprite:Alistair_Sad
        "Sir, please."
        "I know that this is a breach of protocol, but perhaps you could make an exception for an ex-intern?"
    - 
        #speaker:Bennet
        #NPC:Bennet_Neutral
        "Hmph."
        "What even is it that you want from the vault?"
    + [Notes]
        #speaker:Alistair
        #sprite:Alistair_Neutral
        "My research notes. They're still inside the vault."
        
        #speaker:Bennet
        "Those notes belong to the lab now."
        "When you left your position, those materials became part of the collective research of the lab."
        
    + [Something?]
        #speaker:Alistair
        #sprite:Alistair_Nervous
        "Uh well..."
        (Think! What should I say?)
        "It's... Something?"
        "I just, I really need it."
    - 
        #speaker:Bennet
        "Absolutely not."
        "No, access to the vault is prohibited."
        "It matters not what it is you want from it."
    + [I must]
        #speaker:Alistair
        #sprite:Alistair_Confident
            "I must get into the vault, sir!"
    + [Please!]
        #speaker:Alistair
        #sprite:Alistair_Nervous
            "Please, sir, I need to get into the vault..."
    - 
        #speaker:Bennet
        #NPC:Bennet_Confident
        "Silence, I have already made my decision."
        ~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetFarewell")
        "Begone now, I am incredibly occupied at the moment."
        
#speaker:Alistair
#sprite:Alistair_Sad
#NPC:None
(How infuriating!)
(Speaking to Bennet is like talking to a wall...)

~PLAY_SOUND("event:/Character Barks/Darling/DarlingFrustrated")
#speaker:D4RL1N6
#NPC:Darling_Neutral
"That was fruitless."

#speaker:Alistair
#sprite:Alistair_Neutral
"Indeed."
"What do we do now?"

#speaker:D4RL1N6
#NPC:Darling_Neutral
"It is improbable that Mr. Bennet Crabb is the only one who can get into the vault."
"Perhaps we can seek out another employee."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
#NPC:Darling_Neutral
"They may be able to help us or shed light on new information."

#speaker:Alistair
"Jules still works for the lab. We interned together."
"I left, but he stayed and got a full time job."
"He did always like the library in this place..."
~ vaultDirector = true
~CREATE_TIMELINE_CLUE("Bennet says no", "personclue", "this shouldn't matter", "Bennet Crab, the current director, absolutely refuses to open the vault for me. I should find someone else who works at the lab, perhaps they know the code or a workaround.")
"Perhaps he can help since we can't get through to Bennet."
//CLUE, Bennet Crab absolutely refuses to open the vault, may have to be creative
-> DONE


//Quest/Plot Knots
===OtherPlanetAnnounce===
I move closer to the crowd to listen in.
A small projected version of the lab's Director, Bennet Crabb, stands on a pedestal in the center of the crowd.

~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetAnnouncement")
#speaker:Bennet
#sprite:Director_Confident
"In further announcements..."
"As some of you may have already heard..."
"Rumors have been circulating that the planet Xitis has been destroyed under mysterious circumstances."
#sprite:Director_Neutral
"However, it is best not to feed into gossip until we can determine what it was that caused this disaster."
"It is more than likely that the planet's core malfunctioned, which is a very rare occurrence."
"There is no need to worry."
"Indeed. Next month, the lab will host a festival..."
-> LAB

===ScienceFair===
Booth upon booth line the lab's walls. 
Young and old scientists stand in front of their experiments to demonstrate their discoveries and to discuss with judges their findings.
I remember doing the same when I was a fresh intern.
-> LAB

===AnnounceDestruction===
The Director's projected form stands tall over the group of people around him.
Everyone is silent, just looking up.

#speaker:Bennet
#NPC:Bennet_Neutral
"Ahem..."
"..."
~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetAnnouncement")
"I am speaking to you all, the entire planet of Elore-Nabyke, to make an announcement."
"An announcement of a recent discovery."
#NPC:Bennet_Confident
"..."
"It is no secret that our planet's core is a mechanical thing prone to wear and tear. 
"We at the lab take great care in maintaining the core with the goal of extending the life of our planet by some 50 to 100 years."
"But."
"It was discovered this morning that the core has taken on more damage than we had anticipated."
"The damage to the core is... Mysterious in nature."
"We do not know where it originated, though we are investigating."
"It is with my..."
~PLAY_SOUND("event:/Character Barks/Bennet Crabb/BennetSad")
#NPC:Bennet_Neutral
"Deepest regret that I must announce that the planet will be inhabitable in 5 years time and subsequently destroyed."

The lab employees are silent but a few dip their heads.

#speaker:Alistair
#sprite:Alistair_Suspicious
(I wonder how many already knew of this?)
-> LAB

===Congratsparty===
#speaker:Alistair
Beyond the lab's foyer, groups of people crowd into the Director's office.
Jules' office.
The room is packed with people from the city and lab employees, but within the center of the crowd, I find Jules.
    * [Speak to Jules] -> Julestalk
    + [Leave for now] -> LAB

=Julestalk
~PLAY_SOUND("event:/Character Barks/Jules/JulesGreeting")
#speaker:Jules
#NPC:Jules_Neutral
"Alistair! You're here!"

#speaker:Alistair
#sprite:Alistair_Assured
"Of course, I wouldn't miss your congrats party."

~PLAY_SOUND("event:/Character Barks/Jules/JulesHappy")
#speaker:Jules
#NPC:Jules_Confident
"Thank you, Alistair."
"I couldn't have done it without you."
~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
"..."
#NPC:Jules_Neutral
"... Regardless, enjoy yourself. There's a snack tray somewhere around here and something to drink."

#speaker:Alistair
#sprite:Alistair_Neutral
"Well..."
    + [Time to talk?]
    #speaker:Alistair
    "I was actually wondering if you had some time to talk."
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
    #speaker:Jules
    "Oh? What about?"
    
    #speaker:Alistair
    #sprite:Alistair_Distant
    "Uh."
    "It might be best if we speak in private..."
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
    #speaker:Jules
    #NPC:Jules_Nervous
    "I see."
    -> Ending
    
    + [Have to talk privately]
    #speaker:Alistair
    "I have to talk to you, Jules, in private."
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
    #speaker: Jules
    "Oh? Why so mysterious?"
    
    #speaker:Alistair
    "I'll explain, but not where there are prying eyes."
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
    #speaker:Jules
    "I see."
    -> Ending

===Ending===
#background:Vault
#speaker:Jules
#NPC:Jules_Neutral
"The vault?"
"I suppose this place is private enough."
"What did you want to talk about Alistair?"

#speaker:Alistair
#sprite:Alistair_Embarassed
"Actually, it has to do with the vault..."

~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
#speaker:Jules
"Oh?"

#speaker:Alistair
#sprite:Alistair_Distant
"I'm..."
"Well, I forgot something in the vault."
"I left it by accident and I just really need it back."
"So..."

~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
#speaker:Jules
"You want me to open the vault?"

#speaker:Alistair
#sprite:Alistair_Sad
"Yes."
"And I know it's against protocol-"
"But I really need what I left in there."

#speaker:Jules
"What did you leave behind?"

#speaker:Alistair
"I..."
    + [Something?]
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "Uh."
    "Something?"
    + [Research notes]
    #speaker:Alistair
    #sprite:Alistair_Neutral
    "Some of my old research notes."
    
    #speaker:Jules
    "Notes on what?"
    - 
    #speaker:Alistair
    #sprite:Alistair_Sad
    "..."
    "I'm sorry, Jules, I can't tell you."
    "But you just have to trust me."

#speaker:Jules
#NPC:Jules_Nervous
"..."
~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
"I must admit."
"You've been acting very suspicious lately, Alistair."
"Beyond this..."
"Breach of protocol,"
~PLAY_SOUND("event:/Character Barks/Jules/JulesAngry")
"You've helped me in such specific ways."

#speaker:Alistair
#sprite:Alistair_Distant
(Does he suspect me?)
    + [Don't know what you mean]
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "I don't know what you could be talking about..."
    + [Just trust me]
    #speaker:Alistair
    #sprite:Alistair_Sad
    "Please Jules."
    "Just trust me."
    -
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesAngry")
    #speaker:Jules
    #NPC:Jules_Neutral
    "Alistair."
    "Did you help me get elected just to open the vault for you?"
    
    #speaker:Alistair
    #sprite:Alistair_Distant
    "Wha-"
    "No, Jules, that's not it at all!"
    "I just wanted to help out my friend."
    "Really, you deserve this."
    
    #speaker:Jules
    #NPC:Jules_Confident
    "That is a relief to hear..."
    "I am sorry for even suggesting such a thing."
    #NPC:Jules_Neutral
    "You've just acted..."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
    "A bit off since you've returned."
    "It's very troubling."
    
    + [Nothing to worry about]
    #speaker:Alistair
    #sprite:Alistair_Embarassed
    "I am sorry Jules."
    "But I assure you, you don't have to worry about little old me."
    + [Can explain in time]
    #speaker:Alistair
    #sprite:Alistair_Neutral
    "I am sorry Jules."
    "Perhaps in time I can explain but..."
    "Not yet."
    -
    #speaker:Jules
    #NPC:Jules_Neutral
    "I understand..."
    "But, you know you can tell me anything Alistair?"
    "You've done me a great service, I want to be able to help you."
    "Now and in the future."
    
    #speaker:Alistair
    #sprite:Alistair_Confident
    "Thank you Jules..."
    
    #speaker:Jules
    #NPC:Jules_Confident
    "Now, let me get that vault open for you."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesHappy")
    "Don't act so surprised!"
    "You know I've never been a stickler for rules!"
    
    #speaker:Alistair
    Jules opens the vault with a simple turning of dials and circles.
    The vault is open.
    ~hasCode = true
    ->EndingWarning
    
===EndingWarning===
    ~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
    #speaker:D4RL1N6
    #NPC:Darling_Neutral
    "Alistair."
    "Once we get your treasure from the vault, it is best if we leave the planet."
    "There is still much work to do."
    
    + [Go into vault]
    -> EndingVault
    + [Look around more]
    ~CREATE_TIMELINE_CLUE("Ending warning", "placeclue", "this shouldn't matter", "Before I leave the planet for good I should go talk to Jules at his congratulations party in the lab.")
    #speaker:Alistair
    "I want to look around more before we leave."
    //CLUE, if I want to leave, I should find Jules at his congrats party again etc
    -> LIBRARY
    
===EndingVault===
#background:Vault
    As the vault door opens, I rush inside.
    My cubby is just as I left it.
    Inside, I find the plaque and my notebook.
    
    #speaker:D4RL1N6
    #NPC:Darling_Neutral
    "We should return to the ship, Alistair."
    "You can return for goodbyes in another time."
    
    #speaker:Alistair
    #sprite:Alistair_Distant
    "I know..."
    "Let's return then."
    
    ~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
    #speaker:D4RL1N6
    #NPC:Darling_Neutral
    "Ready?"
    
    #speaker:Alistair
    #sprite:Alistair_Confident
    "Let's go."

//visual effect? Warpy wwoowowowowww
#background:Black
#speaker:Alistair
#sprite:Alistair_Distant
A flash falls over my eyes and I see the familiar hull of my ship all around me.
It feels like it's been years.
As I slump back in my ship, I hold the plaque in my lap.
The words engraved into the metal are barely legible.
(Could he even read this now?)
(Perhaps it was never meant to be...)
(...)
(Maybe it doesn't matter.)
(Perhaps remembering him will be enough.)
-> Teaser

===Teaser===
//black background
#speaker:???
"Ugh..."
"My flippin' head hurts..."
#background:Clinic

#speaker:Jack
#sprite:Jack_Neutral
"Where am I...?"
My head is ringing.
(I'm in a cot?)
(I'm in the Doc's clinic!)
(I guess I must've gotten smacked pretty darn hard...)
(But...)
(Wait-)
(Where is...?)
As I sit up, I see some unusual items beside me.
A figure of a tiny looking ship.
The funky looking gadget.
He called it an Astrolabe?
A plaque.
And a journal.

(But those are his things.)
(If those are here,)
(Then where the hell is Alistair?!)
~CHANGE_SCENE("credits")
-> END

===MARKETPLACE===
#background:Marketplace
#sprite:Alistair_Neutral
//Room Description for Journal
{ time:
- 1:    
    ~ roomDescription = "Market goers busy with gossip."
    ~SET_PARAMETER("PrologueTime", 1)
    ~SET_PARAMETER("PrologueAmbience", 10)
    {SET_PARAMETER("PrologueCharacters", 4)}
- 2:    
    ~ roomDescription = "Lots of new things and people in the market."
    ~SET_PARAMETER("PrologueTime", 1)
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 4)}
- 3:
    ~ roomDescription = "Tourists and visitors from off planet stuff the marketplace."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 5)}
- 4:   
    ~ roomDescription = "Place is slow today, not many shoppers."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 11)}
    {SET_PARAMETER("PrologueCharacters", 5)}
- 5:    
    ~ roomDescription = "Projection of the Director is making an announcement."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 11)}
    {SET_PARAMETER("PrologueCharacters", 3)}
- 6:    
    ~ roomDescription = "Marketplace is a ghost town."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 13)}
    {SET_PARAMETER("PrologueCharacters", 0)}
- 7:    
    ~ roomDescription = "Seems like something happened, everyone is talking about it."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 3)}
- 8:    
    ~ roomDescription = "Everyone is selling mundane things."
    ~SET_PARAMETER("PrologueTime", 5)
    {SET_PARAMETER("PrologueAmbience", 10)}
    {SET_PARAMETER("PrologueCharacters", 3)}
- 9:    
    ~ roomDescription = "Lots of people are packing up and getting onto Atmos vessels."
    ~SET_PARAMETER("PrologueTime", 10)
    {SET_PARAMETER("PrologueAmbience", 12)}
    {SET_PARAMETER("PrologueCharacters", 1)}
- 10:   
    ~ roomDescription = "The marketplace is completely devoid of life."
    ~SET_PARAMETER("PrologueTime", 10)
    {SET_PARAMETER("PrologueAmbience", 13)}
    {SET_PARAMETER("PrologueCharacters", 0)}
}

Let's see...
-> evaluatemarketplace
    //+ [Look around]
        //Room Description for player and choices
        { time:
        - 1:    The marketplace is full of small shops, booths, and stands.
                The people in the market are bubbling with hushed chatter and gossip.
                -> END
        - 2:    The marketplace is stuffed with new and exotic goods.
                An unusual amount of people crowd around each booth.
                -> END
        - 3:    I see many travelers from off planet milling about the marketplace. They all seem the intellectual sort.
            -> END
        - 4:    A few lone shoppers move from stand to stand.
                One shop owner leans heavily against his display and begins to nod off.
                -> END
        - 5:    Everyone in the marketplace is gathered around a large projection of the Director, {directorName}. 
            -> END
        - 6:    The marketplace is completely empty. Booths and stalls still line the square, but no trinkets or produce are displayed and there's not a soul in sight. 
            -> END
        - 7:    The people in the market are bubbling with hushed chatter and gossip. 
            -> END
        - 8:    The marketplace is full of random and seemingly useless items. Clothes, trinkets, junk, books, pens, and all sorts of furniture.
            -> END
        - 9:    Atmos vessels rest in and near the marketplace as lines of people make their way onto them. Most everyone has a suitcase and a somber expression as they wait to board.
            -> END
        - 10:   A once large marketplace has now been replaced with empty, collapsing stalls and overgrown walkways. The stench of smoke fills the market. Some shops crumble as the planet shutters violently.
            -> END
        }
        -> END
        

===evaluatemarketplace===
{ time:
- 1:    The marketplace is full of small shops, booths, and stands.
                The people in the market are bubbling with hushed chatter and gossip.
                -> END
- 2:    The marketplace is stuffed with new and exotic goods.
                An unusual amount of people crowd around each booth.
                -> END
- 3:    I see many travelers from off planet milling about the marketplace. They all seem the intellectual sort.
            -> END
- 4:    A few lone shoppers move from stand to stand.
                One shop owner leans heavily against his display and begins to nod off.
                -> END
- 5:    Everyone in the marketplace is gathered around a large projection of the Director, {directorName}. 
            -> END
- 6:    The marketplace is completely empty. Booths and stalls still line the square, but no trinkets or produce are displayed and there's not a soul in sight. 
            -> END
- 7:    The people in the market are bubbling with hushed chatter and gossip. 
            -> END
- 8:    The marketplace is full of random and seemingly useless items. Clothes, trinkets, junk, books, pens, and all sorts of furniture.
            -> END
- 9:    Atmos vessels rest in and near the marketplace as lines of people make their way onto them. Most everyone has a suitcase and a somber expression as they wait to board.
            -> END
- 10:   A once large marketplace has now been replaced with empty, collapsing stalls and overgrown walkways. The stench of smoke fills the market. Some shops crumble as the planet shutters violently.
            -> END

}
-> END


//NPC Convos

//Jules Ambrose
===julesmarketplace===
{SET_PARAMETER("PrologueCharacters", 1)}
#NPC:Jules_Neutral
{metJules: -> Questions| -> meetJules}

=meetJules
~metJules=true

    #sprite:Alistair_Suspicious
    #speaker:Alistair
    "Jules? Is that you?"
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesGreeting")
    #speaker:
    Jules’s face breaks into a shocked smile, caught off guard by the familiar voice.
    
    #speaker:Jules
    "Alistair!"
    "Alistair, you-"
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "You've been gone for so long."
    "Of all times, why are you back now?"
    
    #sprite:Alistair_Confident
    #speaker:Alistair
    "Well, it's quite a long story..."
    "But it's good to see you again!"
    
    #speaker:Jules
    "I'm sorry, it is good to see you too..."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "Where have you been? You were gone for so long, we were all worried something had happened."
    
    +[Been out and about] 
        
        #sprite:Alistair_Assured
        #speaker:Alistair
        "Oh, I've been out and about."
        
        #speaker:Jules
        "Out and about? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #sprite:Alistair_Embarassed
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #NPC:Jules_Confident
        #speaker:Jules
        "Ha! You are too easy to read my friend." -> julesmarketplace
    +[Adventuring] 
        
        #sprite:Alistair_Assured
        #speaker:Alistair
        "Oh I've been... adventuring."
        
         #speaker:Jules
        "Adventuring? Where? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        ~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #sprite:Alistair_Embarassed
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #NPC:Jules_Confident
        #speaker:Jules
        "Ha! You are too easy to read my friend." -> julesmarketplace

=Questions
#speaker:Jules
#NPC:Jules_Neutral
"What can I help you with?"
+ {time == 2} [Busy?] ->Busy
+ {time == 8} [You okay?] ->Okay
+ {time == 9} [Heading out?] ->Heading
* {seenSpeech == true} {time == 5} [Practice address] ->fumbleword
* {vaultDirector == true} [Help with vault?] ->vault
* {seenElection == true} [Speech topics] ->topicschange
* {seenElection == true} [Election] ->runfordirector
* {julesRun == true} [Ego boost!] ->speechpeptalk
+ [Nothing for now] 
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesFarewell")
    "Let's speak again soon, Alistair."
    -> DONE

=Busy
#speaker:Alistair
#sprite:Alistair_Suspicious
"Sure is busy, huh? I would have expected you to be in the lab with all this going on."

~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
#speaker:Jules
#NPC:Jules_Nervous
"Ah, well, I'm still doing lab work."
"I've been tasked with making sure artifacts that need to be examined, well, end up getting examined."
"A lot of what's here is very intriguing."

#speaker:Alistair
+ [Any side benefits?] 
    #speaker:Alistair
    #sprite:Alistair_Assured
    "And I'm sure you benefit from getting the first look."
    "In case any of it makes it back to market, I mean."
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSurprised")
    #speaker:Jules
    #NPC:Jules_Neutral
    "Oh come now, you know how the lab operates."
    "I'd be lucky if these get to see the light of day again!"
    "Probably out of my price range, too." 
    
    #speaker:Alistair
    #sprite:Alistair_Embarassed
    "Ha ha... Yeah, I suppose being frugal is a virtue."
    #sprite:Alistair_Sad
    (Never see the light of day, huh?)
    (... So much will be lost...)
        -> Questions
    
+ [You sure are diligent] 
    #speaker:Alistair
    #sprite:Alistair_Confident
    "You're quite the hard worker, to do all this."
    "It's always been impressive."
    
    #speaker:Jules
    #NPC:Jules_Confident
    "Flattery won't get you anywhere, old friend."
    "Especially not to where you can get your hands on these very interesting and breakable artifacts."
    
    #speaker:Alistair
    #sprite:Alistair_Embarassed
    "Jules! You wound me!"
    "Me, messing with artifacts, perish the thought!"
    #sprite:Alistair_Confident
    "...I meant it, though."
    "I've been hard at work lately, and it's been encouraging to see I'm not the only one."
    
    #speaker:Jules
    #NPC:Jules_Neutral
    "Well then, thank you, Alistair. I wish you luck."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "Now if you'll excuse me, I really must be going."
    "These boxes won't label themselves!"
        -> Questions

=Okay
#speaker:Alistair
#sprite:Alistair_Nervous
    "Jules! Are you alright?"
    "You seem... Not yourself."
    
#speaker:Jules
#NPC:Jules_Nervous
    "Alistair..."
    //~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "It's just... The lives of all these people, laid out to be pawned off."
    "I came to see what I could possibly get for Christa and myself, but..."
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "Seeing it all just... It suddenly hit me."
    
#speaker:Alistair
#sprite:Alistair_Sad
    "I'm... Sorry."
    (For everything, my friend. I'm so sorry.)
    
#speaker:Jules
    "No, no need for that, Alistair."
    "Just me wallowing a bit."
    "A bad habit as of late."
#NPC:Jules_Neutral
    "Seeing you, saying it out loud, has helped."
    "I'm going to look around a bit more..."
-> Questions


=Heading
#speaker:Alistair
#sprite:Alistair_Sad
"Jules... Safe travels."
    
#speaker:Jules
"Thank you. You as well."
~PLAY_SOUND("event:/Character Barks/Jules/JulesThinking")
"Wait... You are going to leave as well, correct?"
"Why aren't you in line?"
    
#speaker:Alistair
#sprite:Alistair_Nervous
    (Ah... That's right, it does seem strange. Hm.)
    + [Private ship]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "I actually... acquired my own vessel. It's parked not too far from here."
        "The Solar Winds. A fine ship."
    + [Still have unfinished business]
        #speaker:Alistair
        #sprite:Alistair_Distant
        "I... Still have a bit of business here. I can't leave quite yet."
        "It's important that I stay."
    -
    #speaker:Jules
    #NPC:Jules_Nervous
    "Alistair, you-"
    
    #speaker:
    #NPC:Jules_Neutral
    Before Jules can finish, the Atmos security personnel calls for him to be checked. Jules spares one last look at me before turning to go.
    
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesFearful")
    #speaker:Jules
    "Please, be safe."
    
    #speaker:Alistair
    #sprite:Alistair_Confident
    "I promise, Jules. I promise."
    (And I hope this is a promise I won't break...)
-> END


//Uriah Bramble
===shopownermarketplace===
~SET_PARAMETER("PrologueCharacters", 3)
~PLAY_SOUND("event:/Character Barks/Uriah/UriahGreeting")
#NPC:Uriah_Neutral
{metShopowner: -> Questions| -> meetShopowner}

=meetShopowner
~metShopowner = true
#speaker:Alistair
#sprite:Alistair_Suspicious
"Hello there, shopkeep."
"I was wondering if I could perchance take a look at your wares, and be made aware of any local news as well."
I glance at their nametag. 'Uriah Bramble.' They greet me with a warm smile.

~PLAY_SOUND("event:/Character Barks/Uriah/UriahHappy")
#speaker:Uriah
"Why of course, sir! I carry a wide variety of wares, feel free to take a look."
"Are you from around here?"

#speaker:Alistair
#sprite:Alistair_Embarassed
"I used to be. Hoping to catch up on what I've missed."

#speaker:Uriah
"I'll do my best to fill you in, then."
"While you shop, of course."
~CREATE_JOURNAL_OBJECT("Shopkeep", "Person", "A shopkeep that offers a variety of different items for purchase. Always has an upbeat attitude", "Full name: Uriah Bramble, they're always happy to help and spread around information. They run the shop to provide for their family, and is certain they'll be able to handle everything that comes their way.")
-> shopownermarketplace

=Questions
#speaker:Uriah
#NPC:Uriah_Neutral
"What can I do for you today?"
+ {time == 3} [Souvenirs?] ->Souvenirs
+ {time == 4} [What's new?] ->New
+ {time == 5} [The announcement...] ->Announcement
+ {time == 7} [Any good gossip?] ->Gossip
+ {time == 8} [Preparing to leave?] ->Preparing
+ [Nothing for now]
~PLAY_SOUND("event:/Character Barks/Uriah/UriahFarewell")
"Come back anytime!"
-> END

=Souvenirs
#speaker: Alistair
#sprite:Alistair_Suspicious
"I've noticed you're selling some souvenirs."
"Understandable, considering all these foreign scholars."

#speaker:Uriah
"Indeed!"
"The crowd is here to see the experiments being shown off at the lab."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahHappy")
"It's the perfect opportunity for them to scout some talent."
"Also a good opportunity for me to sell some of my special drinks!"

#speaker:Alistair
+ [Those must sell well]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "Elore-Nabyke is known for its drinks, right?"
        "I'm sure people from off-planet find them delightful."
+ [Are they interested in something like that?]
        #speaker:Alistair
        #sprite:Alistair_Nervous
        "I feel like the scholarly sort wouldn't be interested."
        "Are you making any sales?"
    -
    
#speaker:Uriah
~PLAY_SOUND("event:/Character Barks/Uriah/UriahHappy")
"Of course! The drinks of Elore-Nabyke are universe-renowned."
"Our method of bubbling, our colors..."
"Have you tried one before?"

#speaker:Alistair
#sprite:Alistair_Assured
"Of course, had them all the time in my intern days."

#speaker:Uriah
"Oh yes of course!"
"You mentioned you've returned."
"Well, if you'd like some more, I'll be here!"
-> Questions


=New
#speaker: Alistair
#sprite:Alistair_Neutral
"Anything new going on?"
"It seems quite calm today."

#speaker:Uriah
"Indeed. Last year was bustling, but nowadays we've returned to the normal amount of foot traffic."
"Unfortunately."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahSurprised")
"Oh! That's right!"
"I believe I heard the library's renovations are nearly complete."
"Or at least they should be by next year."
"I'm sure that'll bring in more customers!"

#speaker:Alistair
#sprite:Alistair_Confident
"Perhaps I'll take a look, then."
"Thank you Uriah."

#speaker:Uriah
"Of course. Have a nice day!"
-> Questions


=Announcement
#speaker: Alistair
#sprite:Alistair_Sad
"I assume you've heard the announcement."
"What are you going to do?"
"It's a pretty grim verdict."

#speaker:Uriah
"Well, we've always handled whatever has come our way."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahSad")
"It's... Heartbreaking, but we'll find a way past it."

#speaker:Alistair
+ ["We?"]
        #speaker:Alistair
        "You said 'we,' did you mean the people of Elore-Nabyke?"
+ [Even though the planet is dying?]
        #speaker:Alistair
        #sprite:Alistair_Distant
        "The planet will be destroyed."
        "How can that be overcome?"
        (Perhaps they can give me some advice...)
    -

#speaker:Uriah
"My family lives on-planet."
"Though I'm often out and about traveling the Trade Seams or here at the market, I'd do anything it takes to provide for them."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahSad")
"That's my priority, my loved ones."

#speaker:Alistair
#sprite:Alistair_Sad
"I see. That's very noble of you."
(Perhaps Uriah and I aren't very different...)
(I've got to get my treasure.)

#speaker:Uriah
"I hope you have a good rest of your day!"
-> Questions


=Gossip
#speaker: Alistair
#sprite:Alistair_Suspicious
"Heard anything interesting lately?"
"It seems everyone here today is rather talkative."

~PLAY_SOUND("event:/Character Barks/Uriah/UriahSad")
#speaker:Uriah
"Indeed. Though I wish they'd do a bit more shopping!"
"You would think planning for the future would entail getting some supplies."

#speaker: Alistair
#sprite:Alistair_Distant
"What would people need supplies for?"

#speaker:Uriah
"I heard that the evacuation is going to happen in just a couple years."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahThinking")
"Atmos vessels are nice and all, but I know I for one would like to have a travel bag."

#speaker:Alistair
#sprite:Alistair_Nervous
+ [What else about the evacuation?]
        #speaker:Alistair
        "Is there anything else you know about the evacuation?
+ [Any other news?]
        #speaker:Alistair
        "Have you heard any other news?
    -

#speaker:Uriah
"There's been talk about the lab director election."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahFearful")
"People have been saying how the lab organizing the evacuation should have taken precedence."
"Though the evacuation was probably how the director managed to get elected."
"Sure does makes a strong campaign platform!"

#speaker:Alistair
#sprite:Alistair_Embarassed
"I suppose those two events are linked."
"Well, I'll leave you to it, don't want to take up too much of your time."

#speaker:Uriah
"Have a nice day!"
-> Questions


=Preparing
#speaker: Alistair
#sprite:Alistair_Nervous
"You're still running the store?"
"Shouldn't you be preparing to leave?"

#speaker:Uriah
"I am. A number of the items on sale are my family's old possessions."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahSad")
"It's a shame to see them go, but we can't take things like furniture with us."
"I also have to keep an eye for any good things on sale."

#speaker:Alistair
+ [Have anything good?]
        #speaker:Alistair
        #sprite:Alistair_Suspicious
        "I see, that's a smart way of looking at it."
        "Have you managed to find anything of value?"
+ [Isn't it all just junk though?]
        #speaker:Alistair
        #sprite:Alistair_Distant
        "Isn't everything being put up for sale for the same reason?"
        "If they're not willing or able to bring it, how does that change if you have it?"
    -

~PLAY_SOUND("event:/Character Barks/Uriah/UriahThinking")
#speaker:Uriah
"One person's trash is another one's treasure!"
"I managed to get something special. A large blanket."
"People traveling by themselves have no need for something so bulky."
"But I'll be with my family."
"I'm planning on using it for us to sit on, or to huddle together."
~PLAY_SOUND("event:/Character Barks/Uriah/UriahHappy")
"It's good quality fabric, too. It was quite a bargain!"

#speaker:Alistair
#sprite:Alistair_Sad
"That's... Lovely."
(I could use some of that optimism.)
#sprite:Alistair_Confident
"I wish you nothing but the best."

#speaker:Uriah
"Thank you, sir. I just realized, I never caught your name?"

#speaker:Alistair
#sprite:Alistair_Neutral
"It's Alistair."

~PLAY_SOUND("event:/Character Barks/Uriah/UriahHappy")
#speaker:Uriah
"Well then, have a nice life, Alistair!"

#speaker:Alistair
"You too."

-> Questions


//Temperance Ward
===childmarketplace===
~SET_PARAMETER("PrologueCharacters", 4)
~PLAY_SOUND("event:/Character Barks/Temperance/ChildGreeting")
#NPC:Temperance_Neutral
{metChild: -> Questions| -> meetChild}

=meetChild
#speaker:Alistair
#sprite:Alistair_Neutral
    "Hello there! What's your name?"
    
    #speaker:Child
    "...Temperance."
    
    #speaker:Alistair
    "Oh, well..."
    "My name is Alistair!"
    
    #speaker:Temperance
    "..."
    
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "You... doing alright?"
    
    ~PLAY_SOUND("event:/Character Barks/Temperance/ChildAngry")
    ~CREATE_JOURNAL_OBJECT("Child", "Person", "A young child who wishes to work in the lab one day. Her parents are leaving the planet with her early.", "Temperance Ward is her full name, a young person who always seems to speak her mind regardless of the situation. She wishes to work at the lab, but that's nothing but a pipe dream now.")
    ~metChild = true
    #speaker:Temperance
    "I'm fine."
-> childmarketplace

=Questions
#speaker:Temperance
#NPC:Temperance_Neutral
"... What do you want?"
    + {time == 1} [Like the story?] ->Story
    + {time == 2} [Exciting stuff, huh?] ->Exciting
    + {time == 3} [Listening in?] ->Listening
    + {time == 7} [What's wrong?] ->Wrong
    + {time == 8} [Hey, be careful!] ->Careful
    + [Nothing for now]
    ~PLAY_SOUND("event:/Character Barks/Temperance/ChildFarewell")
    "Fine."
    -> DONE

=Story
#speaker:Alistair
#sprite:Alistair_Assured
"Do you like the story? She's such a good speaker, isn't she?"
"You shouldn't take her too seriously, though."

~PLAY_SOUND("event:/Character Barks/Temperance/ChildFearful")
#speaker:Temperance
"..."

#speaker:Alistair
#sprite:Alistair_Embarassed
"I'm a fan of the story."
"Though it does go against the lab's observations."
"It-"

~PLAY_SOUND("event:/Character Barks/Temperance/ChildSurprised")
#speaker:Temperance
#NPC:Temperance_Confident
"You work in the lab, mister? Really? What's it like?"

#speaker:Alistair
#sprite:Alistair_Nervous
"Ah, er..."
(She suddenly opened up! What now...)
+ [Yes. I work at the lab. Definitely]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "Yes! I mean, yes. I do. Been there awhile."
        "I get to see all the cool things they have."
        "Access to the vault and everything."
        (I wish.)
+ [Not anymore, but I used to]
        #speaker:Alistair
        #sprite:Alistair_Embarassed
        "Oh, well, not anymore. I had to leave and head elsewhere for a while."
        "But I worked under Director Crabb, and alongside a good friend of mine."
        "So I'm still in the lab's good graces."
        (Or at least Jules'. I doubt Crabb wants to see my face.)
    -
    
~PLAY_SOUND("event:/Character Barks/Temperance/ChildHappy")
#speaker:Temperance
"Wow... I wish I could work in the lab, too!"
"They know so many cool things!"
"It's my dream."

#speaker:Alistair
#sprite:Alistair_Sad
(Urgh. Curses.)
(Good going Alistair, you've ruined a child's dream.)
"Well... work hard and I'm sure you'll make it."

~PLAY_SOUND("event:/Character Barks/Temperance/ChildHappy")
#speaker:Temperance
"Thanks, mister! I will!"
-> Questions


=Exciting
#speaker:Alistair
#sprite:Alistair_Confident
"Woah there! You seem excited."
"There are some delicate goods being handled, don't bump into anyone."

~PLAY_SOUND("event:/Character Barks/Temperance/ChildFearful")
#speaker:Temperance
#NPC:Temperance_Neutral
"Oh! Um, sorry mister."

#speaker:Alistair
#sprite:Alistair_Distant
"And steer especially clear of the lab workers."
"Some of those artifacts cannot be replaced."

~PLAY_SOUND("event:/Character Barks/Temperance/ChildHappy")
#speaker:Temperance
"Ah! But... That stuff's so cool! I wanna see it!"
#NPC:Temperance_Confident
"All that lab stuff is so cool."

#speaker:Alistair
+ [They do a bunch of boring stuff too, though]
        #speaker:Alistair
        #sprite:Alistair_Neutral
        "Well, I'm glad you're excited."
        "However, it's not just holding cool devices."
        "They do a lot of boring research and tests, too."
        "And they have lots of regulations."
+ [It really is the coolest]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "Yeah. Those folks at the lab work really hard."
        "They really are cool. They do groundbreaking research every day. They change the world."
        #sprite:Alistair_Sad
        (...Not always for the better, in my case.)
    -
    
#speaker:Temperance
#NPC:Temperance_Neutral
"Some other kids think it's boring, but I think that research stuff is the best part."
"It's fun to know things."
"And to learn!"

#speaker:Alistair
 #sprite:Alistair_Confident
"That's a wonderful mindset you have there."
"You should check out the science fair they're having next year."
"Lots of interesting topics there."

~PLAY_SOUND("event:/Character Barks/Temperance/ChildSurprised")
#speaker:Temperance
#NPC:Temperance_Confident
"Really? I will!"
-> Questions


=Listening
#speaker:Alistair
#sprite:Alistair_Suspicious
"Listening to the storyteller?"
"I would have expected you to be more interested in the science fair."

#speaker:Temperance
#NPC:Temperance_Confident
"I already looked at all that stuff."
~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
"All the lab people are busy talking to a bunch of snooty people."
#NPC:Temperance_Neutral
"Some man in a top hat shooed me away."

#speaker:Alistair
"So you're here listening to Miriam?"
+ [She doesn't trust the lab at all]
        #speaker:Alistair
        #sprite:Alistair_Nervous
        "She doesn't believe in the lab or any of the workers."
        "Most of her 'stories' are wild rumors."
+ [She does perform for anyone]
        #speaker:Alistair
        #sprite:Alistair_Embarassed
        "I suppose she does have a certain charm in that she doesn't discriminate."
    -
    
#speaker:Temperance
"I know she says different things than the lab people..."
~PLAY_SOUND("event:/Character Barks/Temperance/TeenThinking")
"But it's interesting. It's new."
"The Lab can hardly know everything anyway."
"Especially when they won't even let civilians into a science fair!

#speaker:Alistair
#sprite:Alistair_Distant
"Ah, yes."
"I suppose so."

#speaker:Temperance
"Mhm."

-> Questions

=Wrong
#speaker:Alistair
#sprite:Alistair_Nervous
"Hey, what's wrong?"

~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
#speaker:Temperance
#NPC:Temperance_Teen_Neutral
"Hmph. What makes you think something's wrong?"

#speaker:Alistair
#sprite:Alistair_Assured
(Hm. Seems she's in her rebellious phase. Nothing I can't handle.)
"Well, you just seem a bit unenergetic."
"The results of the election for lab director's still hot news."
"I figured it'd be something to be excited about."

#speaker:Temperance
"The lab director?"
~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
#NPC:Temperance_Teen_Distant
"What does it matter anyway?"

#speaker:Alistair
#sprite:Alistair_Nervous
(Uh oh.)
+ [Did you want someone else to win?]
        #speaker:Alistair
        "Are you unsatisfied with the election results?"
        "Even if you are, there's always next time."
        "... I suppose."
+ [Is it about the planet?]
        #speaker:Alistair
        "Do you say that because the planet is dying?"
        "Even if we lose the physical lab, the people will live."
        "The research they've done will persist."
        "Knowledge doesn't die."
    -
    
#speaker:Temperance
"Yeah right."
//~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
"Look mister, Those lab people, with all their fancy equipment, couldn't even notice the planet's core dying."
"And now we just have to run away?"
"That'll always be the same, I've realized."
~PLAY_SOUND("event:/Character Barks/Temperance/TeenSad")
"They're not willing to fight for it. Not willing to change."
"Doesn't matter who the Director is."

#speaker:Alistair
#sprite:Alistair_Sad
(Oh my...)
"You should know that their instruments are finely tuned."
"I would like to think that they are..."
"Trying their best?"

~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
#speaker:Temperance
#NPC:Temperance_Teen_Neutral
"Whatever."
-> Questions


=Careful
#speaker:Alistair
#sprite:Alistair_Suspicious
"Be careful there!"
"You could've knocked him over."

#speaker:Temperance
#NPC:Temperance_Teen_Neutral
"-erves it..."

#speaker:Alistair
"What was that?"

~PLAY_SOUND("event:/Character Barks/Temperance/TeenAngry")
#speaker:Temperance
#NPC:Temperance_Teen_Distant
"I said he probably deserves it!"
"He works at the lab, but he's here just wasting time?"
"He should be there! Fixing things!"

#speaker:Alistair
#sprite:Alistair_Nervous
"Mmph..."
(Breathe, Alistair. Breathe.)
#sprite:Alistair_Distant
(I'm letting my friendship with Jules make this personal.)
#sprite:Alistair_Sad
"I understand that you're upset."
+ [But there's nothing he can do]
        #speaker:Alistair
        "He's just been...struggling for years on end against a monumental problem."
        "One scientist against the weight of a world."
        "It's kind of poetic..."
        "Ah- but, try to just..."
        "Talk to the Director."
        "Then, we can support the lab to be better!"
+ [But lashing out won't fix things]
        #speaker:Alistair
        "You can't take out your feelings on him."
        "The people in the lab are the ones closest to this issue."
        "It's... Infuriating."
        #sprite:Alistair_Distant
        "To be so close to fixing something and to... To..."
        "Not be able to fix it."
        "..."
        #sprite:Alistair_Sad
        "We should be supporting each other in times like this."
    -
    
~PLAY_SOUND("event:/Character Barks/Temperance/TeenSad")
#speaker:Temperance
#NPC:Temperance_Teen_Neutral
"...But..."
"...Then who'll support me?"
"I don't want the planet to die."
"What about my feelings?"

#speaker:Alistair
#sprite:Alistair_Embarassed
"We support each other. If you reach out a hand, you'll be offered a hand back."
"There are always people who will care about you."

#speaker:Temperance
"..."
"Do you... Care?"

#speaker:Alistair
#sprite:Alistair_Confident
"Yes."

#speaker:Temperance
"..."
~PLAY_SOUND("event:/Character Barks/Temperance/TeenSad")
"Thanks, mister. Alistair."

#speaker:Alistair
#sprite:Alistair_Sad
"Take care."
(I'm... so sorry.)
-> Questions


//Miriam Harcourt
===oldladymarketplace===
~SET_PARAMETER("PrologueCharacters", 5)
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamGreeting")
#NPC:Miriam_Neutral
{metOldlady: -> Questions| -> meetOldlady}

=meetOldlady
~metOldlady = true
#speaker:Alistair
"Hello, ma'am. I couldn't help but notice, you appear to be a storyteller of sorts."
"Could you-"

~PLAY_SOUND("event:/Character Barks/Miriam/MiriamHappy")
#speaker:Storyteller
#NPC:Miriam_Confident
"Storyteller? My dear boy, I am no mere storyteller, I am a purveyor of truth!"
#speaker:Miriam
"They all doubt old Miriam, but they'll soon see!"
"The disappearance of Xitis is a sign of things to come!"

#speaker:Alistair
#sprite:Alistair_Suspicious
(She was always known as a bit of a crackpot.)
(But she's still knowledgeable.)
"Ah, I see.. Well, I'm sorry if I seemed doubtful of you."
+ [I'm interested in stories]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "I merely thought you may have tales worth hearing."
        "Even stories can hold some truth."
+ [I'm looking for truth]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "Truth can sometimes be stranger than fiction."
        "I thought you may be able to tell me something I wouldn't be able to find elsewhere"
    -
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamHappy")
#speaker:Miriam
#NPC:Miriam_Neutral
"Then you've come to the right place!"
~CREATE_JOURNAL_OBJECT("Storyteller", "Person", "An old woman who always has an interesting story to tell.", "Full name Miriam Harcourt, she's a local who often tells stories to anyone willing to approach her. However they seem to be nothing more than fantasy, even if she claims they're truthful.")
"I assure you, I know what they wish I did not!"
-> oldladymarketplace

=Questions
#speaker:Miriam
#NPC:Miriam_Neutral
"What curiosity do you hold, young man? I have all the answers!"
+ {time == 1} [Disappearance of Xitis?] ->Dissapearance
+ {time == 2} [Busy day?] ->Busy
+ {time == 3} [Can't get a crowd?] ->Crowd
+ {time == 4} [Who are you talking to?] ->Who
+ {time == 5} [About the announcement...] ->Announcement
+ [Nothing for now]
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamFarewell")
"Whenever you seek truth, just find me again." 
-> END

=Dissapearance
#speaker:Alistair
#sprite:Alistair_Nervous
"I think I overheard you say something about Xitis... Disappearing?"
"The Director said it was destroyed."

#speaker:Miriam
"Aha! That's what they want you to think!"
"You see, Xitis was not destroyed, but lost!"
"Lost in the cosmic web!"
"The Strings that connect our vast universe are deeper than you could ever imagine..."
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamFearful")
"So deep, even a planet could be swallowed up, lost in the space between spaces!"
"Not even the most traveled Trade Seams are truly safe..."

#speaker:Alistair
#sprite:Alistair_Suspicious
(She's not... entirely incorrect.)
(Maybe Xitis has been thrown off by what's happening here with the Great Machine part?)

~PLAY_SOUND("event:/Character Barks/Miriam/MiriamSurprised")
#speaker:Miriam
#NPC:Miriam_Confident
"Oh? Has the truth rendered you speechless?"

#speaker:Alistair
"Ah, I'm sorry..."
+ [Just lost in thought]
        #speaker:Alistair
        #sprite:Alistair_Distant
        "I'm just lost in my own thoughts, I'm sorry."
        "I find myself questioning the decisions I've made..."
+ [I'm awed by your words]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "I'm simply rattled by such a possibility...:
        "Truly, you have opened my eyes."
    -

#speaker:Miriam
#NPC:Miriam_Neutral
"I'm glad someone here has the sense to listen!"
-> END


=Busy
#speaker:Alistair
#sprite:Alistair_Confident
"Hello there! A busy day, isn't it?"

#speaker:Miriam
"Busy! Well!"
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamAngry")
"Try frustrating! I can hardly think with all this racket."
"How am I supposed to spread truth like this?"
"A sudden boom of products and everyone seems content to ignore the big picture..."

#speaker:Alistair
"Well..."
+ [It's understandable]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "There are many unique artifacts being imported."
        "Who wouldn't be giddy to see it all?"
+ [I'm here, I could listen]
        #speaker:Alistair
        #sprite:Alistair_Embarassed
        "You're not entirely ignored."
        "Why, here I am. Why don't you tell me a tale?"
    -

#speaker:Miriam
#NPC:Miriam_Confident
"Oh? Then let me tell you, these baubles are just a taste of the true wonders those lab people wish to obtain."
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamHappy")
"Have you ever heard of the Inventor? A true miracle worker!"
"Wars have been fought over their inventions..."
"A disk that makes machines work as if they were new!"
"A ring entirely impervious to harm!"
"But the Inventor never seems to stay in one place..."
"It's almost as if they are a ghost from the far future!"

#speaker:Alistair
#sprite:Alistair_Nervous
"Ah... Well, er, that's very interesting."
#sprite:Alistair_Distant
(The future? More like a ghost from a very dark past...)
#sprite:Alistair_Neutral
"I'm sure the Director would have a field day with those sorts of devices."

#speaker:Miriam
#NPC:Miriam_Neutral
"Hah! As if they could handle it!"
"Mark my words, grand things are coming."
"Grand things..."
-> END


=Crowd
#speaker:Alistair
#sprite:Alistair_Suspicious
"What a crowd! And so many from off planet, seeing the sights."
"I think you'll have trouble getting an audience today."

#speaker:Miriam
"That's just it! I must warn them of the danger!"
"Out there, traveling from planet to planet..."
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamFearful")
"The Sirens could lead them Adrift!"

#speaker:Alistair
#sprite:Alistair_Nervous
(She gets crazier and crazier by the day...)
(But I should humor her, on the off chance something could be useful for me.)
(Or Him.)
+ [Sirens?]
        #speaker:Alistair
        #sprite:Alistair_Suspicious
        "Sirens? You mean like alarms?"
        "How would that lead anyone Adrift?"
        
+ [Adrift?]
        #speaker:Alistair
        "Adrift, as in lost?"
        "These people take secure Seams, they would have no chance of ending up somewhere other than their destination."
    -

#speaker:Miriam
#NPC:Miriam_Confident
"The Sirens mimic the sounds of ships in distress!"
"They lure others away from safety, into the horrors of a raw string!"
"The crew hears their dying words on repeat..."
"Before the vessel gets pushed to the edge of the universe, devoid of life."
"Or worse, it becomes a ghost ship!"
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamAngry")
"These dire warnings must be heeded!"

#speaker:Alistair
#sprite:Alistair_Distant
(What a wild rumor. Although...)
"I see."
"Well, I'll be extra careful when I travel from now on, and I'll be sure to pass your advice on."

#speaker:Miriam
#NPC:Miriam_Neutral
"That would do my heart good, my boy, knowing you are safe."
"And that you keep your eyes open to the truth beneath the lies fed to us by those on high!"

#speaker:Alistair
#sprite:Alistair_Neutral
"..."
"I'm glad you have my best interests in mind."
-> END


=Who
#speaker:Alistair
#sprite:Alistair_Suspicious
"Er... Pardon the interruption, but who are you speaking to?"
"You appear to not have an audience today."
"And there isn't really anyone else."

~PLAY_SOUND("event:/Character Barks/Miriam/MiriamHappy")
#speaker:Miriam
"Ah, but my boy, you're here, yes? Here, at this intersection of fate."
"There are grand things about."
"Grand things."
"Oh so grand."
"Have you heard of it?"

#speaker:Alistair
#sprite:Alistair_Nervous
(Uh oh.)
+ [I haven't...?]
        #speaker:Alistair
        #sprite:Alistair_Sad
        "I can't say that I have."
        "Well, I've heard a great many things."
        "But somehow I doubt I've heard what it is you're referring to."
        
+ [I have...?]
        #speaker:Alistair
        #sprite:Alistair_Assured
        "I certainly get around to many places, and hear many things."
        "I think I may know what you mean."
        (Hopefully she bought that.)
    -

#speaker:Miriam
"The cries of the void."

#speaker:Alistair
#sprite:Alistair_Neutral
"Ah."
#sprite:Alistair_Distant
"Yes."
#sprite:Alistair_Neutral
"The cries."

~PLAY_SOUND("event:/Character Barks/Miriam/MiriamFearful")
#speaker:Miriam
"We are on the cusp of a great transition."
"The cold maw of space yawns wide for us"
"And I can hear it. I hear it because I listen."
"So I'm here, talking to anyone who is not so fortunate as I."

#speaker:Alistair
#sprite:Alistair_Nervous
"I..."
"Thank you. Miriam."
-> END


=Announcement
#speaker:Alistair
#sprite:Alistair_Sad
"Miriam. I assume you've heard the announcement."

#speaker:Miriam
"Yes. The time has come."

#speaker:Alistair
#sprite:Alistair_Nervous
"What are you going to do?"
"I mean, besides evacuate."

~PLAY_SOUND("event:/Character Barks/Miriam/MiriamHappy")
#speaker:Miriam
#NPC:Miriam_Confident
"I knew it. I knew it all along. That those lab folk were hiding something."

#speaker:Alistair
#sprite:Alistair_Distant
"I..."
"Don't think it's their fault..."

#speaker:Miriam
#NPC:Miriam_Neutral
"Elore-Nabyke will become lost in the folds of reality."
"All so those fools can claim their ill-gotten gains."
"I must prepare to spread the truth."

#speaker:Alistair
#sprite:Alistair_Sad
"What do you mean?"
"The Director said the planet would be destroyed."

#speaker:Miriam
"It's just like Xitis all over again." 
~PLAY_SOUND("event:/Character Barks/Miriam/MiriamAngry")
"Doesn't anyone see? It's a pattern! A plot!"

#speaker:Alistair
#sprite:Alistair_Nervous
(I can't contradict her without revealing too much!)
"Please, don't do anything crazy."

#speaker:Miriam
"Mhm."

#speaker:Alistair
(Curses.)
"I'll... See you around."
"Be safe Miriam."

#speaker:Miriam
"Bah! Yes, yes..."
-> END
