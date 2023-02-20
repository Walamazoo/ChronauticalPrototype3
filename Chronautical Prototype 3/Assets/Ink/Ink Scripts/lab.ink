//Script for location LAB
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



//Content knots start
-> lab
===lab===
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
    ~ roomDescription = "The Lab Director election has concluded."
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
        - 5:    -> evaluate
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

=== evaluate ===
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
        - 5:    -> evaluate
                A large crowd of various employees of the lab crowd around a projection of the Director. Even the wasteman strains himself to listen.
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
   
/*     
    //NPC Description for player and variable changes
    + [Look for someone to talk to]
        { time:
        - 1:    Many scientists are present, but they look too busy to talk to me.
                ~noNPCS=true
        - 2:    Many scientists are present, but they look too busy to talk to me.
                I see the Director in his office.
                ~directorPresent=true
                ~noNPCS=false
        - 3:    There are dozens of scientists and judges, but they're too busy proving their worth to speak to me.
                I see the Director in his office.
                Jules stands in front of a booth of his own.
                ~julesPresent=true
                ~directorPresent=true
                ~noNPCS=false
        - 4:    There aren't too many people in the lab today, but Jules sits at his work station eating lunch, it seems.
                I see the Director in his office.
                ~directorPresent=true
                ~julesPresent=true
                ~noNPCS=false
        - 5:    Everyone is fixated on the projection of the Director, but I see Jules sitting by himself nearby.
                ~julesPresent=true
                ~noNPCS=false
        - 6:    There is no one in the lab, they seem to be elsewhere.
                ~noNPCS=true
        - 7:    No one here seems willing to talk to me.
                ~noNPCS=true
        - 8:    I don't see anyone to talk to.
                ~noNPCS=true
        - 9:    I don't see anyone to talk to and there hasn't been anyone here for awhile.
                ~noNPCS=true
        - 10:   Everyone who once worked in the lab is long gone.
                ~noNPCS=true
        }
        -> NPCS

//Sets what NPCs are choices
===NPCS===
{noNPCS:
    There is no one to talk to at this time. -> END
  - else:
    ~ TOGGLE_SLIDER_INTERACTABLE(false)
Who should I talk to? 
    +{julesPresent} [Jules] -> JULES
    +{directorPresent} [The Director] -> DIRECTOR
    +[Don't talk to anyone]
    ~ TOGGLE_SLIDER_INTERACTABLE(true)
    -> END 
}

*/



//NPCs Convos

//Jules Ambrose
===JULES===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 1)}
#NPC:Jules_Neutral
{metJules: -> Questions|-> meetJules}

=meetJules
~metJules=true

    #speaker:Alistair
    #sprite:Alistair_Nervous
    "Jules? Is that you?"
    
    #speaker:Jules
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesGreeting")
    "Alistair!"
    "Alistair, you-"
    ~PLAY_SOUND("event:/Character Barks/Jules/JulesSad")
    "You've been gone for so long."
    "Of all times, why are you back now?"
    
    #speaker:Alistair
    #sprite:Alistair_Confident
    "Well, it's quite a long story..."
    "But it's good to see you again!"
    
    #speaker:Jules
    "I'm sorry, it is good to see you too..."
    "Where have you been? You were gone for so long, we were all worried something had happened."
    
    +[Been out and about] 
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
        "You are too easy to read my friend." -> JULES
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
        "You are too easy to read my friend." -> JULES

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
"It's exciting, isn't it? There's so many fresh faces and new experiments all in one place."

#speaker:Alistair
"Do you have an experiment set up here?"

#speaker:Jules
"Of course!"
"Though I'm afriad it's a bit of a secret!"
"Perhaps I'll tell you about it another time."
//PLACEHOLDER FOR WHAT HIS ACTUAL EXPERIMENT IS^
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

~ TOGGLE_SLIDER_INTERACTABLE(true)
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
"Ahh... it is unlikely I would win. Even if the council does want Bennet gone."

#speaker:Alistair
#sprite:Alistair_Neutral
"But what's the harm in trying? The election is still quite far away."

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
~ TOGGLE_SLIDER_INTERACTABLE(true)
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
===DIRECTOR===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 2)}
#NPC:Labhead_Neutral
{metDirector: -> Questions|-> meetDirector}

=meetDirector
~metDirector=true
#speaker:Director
"Hm?"
"Greetings, I am Bennet Crabb, the Director of the laboratory."
"How can I help you?"

#speaker:Alistair
#sprite:Alistair_Embarassed
"Ah-"
"Sir, do you not remember me?"
"I'm Alistair! I interned here with Jules Ambrose?"

#speaker:Director
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
    
    #speaker:Director
    "Do not play coy with me, boy."
    
    + [Sorry]
    #speaker:Alistair
    #sprite:Alistair_Nervous
    "I am quite sorry, sir. My sincerest apologies."
    
    - 
    #speaker:Director
    "You abandoned your duties, your job, here at the lab with nary a hint of warning."
    "That sort of behavior is most unprofessional."
    "Do not think that your return to the planet will secure you a position once again."
    
    #speaker:Alistair
    "Of course not sir."
    "I am... Just visiting."
    
    #speaker:Director
    "And visit you may."
    "Now, be gone."
    "I have much work to attend to."
~CREATE_JOURNAL_OBJECT("Director", "Person", "The director of the lab. A stubborn old man that keeps private matters 100% private.", "Bennet Crabb is the current lab director, a man who keeps the lab on schedule and on task without outside intervention. He's cold and not very sweet to most, and has been director for an incredibly long time. If I can get his help or replace him, I may have a shot.")
~ TOGGLE_SLIDER_INTERACTABLE(true)
#NPC:None
-> END

=Questions
#speaker:Director 
"What do you want?"
    + {time== 2} [Lab is busy?] -> Busylab
    + {time== 3} [Booths?] -> Booths
    + {time== 4} [Lots of work?] -> Notbusy
    * {seenPepTalk==true} [Enter vault?] -> VaultTalk
    + [Nothing for now]
        #speaker:Director
        "Yes, yes, begone. I am quite busy."
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
        #NPC:None
        -> END //lab

=Busylab
#speaker:Alistair
#sprite:Alistair_Assured
"The lab seems busy today!"

#speaker:Director
"Yes, it's been quite busy for a few weeks now."
"Which is why I have very little time for idle chatter..."

#speaker:Alistair
#sprite:Alistair_Neutral
"Did something happen? Why is the lab so busy?"

#speaker:Director
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

#speaker:Director
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

#speaker:Director
"Indeed..."

#speaker:Alistair
"... What are you working on?"

#speaker:Director
"Nothing that concerns you."
"Details on the artifacts we work with are not discussed with civilans."

#speaker:Alistair
#sprite:Alistair_Embarassed
"But I'm not quite just a civilan, aren't I?"
"I worked here!"

#speaker:Director
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

#speaker:Director
"Out with it, what do you want?"

#speaker:Alistair
"You see..."
"I left behind some of my belongings in the vault, but-"
#sprite:Alistair_Assured
"I really need them! You wouldn't mind just letting me into the vault for a moment would you?"

#speaker:Director
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
        #speaker:Director
        "Hmph."
        "What even is it that you want from the vault?"
    + [Notes]
        #speaker:Alistair
        #sprite:Alistair_Neutral
        "My research notes. They're still inside the vault."
        
        #speaker:Director
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
        #speaker:Director
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
        #speaker:Director
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

#speaker:Director
#sprite:Director_Neutral
"In further announcements..."
"As some of you may have already heard..."
"Rumors have been circulating that the planet PLANETNAME has been destroyed under mysterious circumstances."
"However, it is best not to feed into gossip until we can determine what it was that caused this disaster."
"It is more than likely that the planet's core malfunctioned, which is a very rare occurance."
"There is no need to worry."
"Indeed. Next month, the lab will host a festival..."
-> lab

===ScienceFair===
Booth upon booth line the lab's walls. 
Young and old scientists stand in front of their experiments to demonstrate their discoveries and to discuss with judges their findings.
I remember doing the same when I was a fresh intern.
-> lab

===AnnounceDestruction===
~ TOGGLE_SLIDER_INTERACTABLE(false)
The Director's projected form stands tall over the group of people around him.
Everyone is silent, just looking up.

#speaker:Director
#NPC:Director_Neutral
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
-> lab

===Congratsparty===
#speaker:
Beyond the lab's foyer, groups of people crowd into the Director's office.
Jules' office.
The room is packed with people from the city and lab employees, but within the center of the crowd, I find Jules.
    + [Speak to Jules] -> Julestalk
    + [Leave for now] -> lab

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
~SET_PARAMETER("PrologueMusic", 1)
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
~SET_PARAMETER("PrologueMusic", 0)
//change to different music
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
