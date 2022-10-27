//Script for location LIBRARY

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
//VARIABLES FOR THE SIDE QUEST STUFF
VAR julesDirector = false
VAR hasCode = false

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false

//Sets up if player has seen opening, if has seen it, skips the beginning knot
{seenBeginning: -> library|-> beginning}

//Knots start
===beginning===
~ time = 10
~ seenBeginning = true
#background: outsideCity
//placeholder for music and GMOD stuff

When I was a boy, I put all my thoughts and dreams into a book. Sketches, diagrams, torn-out pages.
It was full of what I would become. Dreams of adventure in the stars piercing through the dark.
I was gripped with a frenzy to explore beyond my bubble of libraries and teahouses.
But, most of all, I dreamed of the universe lost.
Atlantis.

#background: library
//placeholder for flame effects, or general destruction stuff
//placeholder for sound/music
#sprite: Alistair Sad
#speaker: Alistair
My colleagues are all gone. 
(The library will be lost.)
(The planet will be lost.)
(But perhaps there's still a book I haven't seen.)
(There must be something I'm missing.)
(All this mustn't end in failure.)
I throw myself to a bookshelf nearby and yank out tomes. There are so few left. Most have been consumed by fire.
(Perhaps I haven't tried this yet.)

#sprite: Darling Neutral
#speaker: D4RL1N6
"Alistair."

#speaker: Alistair
'There's still time. I can still fix this, I just need to-'

#speaker: D4RL1N6
"Alistair, it's unwise to ignore me."

#speaker: Alistair
"I'm sorry, I'm not- I just need to find this book, I think I remember it saying something about the core."

#speaker: D4RL1N6
"The core is gone."

#speaker: Alistair
"It's not, I know better now, I can find a way to-"

#speaker: D4RL1N6
"This is attempt 37 Alistair. The core is gone. Isn't it clear we can't do anything about the planet's destruction?"
"The last attempt was too much of a close call."

#speaker: Alistair
* [I'm a failure] "If I can't even save this planet, what's the point?"
* [There must be a way] "There must be something I'm just not thinking of."

#speaker: D4RL1N6
- "You've done everything you can."
"I'm sorry, Alistair. You just need to save what's important."

#speaker: Alistair
"..."
"The vault. I need to get something out of there for him. He'll need it."
The vault shimmers under the immense heat in the library. It's tucked into the back of the room. It's clear even from this distance that touching the handle would burn my skin.

#speaker: D4RL1N6
"We'll have to return to a time before all this destruction. One year in the past should be sufficient."

#speaker: Alistair
"Perhaps then we can find a way into the vault."

#speaker: D4RL1N6
"Precisely."
~time = 9
-> library
    
    
===library===
//Room Description for Journal
{ time:
- 1:    
        ~ roomDescription = "Bustling with rumors and security won't let me close to the vault."
- 2:    
        ~ roomDescription = "Under rennovations and filled with security."
- 3:    
        ~ roomDescription = "Under rennovations and filled with security,"
- 4:    
        ~ roomDescription = "Nealy done with rennovations but filled with security."
- 5:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
- 6:    
        ~ roomDescription = "There's a huge crowd in the room because of the election."
- 7:    
        ~ roomDescription = "Library is quiet and the vault is undisturbed."
- 8:    
        ~ roomDescription = "Library is empty and the vault is abandoned."
- 9:    
        ~ roomDescription = "Library is empty and the vault is abandoned. I feel rumbling below me."
- 10:   
        ~ roomDescription = "Library is lost. Fire everywhere, metal melting, vault too hot to touch."
}

//Content Start
What should I do?
    + [Look around]
        //Room Description for Player
        //Gives the players options to do actions if the variable requirements are met (will divert to different knot) (ex. investigate vault)
        { time:
        - 1:    Employees sit in tight circles around the library. There's no reading to be done, instead, there's an electricity in the air in the form of hush whispers.
        - 2:    Scaffolding grazes the arched cielings of the library and the smell of paint, hard wood, and oil linger in the air as carpenters navigate the space. Lab security keeps a close eye on the newcomers. 
        - 3:    Carpenters dip their brushes into fine oils and touch up the shelving and masons repair chips in the floor. The room is sectioned off and lab security stands at attention. 
        - 4:    A foreman walks around the newly rennovated library with a clip board and lab security following her everystep. Looks like rennovations are almost done. 
        - 5:    The library shines with newfound gusto and even the books seem a little newer. Lab employees gather around to marvel at it. 
        - 6:    People stand shoulder to shoulder, all looking at a group of lab board members sitting in a circle toward the front of the room. Everyone is eager to listen and some even stand on ladders to get the best vantage point. 
        - 7:    The library sits silently and shines coldly. Lab employees huddle like silent vultures over their books.
        - 8:    The library is gloom. Shelves of books soar to the cieling in the darkness and some tomes have been abandoned where they lay open on reading desks.
        - 9:    The floor vibrates and occasionally shutters under my feet. The books lining the library shift briefly then hold still once more. 
                * [Investigate the vault] -> InvestigateVault
        - 10:   Flames have claimed the library. Any metal is now liquid and only aids the fire in its quest for destruction.
        }
        -> library
    + [Look for someone to talk to]
        //NPC Description for Player and variable changes
        { time:
        - 1:    Who is there? (Add variable changes for NPCs present)
        - 2:    Who is there?
        - 3:    Who is there?
        - 4:    Who is there?
        - 5:    Who is there?
        - 6:    Who is there?
                ~shopownerPresent = true
                ~childPresent = true
                ~oldladyPresent = true
        - 7:    Who is there?
                ~julesPresent = true
        - 8:    Who is there?
                ~childPresent = true
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
    * [Don't talk to anyone] I don't need to talk to anyone right now. -> library
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


===DIRECTOR===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10

===SHOPOWNER===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10

===CHILD===
{time == 1:
    This is written if yourVariable is true.
  - else:
    prints nothing
}
//repeat for times 2-10

===OLDLADY===
{time == 1:
    This is written if yourVariable is true.
  - else:
    something here if false
}
//repeat for times 2-10

//Knots will be added for specific quest events/actions

//Quest Specific Knots
===InvestigateVault===
#background: vault
The vault is a marvel in of itself. It's a mass of bronze and golden circles that intersect messily like a bird's nest.
In the center, I see a series of numbers: 0-9. 
    * [Guess the code] ->DarlingPepTalk
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
    //OPTION FOR IF YOU DO HAVE THE CODE

->DarlingPepTalk
===DarlingPepTalk===
#speaker: Alistair
"I've seen the vault opened before. It needs a code to be opened."

#speaker: D4RL1N6
"Did you see what the code was?"

#speaker: Alistair
"Well, yes, but the code is changed everytime by the Lab Director."
"They take security very serious here."
"Unfortunately."

#speaker: D4RL1N6
"Then we have to find this Director."

#speaker: Alistair
"And somehow convince him to let us into the vault."

#speaker: D4RL1N6
"Don't be so melodramatic. We'll find a way. We've got to get your treasure."

#speaker: Alistair
"You're right as usual."
"We'll find a way to get my 'treasure'."
-> DONE
