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




//If the player has seen the beginning, skip beginning knot
=== SeeBeginning ===
{seenBeginning: -> library|-> beginning}

//Content knots start
===beginning===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
~PLAY_MUSIC("event:/Music/Prologue Music")
~PLAY_AMBIENCE("event:/Sound/Ambience/Prologue Ambience")
~ time = 10
~ seenBeginning = true
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

//#speaker:Alistair
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
//->END
//Somehow transition so that new knot runs when time is set to 9
//elp, way to pause and resume script under certain variables?
//=tutorial
#speaker:Alistair
"Perhaps now we can find a way into the vault."

#speaker:D4RL1N6
"It seems that even without the fire the vault can not be opened." 
"We need a code."
"But, we now have valuable information we can put in the journal."
//Cue journal flashing
//Will later need to make addition that mentions player writing their own notes in the journal
~TOGGLE_JOURNAL(true)
~CREATE_JOURNAL_OBJECT("D4RL1N6", "Person", "My robot companion that helps to keep me on task.", "I built D4RL1N6 myself, and he's quickly become one of my best friends as he keeps me company when no one else will.")
~CREATE_TIMELINE_CLUE("End of beginning", "placeclue", "No way to save the planet.", "All of my attempts have failed to save Elore-Nabyke. I have to retrieve what's in the vault instead.")
~TOGGLE_SLIDER(true)
//Once inside Journal

#speaker:D4RL1N6
"Maybe there are other people in different places or times that could help us."
//Cue minimap flash
//Pause
#speaker:D4RL1N6
"This is the end of the safety protocol."

#speaker:Alistair
"Thank you."
"Now, I'd better find someway into this vault..."
//Tutorial end
-> library


===library===
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
//What should I do?
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
        //check
/*
    //NPC Description for player and variable changes
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
        - 6:    There are hundreds of people stuffed into the library, all listening intently to the dozen board members speaking at the front of the room. It would be impossible for me to get a word in. 
                +Listen in->Election
        - 7:    Jules stands alone in the center of the room with his hands behind his back as he looks at the spines of books on the shelves.
                ~julesPresent = true
                ~noNPCS = false
        - 8:    I see a teen sitting at one of the reading desks with their head in their hands. They don't notice me.
                ~noNPCS=true
        - 9:    There's not a soul in sight.
                ~noNPCS=true
        - 10:   There's not a soul in sight.
                ~noNPCS=true
        }
        -> NPCS

//Sets what NPCs are choices
===NPCS===
{noNPCS:
    There is no one to talk to at this time. -> END
  - else:
  //~ TOGGLE_SLIDER_INTERACTABLE(false)
    Who should I talk to? 
    +{julesPresent} [Jules] -> JULES
    +{childPresent} [Temperance] -> CHILD
    + [Don't talk to anyone]
    //~ TOGGLE_SLIDER_INTERACTABLE(true)
    -> END
}
*/




//NPC Convos

//Jules Ambrose
===JULES===
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
        "Ha! You are too easy to read my friend." -> JULES
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
        "Ha! You are too easy to read my friend." -> JULES
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
        "... That's a good thing, Alistair. Don’t ever lose your sense of wonder, that adventurous spirit of yours."
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
===CHILD===
//~ TOGGLE_SLIDER_INTERACTABLE(false)
~SET_PARAMETER("PrologueCharacters", 4)
~PLAY_SOUND("event:/Character Barks/Temperance/child-greeting")
#NPC:Child_Neutral
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
-> CHILD

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
        #speaker:Child
        "I'm not lost."
        "I'm exploring."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
        "Nobody is in the lab anyway. Everyone is getting ready to evacuate."
            ++ [You evacuate too?] 
                #speaker:Alistair
                "Shouldn't you be getting ready too?"
                
                ~PLAY_SOUND("event:/Character Barks/Temperance/child-angry")
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
                ~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
                "This is the only way I'm able to. When everyone is gone..."
                #speaker: Alistair
            "Oh." 
            "Okay."
                -> CHILD
-> Questions

=Parents
#speaker:Alistair
"Do your parents know you're here?"
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-thinking")
        #speaker:Child
        "No."
        "They're packing up everything."
        "We're leaving the planet on a big Spacer."
        "It'll be cool to be on one, but..."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-sad")
        "I just wanna stay here..."
        -> CHILD
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
//~ TOGGLE_SLIDER_INTERACTABLE(false)
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

#speaker:Alistair
"You're right, as usual."
"We'll find a way to get my 'treasure.'"
"If I remember corrently, the Director is usually somewhere in the lab."
"Jules used to say that he slept in his office, it seemed like the Director never left!"
#NPC:None
//-> library
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
As crowds of people close in on the board members, I push and wriggle my way closer to the front.
Now that I'm closer, I can hear a bit more of the board members' speech.
#speaker:Board Member
"Come forth, any of you who wish to speak."
"The floor is open for community comments on the appointment of Bennet Crabb as Lab Director or otherwise miscellaneous topics kindred to the community's concerns." -> ShopownerMono
    =ShopownerMono
        ~SET_PARAMETER("PrologueCharacters", 3)
        #speaker:Shopowner
        #NPC:Shopkeep_Neutral
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
        #NPC:Child-teen_Neutral
        "Okay..."
        "Well."
        "Um, so."
        "I know I'm not very old."
        #NPC:Child-teen_Confident
        "But when I was little, I wanted to work on the core."
        ~PLAY_SOUND("event:/Character Barks/Temperance/child-happy")
        "I wanted to see all the artifacts the lab gets from all over the universe."
        "I..."
        #NPC:Child-teen_Neutral
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
        #speaker:Storyteller
        #NPC:Storyteller_Neutral
        As the storyteller Miriam steps up to speak, I hear the crowd sigh and groan.
        A few board members shake their heads and cast their eyes downward.
        #NPC:Storyteller_Confident
        "Yes!"
        "Yes, you all complain and sqwauk because you know you are about to hear everything you wish not to accept as truth!"
        "I will open your eyes- Listen now!"
        "The planet will not be destroyed- Elor-Nabyke will not fall!"
        #NPC:Storyteller_Neutral
        "They are distracting us- lying to us!"
        "Our planet does not matter."
        "There are hidden planets in the multiverse, hidden in the strings that we can not see!"
        "And there are contraptions of extordinatary power, they are hiding them from us! To collect it for themselves and-"
        #NPC:Storyteller_Confident
        The Old Lady's ravings are drowned out as the crowd's murmuring and muttering rise to a creshendo.
        ~SET_PARAMETER("PrologueCharacters", 2)
        I can't hear her words, but the woman writhes and grins at the board as spittle sprays in their direction.
#speaker:Lab Director
#NPC:Labhead_Confident
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
//~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
{helpComplete == 3: ->TempEnd|->DONE}

===TempEnd===
You have successfully helped Jules enough to get him elected!
This is the end of Chronautical's Demo, thank you so much for playing!
-> DONE

===Ending===
//placeholder for ending
//~PLAY_SOUND("event:/Sound/SFX/Prologue/Door open")
-> DONE