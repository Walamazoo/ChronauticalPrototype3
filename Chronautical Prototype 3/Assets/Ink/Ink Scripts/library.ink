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
//~ TOGGLE_SLIDER_INTERACTABLE(false)
~PLAY_MUSIC("event:/Music/Prologue Music")
~PLAY_AMBIENCE("event:/Sound/Ambience/Prologue Ambience")
~ time = 10
~ seenBeginning = true
~ inTutorial = true
~TOGGLE_MINIMAP(false)
#background:Silhouette_Intro

When I was a boy, I put all my thoughts and dreams into a book. Sketches, diagrams, torn-out pages.
It was full of what I would become; dreams of adventure in the stars piercing through the dark emptiness.
I was gripped with a frenzy to explore beyond my bubble of libraries and teahouses.
But, most of all, I dreamed of the star system lost.
Atlantis.

~TOGGLE_FILTER(true)
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

#speaker:Alistair
"There's still time. I can still fix this, I just need to-"

#speaker:D4RL1N6
"Alistair, it is inadvisable to ignore me."

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
* [I'm a failure] "If I can't even save this planet, what's the point?"
* [There must be a way] "There must be something I'm just not thinking of."

#speaker:D4RL1N6
- "You have done everything you can."
"I am sorry, Alistair, this quest of yours is futile. You need to save what is important."

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

#speaker:Alistair
"Ah yes."
"The safety protocol."
"We'll have to make sure everything is in working order."

#speaker:D4RL1N6
"Of course, Alistair."
"Time travel can be dangerous after all."
~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
"You will have to use your Astrolabe to return to a time before all this destruction." 
"One year in the past should be sufficient for now."
~PLAY_SOUND("event:/Character Barks/Darling/DarlingHappy")
"Pull the slider to the year you would like to travel to, then activiate."
//Cue Timeline will appear, handle will flash
//The player can only select time 9
//Minimap and journal not currently enabled
~TOGGLE_SLIDER(true)
->END


===DEVINTROSKIP===
~TOGGLE_FILTER(true)
~PLAY_SOUND("event:/Sound/SFX/Prologue/reflective shift")
#background:Library_Interior
#sprite:Alistair_Neutral 
~TOGGLE_JOURNAL(true)
~CREATE_JOURNAL_OBJECT("D4RL1N6", "Person", "My robot companion that helps to keep me on task.", "I built D4RL1N6 myself, and he's quickly become one of my best friends as he keeps me company when no one else will.")
~CREATE_TIMELINE_CLUE("End of beginning", "placeclue", "No way to save the planet.", "All of my attempts have failed to save Elore-Nabyke. I have to retrieve what's in the vault instead.")
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
"It seems that even without the fire the vault can not be opened." 
"We need a code."
"But, we now have valuable information we can put in the journal."
~TOGGLE_JOURNAL(true)
~CREATE_JOURNAL_OBJECT("D4RL1N6", "Person", "My robot companion that helps to keep me on task.", "I built D4RL1N6 myself, and he's quickly become one of my best friends as he keeps me company when no one else will.")
~CREATE_TIMELINE_CLUE("End of beginning", "placeclue", "No way to save the planet.", "All of my attempts have failed to save Elore-Nabyke. I have to retrieve what's in the vault instead.")
~TOGGLE_SLIDER(true)
//Could include something here to make the player open the journal before continuing

#speaker:D4RL1N6
"This is the end of the safety protocol."

#speaker:Alistair
"Thank you."
"Now, I'd better find someway into this vault..."

#speaker:D4RL1N6
"We should investigate the vault further now that it is not too hot for your human hands."
~inTutorial = false
-> LIBRARY


===LIBRARY===
//Tutorial Check
{inTutorial: -> Tutorial| }
//Room Description for Journal
{ time:
- 1:    
        ~ roomDescription = "Gossip about the announcement, and security won't let me close to the vault."
        ~SET_PARAMETER("PrologueTime", 1)
        ~SET_PARAMETER("PrologueAmbience", 0)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 2:    
        ~ roomDescription = "Under rennovations and filled with security."
        ~SET_PARAMETER("PrologueTime", 1)
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)
- 3:    
        ~ roomDescription = "Under rennovations and filled with security."
        ~SET_PARAMETER("PrologueTime", 5)
        ~SET_PARAMETER("PrologueAmbience", 1)
        ~SET_PARAMETER("PrologueCharacters", 0)

- 4:    
        ~ roomDescription = "Nearly done with rennovations but filled with security."
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
   // + [Look around]
        //Room Description for player and choices
        { time:
        - 1:    Employees sit in tight circles around the library. There's no reading being done, instead, there's an electricity in the air in the form of hushed whispers.
                +Investigate the vault -> Security
                +Check elsewhere -> END
        - 2:    Scaffolding grazes the arched ceilings of the library. The smells of paint, hardwood, and oil linger in the air as carpenters navigate the space. Lab security keeps a close eye on the newcomers. 
                +Investigate the vault -> Security
                +Check elsewhere -> END
        - 3:    Carpenters dip their brushes into fine lacquers to coat the rows of shelves as masons repair chipped floors. The room is sectioned off and lab security stands at attention. 
                +Investigate the vault -> Security
                +Check elsewhere -> END
        - 4:    A foreman paces around the renovated library carrying a clipboard, lab security following her every step. Looks like rennovations are almost done. 
                +Investigate the vault -> Security
                +Check elsewhere -> END
        - 5:     Lab employees gather around to marvel at the library that shines with newfound gusto. Even the books seem a little newer.
               +Investigate the vault -> InvestigateVault
               +Check elsewhere -> END
        - 6:    People stand shoulder to shoulder, all looking at a group of lab board members sitting in a circle toward the front of the room. Everyone is eager to listen and some even stand on ladders to get the best vantage point. 
                +Listen in -> Election
                +Check elsewhere -> END
        - 7:    The library sits silently and shines coldly. Lab employees huddle like silent vultures over their books.
                +Investigate the vault -> InvestigateVault
                +Check elsewhere -> END
        - 8:    The library is steeped in gloom. Shelves of books soar to the cieling in the darkness and some tomes have been abandoned where they lay open on reading desks.
                +Investigate the vault -> InvestigateVault
                +Check elsewhere -> END
        - 9:    The floor vibrates and occasionally shutters under my feet. The books lining the library shift briefly, then hold still once more. 
                +Investigate the vault -> InvestigateVault
                +Check elsewhere -> END
        - 10:   Flames have claimed the library. Any metal is now liquid and only aids the fire in its quest for destruction.
                +Investigate the vault -> HotVault
                +Check elsewhere -> END
        }
        //-> library
 

//NPC Convos

//Jules Ambrose
===juleslibrary===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
~SET_PARAMETER("PrologueCharacters", 1)
#NPC:Jules_Neutral
{metJules: -> Questions|-> meetJules}

=meetJules
~metJules=true

    #speaker:Alistair
    "Jules? Is that you?"
    
    #speaker: 
    Jules’s face breaks into a shocked smile, caught off guard by the familiar voice.
    
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
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")

        #speaker:Jules
        "Ha! You are too easy to read my friend." -> juleslibrary
    +[Adventuring] 
        
        #speaker:Alistair
        "Oh I've been... adventuring."
        
         #speaker:Jules
        "Adventuring? Where? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
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
    #speaker:Jules
    //~ TOGGLE_SLIDER_INTERACTABLE(true)
    "Let's speak again soon, Alistair."
    -> END

//Question topics
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
"It's truely nostalgic..."
        ->juleslibrary

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
        "... That's a good thing, Alistair. Don’t ever lose your sense of wonder, that adventurous spirit of yours."
        ++ [Promise] 
            #speaker:Alistair
            "I don't think I ever will, you can count on that."
            
            #speaker:Jules
            "Good."
                -> juleslibrary
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
                -> juleslibrary
=vault
#speaker:Alistair
#sprite:Alistair_Nervous
"Jules, I was hoping to ask you something about the labratory's vault..."

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

#speaker:Jules
"Bennet is a stickler for rules."

#speaker:Alistair
#sprite:Alistair_Neutral
"So, I wanted to ask if you wanted to help me get into the vault."

#speaker:Jules
"Help you...?"
"Alistair, now you sound like you really are planning a heist."

#speaker:Alistair
"All I need is what's mine."

#speaker:Jules
"Alistair, only the Director can open the vault."
"Bennet has a device in his office to open the vault, a key."
"But, please, do not consider stealing it."

#speaker:Alistair
"I... wasn't thinking that."

#speaker:Jules
"Good."
"Only the Director can open the vault, Alistair."
"But perhaps there is some paperwork you can fill out to get your belongings back."

#speaker:Alistair
#sprite:Alistair_Sad
"And get stuck in bureaucratic hell..."

#speaker:Jules
"Oh Alistair."
"I am sorry, I wish I could help you."

#NPC:Darling_Upset
#speaker:D4RL1N6
"Do not give up yet Alistair."

#speaker:Alistair
"Of course."

#NPC:Darling_Neutral
#speaker:D4RL1N6
"I am sure that there are more options we have not explored. Keep searching."

{seenElection:
#speaker:Alistair
#sprite:Alistair_Confident
"I recall an election, perhaps we can find some leads there."
}

//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
#sprite:Alistair_Neutral
-> DONE

=runfordirector
~julesRun = true
#speaker:Alistair
"Jules, how often does the Director election process take place?"

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

#speaker:Jules
"Well..."
"Yes, it would be healthy for the lab to have some change in leadership."
"Bennet is quite stuck in his ways. Just focused on keeping things as they are, a steady course neither up nor down."

#speaker:Alistair
#sprite:Alistair_Embarassed
"I think you should run against Bennet."

#speaker:Jules
#NPC:Jules_Nervous
"What-"
"Alistair!"
"I cannot run up against Bennet, I am much, much younger- I lack experience..."

#speaker:Alistair
"But you said so yourself that the lab needs some change in leadership."
"I'm sure you're not the only one with that sentiment."

#speaker:Jules
"Perhaps so- but..."
"Ahh... It is unlikely I would win. Even if the council does want Bennet gone."

#speaker:Alistair
#sprite:Alistair_Neutral
"But what's the harm in trying? The election is still quite far away."

#speaker:Jules
"... Perhaps, I will think about it."
"But I do doubt I would have much success."
#NPC:Jules_Neutral
"That is quite far away, I'll think about it again once the time is nearer."
//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=topicschange
#speaker:Alistair
#sprite:Alistair_Suspicious
"Jules, I was thinking, what sort of things do you think the people of Elore-Nabyke would like the Director to talk about?"

#speaker:Jules
#NPC:Jules_Nervous
"That's... a strange question."
"You usually don't care much for lab politics..."

#speaker:Alistair
#sprite:Alistair_Neutral
"Oh, but I'm just curious. I think that perhaps the people would like to hear an apology, you know?"

#speaker:Jules
"An apology about what...?"

#speaker:Alistair
"Oh- I mean, just for the lab to be more transparent with the people of the planet."
"Right now, the lab and the people feel very seperate, don't you think?"

#speaker:Jules
#NPC:Jules_Neutral
"Hm."
"I suppose so. I haven't thought of that."

#speaker:Alistair
"Just some food for thought."
~ speechImproved = true
~ helpComplete = helpComplete +1
//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=fumbleword
#speaker:Alistair
#sprite:Alistair_Assured
"Jules..."
"This is sort of a strange question, but, what do you call the numbers and words that represent your home's location?"

#speaker:Jules
#NPC:Jules_Nervous
"... What-"
"Alistair, what are you talking about?"

#speaker:Alistair
"Just trust me Jules."

#speaker:Jules
"Okay. An... Address?" 

#speaker:Alistair
#sprite:Alistair_Neutral
"Okay, good. Address. Let's practice saying it."

#speaker:Jules
"Alistair, are you okay? Did something happen...?"

#speaker:Alistair
"No, I just want to make sure you can say that word really well."
"I know that sounds strange, but just trust me. It'll make sense later."

#speaker:Jules
"Okay..."
#NPC:Jules_Neutral
"Address."

#speaker:Alistair
"And there's also 'address' as in, let's address this."

#speaker:Jules
"Address."
#NPC:Jules_Nervous
"Address?"

#speaker:Alistair
"Perfect."
~ helpComplete = helpComplete +1
~ addressFix = true
//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=speechpeptalk
#speaker:Alistair
"You know, I think you would be a good Director."

#speaker:Jules
#NPC:Jules_Nervous
"Oh?"
"Really? Well, I'll run and try my best."
#NPC:Jules_Neutral
"But Crabb has been in the business so long, it's hard to imagine anyone but him being Director."

#speaker:Alistair
"Maybe."
"But you're smart, and you worry about things other than the lab's profit margins."
"You know, I don't think I've ever even seen Bennet in the market."

#speaker:Jules
"I've heard he hasn't left the lab grounds in years."

#speaker:Alistair
"See, this is why you'd be great as a Director."

#speaker:Jules
#NPC:Jules_Confident
"Thanks Alistair."
"I'll try my best."
~ helpComplete = helpComplete +1
//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE


//Temperance Ward
===childlibrary===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
~SET_PARAMETER("PrologueCharacters", 4)
~PLAY_SOUND("event:/Character Barks/Temperance/child-greeting")
#NPC:Temperance_Neutral
{metChild: -> Questions|-> meetChild}

=meetChild
#speaker:Alistair
    "Hello there! What's your name?"
    
    #speaker:Child
    "...Temperance."
    
    #speaker:Alistair
    "Oh, well..."
    "My name is Alistair!"
    
    #speaker:Temperance
    "..."
    
    #speaker:Alistair
    "You... doing alright?"
    
    ~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
    #speaker:Temperance
    "I'm fine."
    ~metChild = true
    ~CREATE_JOURNAL_OBJECT("Child", "Person", "A young child who wishes to work in the lab one day. Her parents are leaving the planet with her early.", "Temperance Ward is her full name, a young person who always seems to speak her mind regardless of situation. She wishes to work at the lab, but that's nothing but a pipe dream now.")
-> childlibrary

=Questions
#speaker:Temperance
"... What do you want?"
    + [Lost?] -> Lost
    + [Parents?] -> Parents
    + [Nothing for now]
    ~PLAY_SOUND("event:/Character Barks/Temperance/child-farewell")
    #speaker:Temperance
    "Fine."
        //~ TOGGLE_SLIDER_INTERACTABLE(true)
        #NPC:None
        -> END
=Lost
"Are you... lost? I don't think children are supposed to be in the lab." #speaker:Alistair
        #speaker:Temperance
        "I'm not lost."
        "I'm exploring."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
        "Nobody is in the lab anyway. Everyone is getting ready to evacuate."
            ++ [You evacuate too?] 
                #speaker:Alistair
                "Shouldn't you be getting ready too?"
                
                ~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
                #speaker:Temperance
                "I am ready. I have everything I need."
                #speaker: Alistair
            "Oh." 
            "Okay."
                -> childlibrary
            
            ++ [Exploring the lab?] 
                #speaker:Alistair
                "You like exploring the lab then?"
                
                #speaker:Temperance
                "I've always wanted to see it."
                ~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
                "This is the only way I'm able to. When everyone is gone..."
                #speaker: Alistair
            "Oh." 
            "Okay."
                -> childlibrary
-> Questions

=Parents
#speaker:Alistair
"Do your parents know you're here?"
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-thinking")
        #speaker:Temperance
        "No."
        "They're packing up everything."
        "We're leaving the planet on a big Spacer."
        "It'll be cool to be on one, but..."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
        "I just wanna stay here..."
        -> childlibrary
-> Questions


//Quest/Plot Specific Knots
===InvestigateVault===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
#background:Vault
The vault is a marvel in and of itself. It's a mass of bronze and golden circles that intersect messily like a bird's nest.
In the center, I see a series of numbers: 0-9. 
{seenPepTalk: | ->DarlingPepTalk}
    + [Pry open door] 
        I squeeze my fingers into the door frame and put my foot on the door.
        I lean back and use all my strength to try to pry open the door, but the thing doesn't budge at all.
        Worth a shot.
        -> InvestigateVault
    + [Kick door] 
        I take a few steps back then give the vault door a good kick square in the center. 
        The vault doesn't shift.
        The only indication that I had kicked the thing at all was the slight pain that's growing in my foot.
        Ouch.
        -> InvestigateVault
    * {hasCode} [Input code]
        ->Ending
    //~ TOGGLE_SLIDER_INTERACTABLE(true)
    + [Do nothing] -> END 


->DarlingPepTalk
===DarlingPepTalk===
~seenPepTalk=true
#speaker:Alistair
"I've seen the vault opened before. It needs a code to be opened."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingThinking")
#speaker:D4RL1N6
#NPC:Darling_Neutral
"Did you see what the code was?"

#speaker:Alistair
"Well, yes, but the code is changed everytime by the Lab Director."
"They take security very seriously here."
"Unfortunately."

#speaker:D4RL1N6
"Then we have to find this Director."

#speaker:Alistair
"And somehow convince him to let us into the vault."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingFrustrated")
#speaker:D4RL1N6
"Do not be so melodramatic. We will find a way. We must aquire your treasure."
"We may also be able to gather information from exploring this place."
"There must be other people in different places or times that could help us."
~TOGGLE_MINIMAP(true)


#speaker:Alistair
"You're right, as usual."
"We'll find a way to get my 'treasure.'"
"If I remember corrently, the Director is usually somewhere in the lab."
"Jules used to say that he slept in his office, it seemed like the Director never left!"
#NPC:None
->DONE


===Security===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
#speaker:Alistair
As I approach the vault, I see one of the vault's security personnel promptly slide over and put himself directly into my path.
He crosses his arms and just stands there.
    + [Say hello]
        #speaker:Alistair
        //sprite, happy/energetic
        "Hello there!"
        The vault security guard just looks down at me.
        He doesn't respond.
        //sprite, unsure/nervous
        "Uh. I said hello there!"
        The guard still does not respond, but I see his eyebrow twitch.
        ++[Say hello again] 
            #speaker:Alistair
            "I said, hello-"
        
            #speaker:Guard
            "I heard you..."
        
            #speaker:Alistair
            "Oh! Apologies..."
            //~ TOGGLE_SLIDER_INTERACTABLE(true)
            (He's not very talkative is he...)
            -> END
        ++[Nevermind] 
            #speaker:Alistair
            I just smile and turn on my heel.
            //~ TOGGLE_SLIDER_INTERACTABLE(true)
            (Maybe I'll look elsewhere.)
            -> END 
    + [Nevermind] 
        I just smile and turn on my heel. 
        //~ TOGGLE_SLIDER_INTERACTABLE(true)
        (Maybe I'll look elsewhere.) -> END 
//~ TOGGLE_SLIDER_INTERACTABLE(true)
-> DONE



===HotVault===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
The vault shimmers from the immense heat in the library. It's clear even from this distance that touching the handle would burn my skin.
The treasure’s most likely melted by now anyways.
//~ TOGGLE_SLIDER_INTERACTABLE(true)
-> DONE



===Election===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
~ seenElection = true
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
        "But."
        "I think I also speak for the community when I say that we find the lab and the director's handling of the evacuation of the planet to be entirely abhorrent."
        "Is it not the lab itself that discovered the core's damaged state? 
        "Why have you not put more time into fixing it? Why must we abandon our home?"
        "Why is the lab still functioning as if the planet is not going to explode in a few years?"
        "I feel that the lab is entirely too closed off from the rest of the planet."
        "I pose these questions not as a way to tear down all the work you all have done, but this is our planet too that you are asking us to leave!"
        "I won't take much more of your time. But I don't believe that Bennet Crabb is suited to deal with this catastrophe. Perhaps it is time for someone younger, with more gumption, to lead us."
        The faces of the board remain steely, but I hear the crowd around me murmur turbulently in excitement and concern. -> ChildMono
    =ChildMono
        ~SET_PARAMETER("PrologueCharacters", 4)
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-fearful")
        #speaker:Temperance
        #NPC:Temperance-teen_Neutral
        "Okay..."
        "Well."
        "Um, so."
        "I know I'm not very old."
        #NPC:Temperance-teen_Confident
        "But when I was little, I wanted to work on the core."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-happy")
        "I wanted to see all the artifacts the lab gets from all over the universe."
        "I..."
        #NPC:Temperance-teen_Neutral
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
        "I thought that you people were just... I thought you just wanted to do that, just be dedicated to science and discovery."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
        "But you're not."
        "You just want to keep things as they are, the old way, and stay right here..."
        "The lab can move to a different planet and continue as things were..."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
        "But our home is right here."
        "That's all I wanted to say."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-farewell")
        "Yeah..." ->OldLadyMono
    =OldLadyMono
        ~SET_PARAMETER("PrologueCharacters", 5)
        #speaker:Miriam
        #NPC:Miriam_Neutral
        As the storyteller Miriam steps up to speak, I hear the crowd sigh and groan.
        A few board members shake their heads and cast their eyes downward.
        #NPC:Miriam_Confident
        "Yes!"
        "Yes, you all complain and sqwauk because you know you are about to hear everything you wish not to accept as truth!"
        "I will open your eyes- Listen now!"
        "The planet will not be destroyed- Elor-Nabyke will not fall!"
        #NPC:Miriam_Neutral
        "They are distracting us- lying to us!"
        "Our planet does not matter."
        "There are hidden planets in the multiverse, hidden in the strings that we can not see!"
        "And there are contraptions of extordinatary power, they are hiding them from us! To collect it for themselves and-"
        #NPC:Miriam_Confident
        The Old Lady's ravings are drowned out as the crowd's murmuring and muttering rise to a creshendo.
        ~SET_PARAMETER("PrologueCharacters", 2)
        I can't hear her words, but the woman writhes and grins at the board as spittle sprays in their direction.
#speaker:Lab Director
#NPC:Bennet_Confident
"Silence!"
"I will have order!"
#speaker:Alistair
It takes awhile for the room to quiet down despite the Director's shouting. Once the Director can speak over the crowd, the meeting resumes as the board members begin to resume their deliberations monotonously. 
{julesRun:
    -> JulesSpeechCheck
  - else:
    #speaker:D4RL1N6
    #NPC:Darling_Neutral
    "There seems to be much unrest here."
    "Perhaps if there were a new director, these people would find peace..."
    
    #speaker:Alistair
    "And perhaps if we could have a friend in a high place we can access the vault."
}
~SET_PARAMETER("PrologueCharacters", 0)

//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
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
"I know I'm not very experienced, but as Director, I would want to focus on the evacuation of the planet in the coming years and to help establish the lab on a new planet."
#NPC:Jules_Neutral
"I'm sure you all have many questions and concerns."
"And I am more than happy to {addressFix: address|a dress- ah- excuse me, address} them with you."
#NPC:Jules_Nervous
Jules' speech was littered with uncertainities and filler words, but his heart was in the right place.
~ seenSpeech = true
//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=JulesSpeechGood
#speaker:Jules
#NPC:Jules_Neutral
"Hello everyone."
"I'm speaking to you today to announce that I am putting forth my opposition to Bennet Crabb's relection." 
"If you'll give me your time, I want to speak on what I would address as Director."
#NPC:Jules_Confident
"These are extremely troubling times and I would call upon the lab to formally apologize to the people of Elore-Nabyke for the mistreatment of the core and the lax reaction to such a catastrophic mistake."
#NPC:Jules_Neutral
"In addition, as Director, I would work with the community to establish an evacuation of the planet as quickly and as comfortably as possible. I would also establish weekly reports to the community that the lab serves to promote full transparency in the years to come."
"I am sure you all have many questions and concerns for me to {addressFix: address."|a dress-a-excuse me, address."}
#NPC:Jules_Confident
"Please, come to me at any time with them and we can discuss."
"Thank you."
~ seenSpeech = true
{helpComplete == 3: -> DirectorCheck| -> END}

= DirectorCheck
~ julesDirector = true
//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> END


//Lab Section Starts
===LAB===
~ TOGGLE_SLIDER_INTERACTABLE(false)
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
    ~ roomDescription = "Room is empty but lots of noise coming from the library. "
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
        - 5:    -> evaluatelab
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
        - 10:   What was once a lab has now been completely swallowed up by a monsterous hole. Fire has consumed most of the other sections of the building, but the hole seems to shoot straight down to the center of the planet.
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
        - 10:   What was once a lab has now been completely swallowed up by a monsterous hole. Fire has consumed most of the other sections of the building, but the hole seems to shoot straight down to the center of the planet.
            -> END
}
   


//NPCs Convos
===TutorialScold===
#speaker:Alistair
"That's Jules, my friend from when I interned at the lab."
"But I don't need to talk to him right now, I should focus on getting into the vault.
->END

//Jules Ambrose
===juleslab===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 1)}
#NPC:Jules_Neutral
{inTutorial: -> TutorialScold| }
{metJules: -> Questions|-> meetJules}

=meetJules
~metJules=true

    #speaker:Alistair
    #sprite:Alistair_Nervous
    "Jules? Is that you?"
    
    #speaker:Jules
    "Alistair!"
    "Alistair, you-"
    "You've been gone for so long."
    "Of all times, why are you back now?"
    
    #speaker:Alistair
    #sprite:Alistair_Confident
    "Well, it's quite a long story..."
    "But it's good to see you again!"
    
    #speaker:Jules
    "I'm sorry, it is good to see you too..."
    "Where have you been?"
    "You were gone for so long, we were all worried something had happened."
    
    +[Avoid the question] 
        #speaker:Alistair
        #sprite:Alistair_Embarassed
        "Oh I've been out and about."
        
        #speaker:Jules
        "Out and about? Why so coy Alistair?"
        
        #speaker:Alistair
        #sprite:Alistair_Nervous
        "It's... complicated."
        
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?)
        "I don't know what you could be talking about..."
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #speaker:Jules
        "You are too easy to read my friend." -> juleslab
    +[Adventuring] 
        #speaker:Alistair
        #sprite:Alistair_Embarassed
        "Oh I've been... adventuring."
        
         #speaker:Jules
        "Adventuring? Where? Why so coy Alistair?"
        
        #speaker:Alistair
        #sprite:Alistair_Nervous
        "It's... complicated."
        
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #speaker:Jules
        "You are too easy to read my friend." -> juleslab

=Questions
#speaker:Jules
"What can I help you with?"
    + {time == 3} [Booths?] ->fair
    + {time == 4} [What's new?] ->wedding
    + {time == 5} [Announcement?] ->disaster
    * {seenSpeech == true} {time == 5} [Practice address] ->fumbleword
    * {vaultDirector == true} [Help with vault?] ->vault
    * {seenElection == true} [Speech topics] ->topicschange
    * {seenElection == true} [Election] ->runfordirector
    * {julesRun == true} [Ego boost!] ->speechpeptalk
    + [Nothing for now]
    #speaker:Jules
    "Let's speak again soon, Alistair."
    ~ TOGGLE_SLIDER_INTERACTABLE(true)
    #NPC:None
    -> DONE

=fair
#speaker:Alistair
#sprite:Alistair_Neutral
"Jules, do you know anything about why all these people and booths are here...?"

#speaker:Jules
"Ah!"
"Yes, the lab is hosting the planet's annual HESF!"
"That is- the Higher Education Sceience Fair."
"It's exciting, isn't it?"
"There's so many fresh faces and new experiments all in one place."

#speaker:Alistair
"Do you have an experiment set up here?"

#speaker:Jules
"Of course!"
"Though I'm afriad it's a bit of a secret!"
"Perhaps I'll tell you about it another time."
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=wedding
#speaker:Alistair
"I just wanted to see if there was anything new."

#speaker:Jules
"Oh-"
"Actually, there is! Something quite new."
"Well..."
"Christa and I got engaged a few months ago."
"We're not quite sure on a date yet, but do you think you'll be on planet in few months?"
    
#speaker:Alistair
#sprite:Alistair_Nervous
(Oh no.)
(Curse these anchor points!)
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
    #speaker:Jules
    "It's alright, Alistair."
    "I know you're busy doing..."
    "Whatever it is you do out in the universe."
    "Just come back and visit us more often, alright?"
    
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "I-I will."
    "Thank you Jules..."
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=disaster
#speaker:Alistair
"Did you hear the announcement that the Director is giving?"

#speaker:Jules
"Yes..."
"It's very disturbing news."
"The core can no longer sustain itself, it's only a matter of time 'till it is destroyed and the planet with it."

#speaker:Alistair
#sprite:Alistair_Sad
"How much time does the planet have?"

#speaker:Jules
"Five years, give or take."
"It should be enough time to evacuate, but..."
"All of this will be gone."
"I just hope Crabb knows what he's doing."
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=vault
#speaker:Alistair
#sprite:Alistair_Nervous
"Jules, I was hoping to ask you something about the labratory's vault..."

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

#speaker:Jules
"Bennet is a stickler for rules."

#speaker:Alistair
#sprite:Alistair_Neutral
"So, I wanted to ask if you wanted to help me get into the vault."

#speaker:Jules
"Help you...?"
"Alistair, now you sound like you really are planning a heist."

#speaker:Alistair
"All I need is what's mine."

#speaker:Jules
"Alistair, only the Director can open the vault."
"Bennet has a device in his office to open the vault, a key."
"But, please, do not consider stealing it."

#speaker:Alistair
"I... Wasn't thinking that."

#speaker:Jules
"Good."
"Only the Director can open the vault, Alistair."
"But perhaps there is some paperwork you can fill out to get your belongings back."

#speaker:Alistair
#sprite:Alistair_Sad
"And get stuck in bureaucratic hell..."

#speaker:Jules
"Oh Alistair."
"I am sorry, I wish I could help you."

~PLAY_SOUND("event:/Character Barks/Darling/DarlingFrustrated")
#NPC:Darling_Upset
#speaker:D4RL1N6
"Do not give up yet Alistair."

#speaker:Alistair
"Of course."

#NPC:Darling_Neutral
#speaker:D4RL1N6
"I am sure that there are more options we have not explored. Keep searching."

{seenElection:
#speaker:Alistair
#sprite:Alistair_Confident
"I recall an election, perhaps we can find some leads there."
}

//~ TOGGLE_SLIDER_INTERACTABLE(true)
//#NPC:None
//#sprite:Alistair_Neutral
-> DONE

=runfordirector
~julesRun = true
#speaker:Alistair
"Jules, how often does the Director election process take place?"

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

#speaker:Jules
"Well..."
"Yes, it would be healthy for the lab to have some change in leadership."
"Bennet is quite stuck in his ways."
"He's just focused on keeping things as they are, a steady course neither up nor down."

#speaker:Alistair
#sprite:Alistair_Embarassed
"I think you should run against Bennet."

#speaker:Jules
#NPC:Jules_Nervous
"What-"
"Alistair!"
"I cannot run up against Bennet, I am much, much younger- I lack experience..."

#speaker:Alistair
"But you said so yourself that the lab needs some change in leadership."
"I'm sure you're not the only one with that sentiment."

#speaker:Jules
"Perhaps so- but..."
"Ahh... it is unlikely I would win. Even if the council does want Bennet gone."

#speaker:Alistair
#sprite:Alistair_Neutral
"What's the harm in trying? The election is still quite far away."

#speaker:Jules
"... Perhaps, I will think about it."
"But I do doubt I would have much success."
#NPC:Jules_Neutral
"That is quite far away, I'll think about it again once the time is nearer."
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=topicschange
#speaker:Alistair
#sprite:Alistair_Suspicious
"Jules, I was thinking, what sort of things do you think the people of Elore-Nabyke would like the Director to talk about?"

#speaker:Jules
#NPC:Jules_Nervous
"That's... a strange question."
"You usually don't care much for lab politics..."

#speaker:Alistair
#sprite:Alistair_Neutral
"Oh, but I'm just curious."
"I think that perhaps the people would like to hear an apology, you know?"

#speaker:Jules
"An apology about what...?"

#speaker:Alistair
"Oh- I mean, just for the lab to be more transparent with the people of the planet."
"Right now, the lab and the people feel very seperate, don't you think?"

#speaker:Jules
#NPC:Jules_Neutral
"Hm."
"I suppose so. I haven't thought of that."

#speaker:Alistair
"Just some food for thought."
~ speechImproved = true
~ helpComplete = helpComplete +1
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=fumbleword
#speaker:Alistair
#sprite:Alistair_Assured
"Jules..."
"This is sort of a strange question, but.
"What do you call the numbers and words that represent your home's location?"

#speaker:Jules
#NPC:Jules_Nervous
"... What-"
"Alistair, what are you talking about?"

#speaker:Alistair
"Just trust me Jules."

#speaker:Jules
"Okay..."
"An... Address?" 

#speaker:Alistair
#sprite:Alistair_Neutral
"Okay, good. Address. Let's practice saying it."

#speaker:Jules
"Alistair, are you okay? Did something happen...?"

#speaker:Alistair
"No, I just want to make sure you can say that word really well."
"I know that sounds strange, but just trust me. It'll make sense later."

#speaker:Jules
"Okay..."
#NPC:Jules_Neutral
"Address."

#speaker:Alistair
"And there's also 'address' as in, let's address this."

#speaker:Jules
"Address."
#NPC:Jules_Nervous
"Address?"

#speaker:Alistair
"Perfect."
~ helpComplete = helpComplete +1
~ addressFix = true
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE

=speechpeptalk
#speaker:Alistair
"You know, I think you would be a good Director."

#speaker:Jules
#NPC:Jules_Nervous
"Oh?"
"Really? Well, I'll run and try my best."
#NPC:Jules_Neutral
"But Crabb has been in the business so long, it's hard to imagine anyone but him being Director."

#speaker:Alistair
"Maybe."
"But you're smart, and you worry about things other than the lab's profit margins."
"You know, I don't think I've ever even seen Bennet in the market."

#speaker:Jules
"I've heard he hasn't left the lab grounds in years."

#speaker:Alistair
"See, this is why you'd be great as a Director."

#speaker:Jules
#NPC:Jules_Confident
"Thanks Alistair."
"I'll try my best."
~ helpComplete = helpComplete +1
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE


//Bennet Crabb
===directorlab===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 2)}
#NPC:Bennet_Neutral
{metDirector: -> Questions|-> meetDirector}

=meetDirector
~metDirector=true
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
"Of course. Alistair."
"I would have preferred to have forgotten that name, but it seems you have returned."
"Your poor disciplinary marks have most certainly not been forgotten."
    + [What marks?]
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "I'm-"
    "I'm not sure what you could be referencing, sir!"
    
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
    "Do not think that your return to the planet will secure you a position once again."
    
    #speaker:Alistair
    "Of course not sir."
    "I am... Just visiting."
    
    #speaker:Bennet
    "And visit you may."
    "Now, begone."
    "I have much work to attend to."
~CREATE_JOURNAL_OBJECT("Director", "Person", "The director of the lab. A stubborn old man that keeps private matters 100% private.", "Bennet Crabb is the current lab director, a man who keeps the lab on schedule and on task without outside intervention. He's cold and not very sweet to most, and has been director for an incredibly long time. If I can get his help or replace him, I may have a shot.")
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> END

=Questions
#speaker:Bennet
"What do you want?"
    + {time== 2} [Lab is busy?] -> Busylab
    + {time== 3} [Booths?] -> Booths
    + {time== 4} [Lots of work?] -> Notbusy
    * {seenPepTalk==true} [Enter vault?] -> VaultTalk
    + [Nothing for now]
        #speaker:Bennet
        "Yes, yes, begone. I am quite busy."
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
        #NPC:None
        -> END

=Busylab
#speaker:Alistair
#sprite:Alistair_Assured
"The lab seems busy today!"

#speaker:Bennet
"Yes, it's been quite busy for a few weeks now."
"Which is why I have very little time for idle chatter..."

#speaker:Alistair
#sprite:Alistair_Neutral
"Did something happen? Why is the lab so busy?"

#speaker:Bennet
"..."
"A Trade Seam to the Gold Belt opened up."
"Trade and artifacts are moving through the lab like water."
"Each artifact must be dated, catagorized, analyzed."
"And there are hundreds of cases on my desk now, so-"
"Begone."
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE


=Booths
#speaker:Alistair
"Any thoughts on the booths in the lab?"

#speaker:Bennet
"It is a neccesary distraction for now."
"It is a way for those interested in working for the lab in the future to show off their knowledge and ability."
"I have seen some promising experiments on display."
"But few will be able to reach the level of excellence we demand."

#speaker:Alistair
#sprite:Alistair_Sad
"I see."
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> DONE


=Notbusy
#speaker:Alistair
"Work in the lab seems pretty slow today."

#speaker:Bennet
"Indeed..."

#speaker:Alistair
"... What are you working on?"

#speaker:Bennet
"Nothing that concerns you."
"Details on the artifacts we work with are not discussed with civilans."

#speaker:Alistair
#sprite:Alistair_Embarassed
"But I'm not quite just a civilan, aren't I?"
"I worked here!"

#speaker:Bennet
"Not that it would matter, but you were a mere intern."
"Regardless, I refuse to break protocol for your curiosity..."
#NPC:None
-> DONE

=VaultTalk
#speaker:Alistair
"Hello doctor!"
"I wanted to inquire about, well..."
#sprite:Alistair_Embarassed
"I believe I misplaced some of my belongings before I left."

#speaker:Bennet
"Out with it, what do you want?"

#speaker:Alistair
"You see..."
"I left behind some of my belongings in the vault, but-"
#sprite:Alistair_Assured
"I really need them! You wouldn't mind just letting me into the vault for a moment would you?"

#speaker:Bennet
"That's preposterous."
"You are no longer employed here and you should know that civilians are strictly prohibited access to any of the vault’s highly classified materials."
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
        "Silence, I have already made my decision."
        "Begone now, I am incredibly occupied at the moment."
        
#speaker:Alistair
#sprite:Alistair_Sad
#NPC:None
(How infuriating!)
(Speaking to Bennet is like talking to a wall...)

~PLAY_SOUND("event:/Character Barks/Darling/DarlingFrustrated")
#speaker:D4RL1N6
#NPC:Darling_Annoyed
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
#NPC:Darling_Happy
"They may be able to help us or shed light on new information."

#speaker:Alistair
"Jules still works for the lab. We interned together."
"I left, but he stayed and got a full time job."
"He did always like the library in this place..."
"Perhaps he can help since we can't get through to Bennet."
~ vaultDirector = true
-> DONE


//Quest/Plot Knots
===OtherPlanetAnnounce===
~ TOGGLE_SLIDER_INTERACTABLE(false)
I move closer to the crowd to listen in.
A small projected version of the lab's Director, Bennet Crabb, stands on a pedastal in the center of the crowd.

#speaker:Bennet
#sprite:Director_Neutral
"In further announcements..."
"As some of you may have already heard..."
"Rumors have been circulating that the planet PLANETNAME has been destroyed under mysterious circumstances."
"However, it is best not to feed into gossip until we can determine what it was that caused this disaster."
"It is more than likely that the planet's core malfunctioned, which is a very rare occurance."
"There is no need to worry."
"Indeed. Next month, the lab will host a festival..."
-> LAB

===ScienceFair===
Booth upon booth line the lab's walls. 
Young and old scientists stand in front of their experiments to demonstrate their discoveries and to discuss with judges their findings.
I remember doing the same when I was a fresh intern.
-> LAB

===AnnounceDestruction===
~ TOGGLE_SLIDER_INTERACTABLE(false)
The Director's projected form stands tall over the group of people around him.
Everyone is silent, just looking up.

#speaker:Bennet
#NPC:Bennet_Neutral
"Ahem..."
"..."
"I am speaking to you all, the entire planet of Elore-Nabyke, to make an announcement."
"An announcement of a recent discovery."
"..."
"It is no secret that our planet's core is a mechanical thing prone to wear and tear. 
"We at the lab take great care in maintaining the core with the goal of extending the life of our planet by some 50 to 100 years."
"But."
"It was discovered this morning that the core has taken on more damages than we had anticipated."
"The damage to the core is... Mysterious in nature."
"We do not know where it originated, though we are investigating."
"It is with my..."
"Deepest regret that I must announce that the planet will be inhabitable in 5 years time and subsequently destroyed."

The lab employees are silent but a few dip their heads.

#speaker:Alistair
#sprite:Alistair_Suspicious
(I wonder how many already knew of this?)
-> LAB

===Congratsparty===
#speaker:
Beyond the lab's foyer, groups of people crowd into the Director's office.
Jules' office.
The room is packed with people from the city and lab employees, but within the center of the crowd, I find Jules.
    + [Speak to Jules] -> Julestalk
    + [Leave for now] -> LAB

=Julestalk
#speaker:Jules
//NPC happy Jules
"Alistair! You're here!"

#speaker:Alistair
//sprite embarrassed/happy
"Of course, I wouldn't miss your congrats party."

#speaker:Jules
//NPC Jules happy said
"Thank you, Alistair."
"I couldn't have done it without you."
"..."
//NPC Jules somber
"... Regardless, enjoy yourself. There's a snack tray somewhere around here and something to drink."

#speaker:Alistair
//SPRITE embarrassed
"Well..."
    + [Time to talk?]
    #speaker:Alistair
    "I was actually wondering if you had some time to talk."
    
    #speaker:Jules
    //NPC sus
    "Oh? What about?"
    
    #speaker:Alistair
    //SPRITE sadd
    "Uh."
    "It might be best if we speak in private..."
    
    #speaker:Jules
    "I see."
    + [Have to talk privately]
    #speaker:Alistair
    "I have to talk to you, Jules, in private."
    
    #speaker: Jules
    "Oh? Why so mysterious?"
    
    #speaker:Alistair
    "I'll explain, but not where there are prying eyes."
    
    #speaker:Jules
    "I see."
    -
    -> Ending

===Ending===
//SETTING BACKGROUND TO VAULT
#NPC:Jules
#speaker:Jules
"The vault?"
"I suppose this place is private enough."
"What did you want to talk about Alistair?"

#sprite:ALISTAIRSPRITE
#speaker:Alistair
"Actually, it has to do with the vault..."

#NPC:Jules
#speaker:Jules
"Oh?"

#sprite:ALISTAIRSPRITE
#speaker:Alistair
"I'm..."
"Well, I forgot something in the vault."
"I left it on accident and I just really need it back."
"So..."

#NPC:Jules
#speaker:Jules
"You want me to open the vault?"

#sprite:ALISTAIRSPRITE
#speaker:Alistair
"Yes."
"And I know it's against protocol-"
"But I really need what I left in there."

#NPC:Jules
#speaker:Jules
"What did you leave behind?"

#sprite:ALISTAIRSPRITE
#speaker:Alistair
"I..."
    + [Something?]
    #speaker:Alistair
    "Uh."
    "Something?"
    + [Research notes]
    #speaker:Alistair
    "Some of my old research notes."
    
    #speaker:Jules
    "Notes on what?"
    - 
    #sprite:ALISTAIRSPRITE
    #speaker:Alistair
    "..."
    "I'm sorry, Jules, I can't tell you."
    "But you just have to trust me."

#speaker:Jules
#NPC:Jules
"..."
"I must admit."
"You've been acting very suspicious lately, Alistair."
"Beyond this..."
"Breach of protocol,"
"You've helped me in such specific ways."

#speaker:Alistair
#sprite:ALISTAIRSPRITE
(Does he suspect me?)
    + [Don't know what you mean]
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "I don't know what you could be talking about..."
    + [Just trust me]
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "Please Jules."
    "Just trust me."
    -
    #speaker:Jules
    #NPC:Jules
    "Alistair."
    "Did you help me get elected just to open the vault for you?"
    
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "Wha-"
    "No, Jules, that's not it at all!"
    "I just wanted to help out my friend."
    
    #speaker:Jules
    #NPC:Jules
    "That is a relief to hear..."
    "I am sorry for even suggesting such a thing."
    "You've just acted..."
    "A bit off since you've returned."
    "It's very troubling."
    
    + [Nothing to worry about]
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "I am sorry Jules."
    "But I assure you, you don't have to worry about little old me."
    + [Can explain in time]
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "I am sorry Jules."
    "Perhaps in time I can explain but..."
    "Not yet."
    -
    #speaker:Jules
    #NPC:Jules
    "I understand..."
    "But, you know you can tell me anything Alistair?"
    "You've done me a great service, I want to be able to help you."
    "Now and in the future."
    
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "Thank you Jules..."
    
    #speaker:Jules
    #NPC:Jules
    "Now, let me get that vault open for you."
    "Don't act so surprised!"
    "You know I've never been a stickler for rules!"
    
    #speaker:
    Jules opens the vault with a simple turning of dials and circles.
    As the vault door opens, I rush inside.
    My cubby is just as I left it.
    Inside, I find the plaque and my notebook.
    Jules waits at the door, but there is hardly time for goodbyes.
    
    #speaker:D4RL1N6
    #NPC:Darling
    "We should return to the ship, Alistair."
    "You can return for goodbyes in another time."
    
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "I know..."
    "Let's return then."
    
    #speaker:D4RL1N6
    #NPC:Darling
    "Ready?"
    
    #speaker:Alistair
    #sprite:ALISTAIRSPRITE
    "Let's go."

//visual effect?
//background change
#speaker:
A flash falls over my eyes and I see the familiar hull of my ship all around me.
It feels like it's been years.
As I slump back in my ship, I hold the plaque in my lap.
The words engraved into the metal are bareily legible.
(Could he even read this now?)
(Perhaps it was never meant to be...)
(...)
(Maybe it doesn't matter.)
(Perhaps remembering him will be enough.)
//FADE TO BLACK
-> Teaser

===Teaser===
//black background
#speaker:???
"Ugh..."
"My head flipping hurts..."
//cuss word that's specific to Chronautical
//background change

#speaker:Jack
#sprite:JACKSPRITE
"Where am I...?"

(I'm in the Doc's clinic!)
(I guess I must have really gotten smacked hard.)

Beside my cot, I see some unusal items.
The ship mini.
The funking looking gadget.
The plaque.
And the notebook.

(But those are his things?)
(If those are here,)
(Then where the hell is Alistair!)
//is hell gucci?
//FADE TO BLACK
-> END
//Send back to main menu scene?

===MARKETPLACE===
~ TOGGLE_SLIDER_INTERACTABLE(false)
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
        - 9:    Atmos vessels rest in and near the marketplace as lines of people make their way onto them. Most everyone has a suitcase and a somber expresion as they wait to board.
            -> END
        - 10:   A once large marketplace has now been replaced with empty, collapsing stalls and overgrown walkways. The stench of smoke fills the market. Some shops crumble as the planet shutters violently.
            -> END
        }
        //-> marketplace
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
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
- 9:    Atmos vessels rest in and near the marketplace as lines of people make their way onto them. Most everyone has a suitcase and a somber expresion as they wait to board.
            -> END
- 10:   A once large marketplace has now been replaced with empty, collapsing stalls and overgrown walkways. The stench of smoke fills the market. Some shops crumble as the planet shutters violently.
            -> END

}
-> END
//NPC Convos

//Jules Ambrose
===julesmarketplace===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 1)}
#NPC:Jules_Neutral
{metJules: -> Questions| -> meetJules}

=meetJules
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
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #speaker:Jules
        "You are too easy to read my friend." -> julesmarketplace
    +[Adventuring] 
        
        #speaker:Alistair
        "Oh I've been... adventuring."
        
         #speaker:Jules
        "Adventuring? Why so coy Alistair?"
        
        #speaker:Alistair
        "It's... complicated."
        
        #speaker:Jules
        "I see." 
        "What's his name then?"
        
        #speaker:Alistair
        "Wha-"
        (How'd he guess that?!)
        "I don't know what you could be talking about..."
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #speaker:Jules
        "You are too easy to read my friend." -> julesmarketplace

=Questions
#speaker:Jules
#NPC:Jules_Neutral
"What can I help you with?"
+ {time == 2} [Busy?] ->Busy
+ {time == 8} [You okay?] ->Okay
+ {time == 9} [Heading out?] ->Heading
+ [Nothing for now]
    #speaker:Jules
    "Let's speak again soon, Alistair."
    ~ TOGGLE_SLIDER_INTERACTABLE(true)
    #speaker: 
    #NPC:None
    -> DONE

=Busy
#speaker:Alistair
"Sure is busy, huh? I would have expected you to be in the lab with all this going on."

#speaker:Jules
"Ah, well, I'm still doing lab work. I've been tasked with making sure artifacts that need to be examined, well, end up getting examined."
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
    "Ha ha... Yeah, I suppose being frugal is a virtue."
    (Never see the light of day, huh?)
    (... So much will be lost...)
        -> Questions
    
+ [You sure are dilligent] 
    #speaker:Alistair
    "You're quite the hard worker, to do all this. It's always been impressive."
    
    #speaker:Jules
    "Flattery won't get you anywhere, old friend."
    "Especially not to where you can get your hands on these very interesting and breakable artifacts."
    
    #speaker:Alistair
    I scoff in an exaggerated manner.
    "Jules! You wound me! Me, messing with artifacts, perish the thought!"
    "...I meant it, though. I've been hard at work lately, and it's been encouraging to see I'm not the only one."
    
    #speaker:Jules
    "Well then, thank you, Alistair. I wish you luck."
    "Now if you'll excuse me, I really must be going."
    "These boxes won't label themselves!"
        -> Questions

=Okay
#speaker:Alistair
    "Jules! Are you alright?"
    "You seem... Not all yourself."
    
#speaker:Jules
    "Alistair..."
    "It's just... The lives of all these people, laid out to be pawned off."
    "I came to see what I could possibly get for Christa and myself, but..."
    "Seeing it all just... It's all suddenly hit me."
    
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
    "Wait... You are going to leave as well, correct? Why aren't you in line?"
    
#speaker:Alistair
    (Ah... That's right, it does seem strange. Hm.)
    + [Private ship]
        #speaker:Alistair
        "I actually... acquired my own vessel. It's parked not too far from here."
        "The Solar Winds. A fine ship."
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
    (And I hope this is a promise I won't break...)
    
-> Questions


//Uriah Bramble
===shopownermarketplace===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 3)}
#NPC:Uriah_Neutral
{metShopowner: -> Questions| -> meetShopowner}

=meetShopowner
~metShopowner = true
#speaker:Alistair
"Hello there, shopkeep."
"I was wondering if I could perchance peruse your wares, and perhaps be made aware of any local news, as well."
I glance at their nametag. 'Uriah Bramble.' They greet me with a warm smile.

#speaker:Uriah
"Why of course, sir! I carry a wide variety of wares, feel free to take a look."
"Are you from around here?"

#speaker:Alistair
"I used to be. Hoping to catch up on what I've missed."

#speaker: Uriah
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
"Come back anytime!"
-> END

=Souvenirs
#speaker: Alistair
"I've noticed you're selling some souvenirs."
"Understandable, considering the crowd."

#speaker:Uriah
"Indeed. All these foreign scholars are here to see the experiments being shown off at the lab."
"It's the perfect oppotunity for them to scout some talent."
"Also a good opportunity for the scientists to get noticed."

#speaker:Alistair
"Selling special drinks?"
+ [Those must sell well]
        #speaker:Alistair
        "Elore-Nabyke is known for its drinks, right?"
        "I'm sure people from off-planet find them delightful."
+ [Are they interested in something like that?]
        #speaker:Alistair
        "I feel like the scholarly sort wouldn't be interested."
        "Are you making any sales?"
    -
    
#speaker:Uriah
"Of course! The drinks of Elore-Nabyke are universe-renowned."
"Our method of bubbling, our colors..."
"Perhaps you'd care for one?"

#speaker:Alistair
"I'm unfortunately low on funds at the moment. Sorry."

#speaker:Uriah
"No worries, have a nice day!"

-> Questions

=New
#speaker: Alistair
"Anything new going on?"
"It seems quite calm."

#speaker:Uriah
"Indeed. Last year was busier, but this is normal."
"A good amount of business."
"Oh! That's right!"
"I believe I heard the library's rennovations are nearly complete, or at least they should be by next year."

#speaker:Alistair
"Perhaps I'll take a look, then."
"Thank you for your time."

#speaker:Uriah
"Of course. Have a nice day!"

-> Questions

=Announcement
#speaker: Alistair
"I assume you've heard the announcement."
"What are you going to do?"
"It's a pretty grim verdict."

#speaker:Uriah
"Well, we've always handled whatever has come our way."
"It's... Heartbreaking, but we'll find a way past it."

#speaker:Alistair
+ ["We?"]
        #speaker:Alistair
        "You said 'we,' did you mean the people of Elore-Nabyke?"
+ [Even through the planet dying?]
        #speaker:Alistair
        "The planet will be destroyed."
        "How can that be overcome?"
        (Perhaps they can give me some advice...)
    -

#speaker:Uriah
"My family lives on-planet."
"Though I'm often out and about travelling the trade seams or here at the market, I'd do anythign it takes to provide for them."
"That's my priority, my loved ones."

#speaker:Alistair
"I see. That's very noble of you."
"And... Encouraging. Thank you, I think I feel a bit better now."
(That's right. He needs my treasure. That's why I'm doing this.)

#speaker:Uriah
"You're quite welcome. I hope you have a good rest of your day."

-> Questions

=Gossip
#speaker: Alistair
"Heard anything interesting lately?"
"It seems everyone here today is rather talkative."

#speaker:Uriah
"Indeed. Though I wish they'd do a bit more shopping."
"You would think planning for the future would entail getting supplies."

#speaker: Alistair
"What would people need suplies for?"

#speaker:Uriah
"I heard that the evacuation is going to happen in just a couple years."
"Atmos vessels are nice and all, but I know I for one would like to have a travel bag."

#speaker:Alistair
+ [What else about the evacuation?]
        #speaker:Alistair
        "Is there anything else you know about the evacuation?
+ [Any other news?]
        #speaker:Alistair
        "Have you heard any other news?
    -

#speaker:Uriah
"There's been talk about the lab director election."
"People have been saying how the lab organizing the evacuation should have taken precedence."
"Though the evacutaion was probably how the director managed to get elected. Makes a strong campaign platform."

#speaker:Alistair
"I suppose those two events are linked."
"Well, I'll leave you to it."

#speaker:Uriah
"Thank you, have a nice day!"

-> Questions

=Preparing
#speaker: Alistair
"You're still running the store?"
"Shouldn't you be preparing to leave?"

#speaker:Uriah
"I am. A number of the items on sale are my family's old possesions."
"It's a shame to see them go, but we can't take things like furniture with us."
"I also get to keep an eye for any good things being put on sale."

#speaker:Alistair
+ [Gotten anything good?]
        #speaker:Alistair
        "I see, that's a smart way of looking at it."
        "Have you managed to find anything of value?"
+ [Isn't it all just junk though?]
        #speaker:Alistair
        "Isn't everything being put up for sale for the same reason?"
        "If they're not willing or able to bring it with, how does that change if you have it?"
    -

#speaker:Uriah
"One person's trash is another one's treasure."
"I managed to get something special. A large blanket."
"People travelling by themselves have no need for something so bulky."
"But I'll be with my family."
"I'm planning on using it for us to sit on, or to huddle together."
"It's good quality fabric, too. It was quite a bargain!"

#speaker:Alistair
"That's... Lovely."
(I could use some of that optimism.)
"I wish you nothing but the best."

#speaker:Uriah
"Thank you, sir. I just realized, I never caught your name?"

#speaker:Alistair
"It's Alistair."

#speaker:Uriah
"Well then, have a nice day, Alistair!"

#speaker:Alistair
"You too."

-> Questions


//Temperance Ward
===childmarketplace===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 4)}
~PLAY_SOUND("event:/Character Barks/Temperance/child-greeting")
{metChild: -> Questions| -> meetChild}

=meetChild
#speaker:Alistair
    "Hello there! What's your name?"
    
    #speaker:Temperance
    #NPC:Temperance_Neutral
    "...Temperance."
    
    #speaker:Alistair
    "Oh, well..."
    "My name is Alistair!"
    
    #speaker:Temperance
    "..."
    
    #speaker:Alistair
    "You... doing alright?"
    
    ~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
    #speaker:Temperance
    "I'm fine."
    ~metChild = true
    ~CREATE_JOURNAL_OBJECT("Child", "Person", "A young child who wishes to work in the lab one day. Her parents are leaving the planet with her early.", "Temperance Ward is her full name, a young person who always seems to speak her mind regardless of situation. She wishes to work at the lab, but that's nothing but a pipe dream now.")
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
    #speaker:Temperance
    "Fine."
    -> DONE

=Story
#speaker:Alistair
"Do you like the story? She's such a good speaker, isn't she?"
"You shouldn't take her too seriously, though."

~PLAY_SOUND("event:/Character Barks/Temperance/child-fearful")
#speaker:Temperance
"..."

#speaker:Alistair
"I'm a fan of the story."
"Though it does go against the lab's observations, it-"

~PLAY_SOUND("event:/Character Barks/Temperance/child-surprised")
#speaker:Temperance
#NPC:Temperance_Confident
"You work in the lab, mister? Really? What's it like?"

#speaker:Alistair
"Ah, er..."
(She suddenly opened up! What now...)
+ [Yes. I work at the lab. Definitely]
        #speaker:Alistair
        "Yes! I mean, yes. I do. Been there awhile."
        "I get to see all the cool things they have."
        "Access to the vault and everything."
        (I wish.)
+ [Not anymore, but I used to]
        #speaker:Alistair
        "Oh, well, not anymore. I had to leave and head elsewhere for a while."
        "But I worked under Director Crabb, and alongside a good friend of mine."
        "So I'm still in the lab's good graces."
        (Or at least Jules'. I doubt Crabb wants to see my face.)
    -
    
~PLAY_SOUND("event:/Character Barks/Temperance/child-happy")
#speaker:Temperance
"Wow... I wish I could work in the lab, too!"
"They know so many cool things!"
"It's my dream."

#speaker:Alistair
(Urgh. Curses. Good going Alistair, you've runied a child's dream.)
"Well... work hard and I'm sure you'll make it."

~PLAY_SOUND("event:/Character Barks/Temperance/child-happy")
#speaker:Temperance
"Thanks, mister! I will!"

-> Questions

=Exciting
#speaker:Alistair
"Woah there! You seem excited."
"There are some delicate goods being handled, don't bump into anyone."

~PLAY_SOUND("event:/Character Barks/Temperance/child-fearful")
#speaker:Temperance
#NPC:Temperance_Neutral
"Oh! Um, sorry mister."

#speaker:Alistair
"And steer especially clear of the lab workers."
"Some of those artifacts cannot be replaced."

~PLAY_SOUND("event:/Character Barks/Temperance/child-happy")
#speaker:Temperance
"Ah! But... That stuff's so cool! I wanna see it!"
#NPC:Temperance_Confident
"All that lab stuff is so cool."

#speaker:Alistair
+ [They do a bunch of boring stuff too, though]
        #speaker:Alistair
        "Well, I'm glad you're excited."
        "However, it's not just holding cool devices."
        "They do a lot of boring research and tests, too."
        "And they have lots of regulations."
+ [It really is the coolest]
        #speaker:Alistair
        "Yeah. Those folks at the lab work really hard."
        "They really are cool. They do groundbreaking research every day. They change the world."
        (...Not always for the better, in my case.)
    -
    
#speaker:Temperance
#NPC:Temperance_Neutral
"Some other kids think it's boring, but I think that reserch stuff is the best part."
"It's fun to know things."

#speaker:Alistair
"That's a wonderful mindset you have there."
"You should check out the showcae they're having next year."
"Lots of interesting topics there."

~PLAY_SOUND("event:/Character Barks/Temperance/child-surprised")
#speaker:Temperance
"Really? I will!"

-> Questions

=Listening
#speaker:Alistair
"Listening to the storyteller?"
"I would have expected you to be more interested in the lab showcase."

#speaker:Temperance
#NPC:Temperance_Confident
"I already looked at all that stuff."
~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
"All the lab people are busy talking to a bunch of snooty people."
#NPC:Temperance_Neutral
"Some man in a top hat shooed me away."

#speaker:Alistair
"So you're here listening to her?"
+ [She doesn't trust the lab at all]
        #speaker:Alistair
        "She doesn't believe in the lab or any of the workers."
        "Most of her 'stories' are wild rumors."
+ [She does perform for anyone]
        #speaker:Alistair
        "I suppose she does have certain charm in that she doesn't discriminate."
    -
    
#speaker:Temperance
"I know she says different things than the lab people..."
"But it's interesting. It's new."
"I like fantasy stuff too, y'know."

#speaker:Alistair
"Fair enough. Well, enjoy."

#speaker:Temperance
"Mhm."

-> Questions

=Wrong
#speaker:Alistair
"Hey, what's wrong?"

~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
#speaker:Temperance
"Hmph. What makes you think something's wrong?"

#speaker:Alistair
(Hm. Seems she's in her rebellious phase. Nothing I can't handle.)
"Well, you just seem a bit unenergetic."
"The results of the election for lab director's still hot news."
"I figured it'd be something to be excited about."

#speaker:Temperance
"The lab director?"
~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
"What does it matter anyway."

#speaker:Alistair
(Uh oh.)
+ [Did you want someone else to win?]
        #speaker:Alistair
        "Are you unsatisfied with the election results?"
        "Even if you are there's always..."
        "..."
        "There will be a next time."
+ [Is it about the planet?]
        #speaker:Alistair
        "Do you say that because the planet is dying?"
        "Even if we loose the physical lab, the people will live."
        "The research they've done will persist."
        "Knowledge doesn't die."
    -
    
#speaker:Temperance
"Yeah right."
~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
"Look mister, Those lab people, with all their fancy equipment, couldn't even notice the planet's core dying."
#NPC:Temperance-teen_Distant
"And now we just have to run away?"
"That'll always be the the same, I've realized."
~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
"They're not willing to fight for it. Not willing to change."

#speaker:Alistair
"You should know that their instruments are finely tuned."
"The planet will barely last three years."
"That's not enough time. People's lives are more important!"

~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
#speaker:Temperance
#NPC:Temperance-teen_Neutral
"They could at least try."

#speaker:Alistair
"They are."

#speaker:Temperance
"Whatever."

-> Questions

=Careful
#speaker:Alistair
"Be careful there!"
"You could've knocked him over."

#speaker:Temperance
"-erves it..."

#speaker:Alistair
"What was that?"

~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
#speaker:Temperance
"I said he probably deserves it!"
"He works at the lab, but he's here just wasting time?"
"He should be there! Fixing things!"

#speaker:Alistair
"You-! Mmph..."
(Breathe, Alistair. Breathe.)
(I'm letting my friendship with Jules make this personal.)
"I uderstand that you're upset."
+ [But there's nothing he can do]
        #speaker:Alistair
        "He's just a man."
        "Struggling for years on end against a monumental problem."
        "One laboratory against the weight of a world."
        "It hasn't been enough."
        "Sometimes... Things are just out of someone's hands."
        "When that time comes we should be there to support them."
        "They can't handle another enemy."
+ [But lashing out won't fix things]
        #speaker:Alistair
        "You can't take out your feelings on him."
        "He's probably been working harder than anyone."
        "He has a life, a family. He wants the best for the planet."
        "The people in the lab are the ones closest to this issue."
        "It's... Infuriating."
        "To be so close to fixing something and to... To..."
        "Not be able to fix it."
        "..."
        "We should be supporting each other in times like this."
    -
    
~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
#speaker:Temperance
#Child-teen_Distant
"...But..."
"...Then who'll support me?"
"I don't want the planet to die."
"What about my feelings?"

#speaker:Alistair
"We support each other. If you reach out a hand, you'll be offered a hand back."
"There are always people who will care about you."

#speaker:Temperance
"..."
"Do you... Care?"

#speaker:Alistair
"Yes."

#speaker:Temperance
"..."
#NPC:Temperance-teen_Neutral
~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
"Thanks, mister. Alistair."

#speaker:Alistair
"Take care."
(I'm... So sorry.)

-> Questions


//Miriam Harcourt
===oldladymarketplace===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 5)}
{metOldlady: -> Questions| -> meetOldlady}

=meetOldlady
~metOldlady = true
#speaker:Alistair
#NPC:Miriam_Neutral
"Hello, ma'am. I couldn't help but notice, you appear to be a storyteller of sorts. Could you-"

#speaker:Storyteller
"Storyteller? My dear boy, I am no mere storyteller, I am a purveyor of truth!"
#speaker:Miriam
"They all doubt old Miriam, but they'll soon see!"
"The dissapearance of Xitis is a sign of things to come!"

#speaker:Alistair
(Ah yes... Miriam.)
(A bit of a crackpot, but she's still knowledgeable.)
"Ah, I see.. Well, I'm sorry if I seemed doubtful of you."
+ [I'm interested in stories]
        #speaker:Alistair
        "I merely thought you may have tales worth hearing."
        "Even stories can hold some truth."
+ [I'm looking for truth]
        #speaker:Alistair
        "Truth can sometimes be stranger than fiction."
        "I thought you may be able to tell me something I wouldn't be able to find elsewhere"
    -
#speaker:Miriam
"Then you've come to the right place!"
"I assure you, I know what they wish I did not!"
~CREATE_JOURNAL_OBJECT("Storyteller", "Person", "An old woman who always has an interesting story to tell.", "Full name Miriam Harcourt, she's a local who often tells stories to anyone willing to approach her. However they seem to be nothing more than fantasy, even if she claims they're truthful.")
-> oldladymarketplace

=Questions
#speaker:Miriam
#NPC:Miriam_Neutral
"What curiosity do you hold, young man? I have all the answers!"
//12345
+ {time == 1} [Dissapearance of Xitis?] ->Dissapearance
+ {time == 2} [Busy day?] ->Busy
+ {time == 3} [Can't get a crowd?] ->Crowd
+ {time == 4} [Who are you talking to?] ->Who
+ {time == 5} [About the announcement...] ->Announcement
+ [Nothing for now]
#speaker:Miriam
"Whenever you seek truth, just find me again." 
-> END

=Dissapearance
#speaker:Alistair
"I think I overheard you say somethig about Xitis... Dissapearing?"
"The Director said it was destroyed."

#speaker:Miriam
"Aha! That's what they want you to think!"
"You see, Xitis was not destroyed, but lost! Lost in the cosmic web!"
"The Strings that connect our vast universe are deeper than you could ever imagine..."
"So deep, even a planet could be swallowed up, lost in the space between spaces!"
"Not even the most travelled trade seams are truly safe..."

#speaker:Alistair
(She's not... Entirely incorrect.)
(Maybe Xitis's been thrown off by what's happening here?)
(Focus, Alistair. You can't chase every loose end, not now at least.)

#speaker Miriam
"Oh? Has the truth rendered you speechless?"

#speaker:Alistair
"Ah, I'm sorry..."
+ [Just lost in thought]
        #speaker:Alistair
        "I'm just lost in my own thoughts, I'm sorry."
        "I find myself questioning the decisions I've made..."
+ [I'm awed by your words]
        #speaker:Alistair
        "I'm simply rattled by such a possibility...:
        "Truly, you have opened my eyes."
    -

#speaker:Miriam
"I'm glad someone here has the sense to listen!"
-> Questions

=Busy
#speaker:Alistair
"Hello there! A busy day, isn't it?"

#speaker:Miriam
"Busy! Well! Try frusterating! I can hardly think with all this racket."
"How am I supposed to spread truth like this? A sudden boom of products and everyone seems content to ignore the big picture..."

#speaker:Alistair
"Well..."
+ [It's understandable]
        #speaker:Alistair
        "Surely you understand the people's excitement?"
        "There are many unique artifacts being imported."
        "Who wouldn't be giddy to see it all?"
+ [I'm here, I could listen]
        #speaker:Alistair
        "You're not entirely ingnored."
        "Why, here I am. Why don't you tell me a tale?"
-

#speaker Miriam
"Oh? Then let me tell you, these boubles are just a taste of the true wonders those lab people wish to obtain."
"Have you every heard of the Inventor? A true miracle worker!"
"Wars have been fought over their inventions..."
"A disk that makes machines work as if they were new!"
"A ring entirely impervious to harm!"
"But the Inventor never seems to stay in one place..."
"It's almost as if they are a ghost from the far future!"

#speaker:Alistair
"Ah... Well, er, that's very interesting."
(The future? More like a ghost from a very dark past...)
"I'm sure the Director would have a field day with those sorts of devices."

#speaker:Miriam
"Hah! As if they could handle it."
"Mark my words, grand things are coming. Grand things..."
-> Questions

=Crowd
#speaker:Alistair
"What a crowd! And so many from off planet, seeing the sights."
"I think you'll have trouble getting an audience today."

#speaker:Miriam
"That's just it! I must warn them of the danger!"
"Out there, travelling from planet to planet..."
"The Sirens coud lead them Adrift!"

#speaker:Alistair
(She gets crazier and crazier by the day...)
(But I should humor her, in the off chance something could be useful for me... Or for... Him.)
+ [Sirens?]
        #speaker:Alistair
        "Sirens? You mean like alarms?"
        "How would that lead anyone Adrift?"
        
+ [Adrift?]
        #speaker:Alistair
        "Adrift, as in lost?"
        "These people take secure seams, they would have no chance of ending up somewhere other than their destination."
-

#speaker:Miriam
"The Sirens mimic the sounds of ships in distress!"
"They lure others away from safety, into the horrors of a raw string!"
"The crew hears their dying words on repeat.."
"Before the vessel gets pushed to the edge of the universe, devoid of life."
"Or worse, becomes a ghost ship!"
"These dire warnings must be heeded!"

#speaker:Alistair
(What a wild rumor. Although...)
"I see. Well, I'll be extra careful when I travel from now on, and I'll be sure to pass your advice on."

#speaker:Miriam
"That would do my heart good, my boy, knowing you are safe."
"And that you keep your eyes open to the truth beneath the lies fed to us by those on high!"

#speaker:Alistair
"..."
"I'm glad you have my best interests in mind."
-> Questions

=Who
#speaker:Alistair
"Er... Pardon the interruption, but who are you speaking to?"
"You appear to not have an audience today."
"And there isn't really anyone else."

#speaker:Miriam
"Ah, but my boy, you're here, yes? Here, at this intersection of fate."
"There are grand things about, grand things, oh so grand."
"Have you heard it?"

#speaker:Alistair
(Uh oh.)
+ [I haven't...?]
        #speaker:Alistair
        "I can't say that I have."
        "Well, I've heard a great many things, but somehow I doubt I've heard what it is you're referring to."
        
+ [I have...?]
        #speaker:Alistair
        "I certainly get around to many places, and hear many things."
        "I think I may know what you mean."
        (Hopefully she bought that.)
-

#speaker:Miriam
"The cries of the void."

#speaker:Alistair
"Ah. Yes. The cries."

#speaker:Miriam
"We are on the cusp of a great transition."
"The cold maw of space yawns wide for us"
"And I can hear it. I hear it because I listen."
"So I'm here, telling to anyone who is not so fortunate as I."

#speaker:Alistair
"I..."
(She's not far off. Is it just intuition? Or something more?)
(Perhaps it is fate.)
(Fate? No. I... I can change this. I can fix it.)
(But if I can't...)
(I must get my treasure to him.)
"Thank you. Miriam."
She doesn't respond, just nods and turns away.
-> Questions

=Announcement
#speaker:Alistair
"Miriam. I assume you've heard the announcement."

#speaker:Miriam
"Yes. The time has come."

#speaker:Alistair
"What are you going to do?"
"I mean, besides evacuate."

#speaker:Miriam
"I knew it. I knew it all along. That those lab folk were hiding something."

#speaker:Alistair
"I... Don't think it's their fault."

#speaker:Miriam
"Elor-Nabyke will become lost in the folds of reality."
"All so those fools can claim their ill-gotten gains."
"I must prepare to spread the truth."

#speaker:Alistair
"What do you mean?"
"The Director said the planet would be destroyed."

#speaker:Miriam
"It's just like Xitis all over again." 
"Doesn't anyone see? It's a pattern! A plot!"

#speaker:Alistair
(Curses! I can't contradict her without revealing too much!)
"Please, don't do anything crazy."
She begins muttering to herself incoherently, no longer acknowledging my presence.

#speaker:Alistair
(Curses.)
"I'll... See you around."

-> Questions


