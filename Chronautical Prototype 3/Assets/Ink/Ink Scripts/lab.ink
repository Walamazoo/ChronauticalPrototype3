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
VAR seenPepTalk = false
//More variables needed here for quest specifics

//Variables for if player has met NPC
VAR metJules = false
VAR metChild = false
VAR metDirector = false

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false

//Knots Start
//Time Set for Testing
//~time=3
-> lab
===lab===
#background:Lab interior
#sprite:Alistair_Neutral
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
        - 1:    Many scientists are present, but they look too busy to talk to me.
                I see the Director in his office.
                ~directorPresent=true
        - 2:    Many scientists are present, but they look too busy to talk to me.
                I see the Director in his office.
                ~directorPresent=true
        - 3:    There are dozens of scientists and judges, but they're too busy proving their worth to speak to me.
                I see the Director in his office.
                Jules stands in front of a booth of his own.
                ~julesPresent=true
                ~directorPresent=true
        - 4:    There aren't too many people in the lab today, but Jules sits at his work station eating lunch it seems.
                I see the Director in his office.
                ~directorPresent=true
                ~julesPresent=true
        - 5:    Everyone is fixated on the projection of the Director, but I see Jules sitting by himself nearby.
                ~julesPresent=true
        - 6:    There is no one in the lab, they seem to be elsewhere.
        - 7:    No one here seems willing to talk to me.
        - 8:    I don't see anyone to talk to.
        - 9:    I don't see anyone to talk to and there hasn't been anyone here for awhile.
        - 10:   Everyone who once worked in the lab is long gone.
        }
        -> NPCS

===NPCS===
//Allows the player to talk to NPCs based on who is there at the time
Who should I talk to? 
    //+{julesPresent} [Jules] -> JULES
    +{directorPresent} [The Director] -> DIRECTOR
    + [Don't talk to anyone] I don't need to talk to anyone right now. -> END //lab


//Knots below have conversations for NPCs that change depending on the time and if certain quest markers have been met
===JULES===
{metJules: -> Questions|-> meetJules}
#NPC:Jules_neutral
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
    //+ [QUESTION] ->QuestionKNOT1
    //+ [QUESTION] ->QUESTIONKNOT2
    //+ [QUESTION] ->DEPENDENTONTIME
    + [Nothing for now]
    #speaker:Jules
    "Let's speak again soon, Alistair."
        -> END //lab

=QUESTIONKNOT1
CONTENT
-> JULES

=QUESTIONKNOT2
CONTENT
-> JULES
//HelpOpenVaultConvo
//Ask for help to get into vault, says no, not going to help break into it
//We have bigger issues at hand, planet exploding
//Darling pops in, says there must be a way, keep searching

//Has seen election
//Return to Jules and suggest him that he run for director, respected and such (only works in certain times)
//Sees election did not help, have some minor election knot changes
//Darling plants idea to help Jules to get elected

===DIRECTOR===
{metDirector: -> Questions|-> meetDirector}
#NPC:Labhead_neutral
=meetDirector
~metDirector=true
#speaker:Director
"Hm?"
"Greetings, I am Bennet Crabb, the Director of the labratory."
"How can I help you?"

#speaker:Alistair
"Ah-"
"Sir, do you not remember me?"
"I'm Alistair! I interned here with Jules Ambrose?"

#speaker:Director
"Alistair?"
"Hm..."
"Of course. Alistair."
"I would have prefered to have forgotten that name, but it seems you have returned."
"But your poor disipinary marks have certainly not been forgotten."
    + [What marks?]
    #speaker:Alistair
    "I'm-"
    "I'm not sure what you could be referencing, sir!"
    
    #speaker:Director
    "Do not play coy with me, boy."
    
    + [Sorry]
    #speaker:Alistair
    "Sir, I am quite sorry, please accept my apology."
    
    - 
    #speaker:Director
    "You abandoned your duties, your job, here at the lab with nary a hint of warning."
    "That sort of behavior is most unprofessional."
    "Do not think that your return to the planet will secure you a position once again."
    
    #speaker:Alistair
    "Of course not sir."
    "I am... just visiting."
    
    #speaker:Director
    "And visit you may."
    "Now, be gone."
    "I have much work to attend to."

-> END //lab

=Questions
#speaker:Director 
"What do you want?"
    //+ {time== 1} [Projected figure?] -> Figure
    //+ {time== 2} [Lab is busy?] -> BusyLab
    //+ {time== 3} [Booths?] -> Booths
    //+ {time== 4} [QUESTION] -> KNOT
    * {seenPepTalk==true} [Enter vault?] -> VaultTalk
    + [Nothing for now]
        #speaker:Director
        "Yes, yes, be gone. I am quite busy."
            -> END //lab

=Figure
CONTENT
-> DIRECTOR

=BusyLab
CONTENT
-> DIRECTOR

=Booths
CONTENT
-> DIRECTOR

=VaultTalk
#speaker:Alistair
"Hello doctor!"
"I wanted to inquire about, well..."
"I believe I misplaced some of my belongings before I left."

#speaker:Director
"Out with it, what do you want?"

#speaker:Alistair
"You see..."
"I left behind some of my belongings in the vault, but-"
"I really need them! You wouldn't mind just letting me into the vault for a moment would you?"

#speaker:Director
"That's proposterous."
"You are no longer employed here and you should know that civilians are strictly prohibited access to any classified materials in the vault."
    + [I need it]
        #speaker:Alistair
        "Sir, I really need my belongings that I left in the vault."
        "It's imparitive that I get them."
    + [Please]
        #speaker:Alistair
        "Sir, please."
        "I know that this is a breach of protocol, but perhaps you could make an exception for an ex-intern?"
    - 
        #speaker:Director
        "Hmph."
        "What even is it that you want from the vault?"
    + [Notes]
        #speaker:Alistair
        "My research notes. They're still inside the vault."
        
        #speaker:Director
        "Those notes belong to the lab now."
        "When you left your position, those materials became part of the collective research of the lab."
        
    + [Something?]
        #speaker:Alistair
        "Uh well..."
        (Think! What should I say?)
        "It's... something?"
        "I just, I really need it."
    - 
        #speaker:Director
        "Absolutely not."
        "No, access to the vault is prohibited."
        "It matters not what it is you want from it."
    + [I must]
        #speaker:Alistair
            "I must get into the vault, sir!"
    + [Please!]
        #speaker:Alistair
            "Please, sir, I need to get into the vault..."
    - 
        #speaker:Director
        "Silence, I have already made my decision."
        "Be gone now, I am incredibly occupied at the moment."
        
#speaker:Alistair
(How infuriating!)
(Speaking to Bennet is like talking to a wall...)

#speaker:D4RL1N6
#NPC:Darling_Neutral
"That was fruitless."

#speaker:Alistair
"Indeed."
"What do we do now?"

#speaker:D4RL1N6
"It is improbable that Mr. Bennet Crabb is the only one who can get into the vault."
"Perhaps we can seek out another employee."
"They might be able to help us or to give us some new information."

#speaker:Alistair
"Jules still works for the lab. We interned together."
"I left, but he stayed."
"Perhaps he can help since we can't get through to Bennet."
-> TempEnd


//Quest and Misc Knots
===OtherPlanetAnnounce===
something here
-> lab

===ScienceFair===
something here
-> lab

===AnnounceDestruction===
something here
-> lab

===TempEnd===
This is the end of our demo, thank you so much for playing!
Be sure to follow our 'Chronautical' socials and let us know what you think!
-> END