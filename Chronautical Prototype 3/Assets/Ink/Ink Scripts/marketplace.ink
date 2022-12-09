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
        - 2:    The old storyteller strains to be heard among the bustling crowd, the shoppers clambering over the new goods. An energetic child runs past. Following their movement I happen to spot Jules, both helping direct shipments and taking glances at the wares.
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
        - 5:    Everyone seems focused on a large projection of the lab director. A shopkeep I recognize has left their store to watch, and even the old storyteller stays quiet and watches intently.
                ~ shopownerPresent = true
                ~ oldladyPresent = true
                ~noNPCS=false
        - 6:    The market is barren, everyone seems to be elsewhere at the moment.
                ~noNPCS=true
        - 7:    The people milling about seem more interested in gossip than shopping. A shopkeep shoos away a teen loitering in front of their store, and she sulks as she leaves.
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
        
        ~CREATE_JOURNAL_OBJECT("Jules", "Person", "An old friend that I went to university with.", "Jules is a trusted friend and colleague. I interned and went to university with him, he'll always be someone I can trust to help me and tell me the truth.")
        #speaker:Jules
        "You are too easy to read my friend." -> JULES
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
        "You are too easy to read my friend." -> JULES

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
    #speaker: 
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
    "Ha ha... Yeah, I suppose being frugal is a virtue."
    (Never see the light of day, huh?)
    (... So much will be lost...)
        -> Questions
    
+ [You sure are dilligent] 
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


//Uriah Bramble (shopowner/shopkeep) NPC Convo

===SHOPOWNER===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 3)}
{metShopowner: -> Questions| -> meetShopowner}

=meetShopowner
~metShopowner = true
#NPC:Shopkeep_Neutral
#speaker:Alistair
"Hello there, shopkeep."
"I was wondering if I could perchance peruse your wares, and perhaps be made aware of any local news, as well."
I glance an their nametag. 'Uriah Bramble.' They greet me with a warm smile.

#speaker:Uriah
"Why of course, sir! I carry a wide variety of wares, feel free to take a look."
"Are you from around here?"

#speaker:Alistair
"I used to be. Hoping to catch up on what I've missed."

#speaker: Uriah
"I'll do my best to fill you in, then."
"While you shop, of course."
~CREATE_JOURNAL_OBJECT("Shopkeep", "Person", "A shopkeep that offers a variety of different items for purchase. Always has an upbeat attitude", "Full name: Uriah Bramble, they're always happy to help and spread around information. They run the shop to provide for their family, and is certain they'll be able to handle everything that comes their way.")
-> SHOPOWNER

=Questions
#speaker:Uriah
#NPC:Shopkeep_Neutral
"What can I do for you today?"
+ {time == 3} [Souvenirs?] ->Souvenirs
+ {time == 4} [What's new?] ->New
+ {time == 5} [The announcement...] ->Announcement
+ {time == 7} [Any good gossip?] ->Gossip
+ {time == 8} [Preparing to leave?] ->Preparing
+ [Nothing for now] -> END
 #speaker: Uriah
"Come back anytime!"
 #speaker: 
~ TOGGLE_SLIDER_INTERACTABLE(true)

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
+ [Are they interested in soemthing like that?]
        #speaker:Alistair
        "I feel like the scholarly sort wouldn't be interested."
        "Are you making any sales?"
    -
    
#speaker:Uriah
"Of course! The drinks of Elore-Nabyke are universe-renowned."
"Our method of bubbling, our colors..."
"Perhaps you'd care for one?"

#speaker:Alistair
"I'm unfortunately low on funds. Sorry."

#speaker:Uriah
"No worries, have a nice day!"

-> Questions


//Temperance Ward (Child) NPC Convo

=New
#speaker: Alistair
"Anything new going on?"
"It seems quite calm."

#speaker:Uriah
"Indeed. Last year was busier, but this is normal."
"A good amount of business."
"Oh! That's right!"
"I believe I heared the library's rennovations are nearly complete, or at least they should be by next year."

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
"Though I'm often out and about travelling the trade seams or here at the market, it's all to provide for them."
"That's my priority, my loved ones."

#speaker:Alistair
"I see. That's very noble of you."
"And... Encouraging. Thank you, I think I feel a bit better now."
(That's right. He needs my treasure. That' why I'm doing this.)

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
"Atmos vessels are nce and all, but I know I for one would like to have a travel bag."

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
+ [Isn't it just all junk though?]
        #speaker:Alistair
        "Isn't everything being put up for sale for the same reason?"
        "If they're not willing or able to bring it with, how does that change if you have it?"
    -

#speaker:Uriah
"One person's trash is another one's treasure."
"I managed to get something special. A large blanket."
"People travelling by themselves have no need for soemthing so bulky."
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

===CHILD===
~ TOGGLE_SLIDER_INTERACTABLE(false)
//{SET_PARAMETER("PrologueCharacters", 4)}
{SET_PARAMETER("PrologueCharacters", 4)}
{metChild: -> Questions| -> meetChild}

=meetChild
#speaker:Alistair
    "Hello there! What's your name?"
    
    #speaker:Temperance
    #NPC:Child_Neutral
    "...Temperance."
    
    #speaker:Alistair
    "Oh, well..."
    "My name is Alistair!"
    
    #speaker:Child
    "..."
    
    #speaker:Alistair
    "You... doing alright?"
    
    #speaker:Temperance
    "I'm fine."
    ~metChild = true
    ~CREATE_JOURNAL_OBJECT("Child", "Person", "A young child who wishes to work in the lab one day. Her parents are leaving the planet with her early.", "Temperance Ward is her full name, a young person who always seems to speak her mind regardless of situation. She wishes to work at the lab, but that's nothing but a pipe dream now.")
-> CHILD

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
     #speaker: 
        ~ TOGGLE_SLIDER_INTERACTABLE(true)
        #NPC:None
        -> DONE

=Story
#speaker:Alistair
"Do you like the story? She's such a good speaker, isn't she?"
"You shouldn't take her too seriously, though."

#speaker:Temperance
"..."

#speaker:Alistair
"I'm a fan of the story."
"Though it does go against the lab's observations, it-"

#speaker:Temperance
#NPC:Child_Confident
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
        (Or at least Jules'. I doubt crabb wants to see my face.)
    -
    
#speaker:Temperance
"Wow... I wish I could work in the lab, too!"
"They know so many cool things!"
"It's my dream."

#speaker:Alistair
(Urgh. Curses. Good going Alistair, you've runied a child's dream.)
"Well... work hard and I'm sure you'll make it."

#speaker:Temperance
"Thanks, mister! I will!"

-> Questions

=Exciting
#speaker:Alistair
"Woah there! You seem excited."
"There are some delicate goods being handled, don't bump into anyone."

#speaker:Temperance
#NPC:Child_Neutral
"Oh! Um, sorry mister."

#speaker:Alistair
"And steer especially clear of the lab workers."
"Some of those artifacts cannot be replaced."

#speaker:Temperance
"Ah! But... That stuff's so cool! I wanna see it!"
#NPC:Child_Confident
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
#NPC:Child_Neutral
"Some other kids think it's boring, but I think that reserch stuff is the best part."
"It's fun to know things."

#speaker:Alistair
"That's a wonderful mindset you have there."
"You should check out the showcae they're having next year."
"Lots of interesting topics there."

#speaker:Temperance
"Really? I will!"

-> Questions


//Miriam Harcourt (Old Lady/Storyteller) NPC Convo

=Listening
#speaker:Alistair
"Listening to the storyteller?"
"I would have expected you to be more interested in the lab showcase."

#speaker:Temperance
#NPC:Child_Confident
"I already looked at all that stuff."
"All the lab people are busy talking to a bunch of snooty people."
#NPC:Child_Neutral
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

#speaker:Temperance
"Hmph. What makes you think something's wrong?"

#speaker:Alistair
(Hm. Seems she's in her rebellious phase. Nothing I can't handle.)
"Well, you just seem a bit unenergetic."
"The results of the election for lab director's still hot news."
"I figured it'd be something to be excited about."

#speaker:Temperance
"The lab director?"
"What does it matter anyway."

#speaker:Alistair
(Uh oh.)
+ [Did you want someone else to win?]
        #speaker:Alistair
        "Are you unsatisfied with the election results?"
        "Even if you are theres always..."
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
"Look mister, Those lab people, with all their fancy equipment, couldn't even notice the planet's core dying."
#NPC:Child-teen_Distant
"And now we just have to run away?"
"That'll always be the the same, I've realized."
"They're not willing to fight for it. Not willing to change."

#speaker:Alistair
"You should know that their instruments are finely tuned."
"The planet will barely last three years."
"That's not enough time. People's lives are more important!"

#speaker:Temperance
#NPC:Child-teen_Neutral
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
#NPC:Child-teen_Neutral
"Thanks, mister. Alistair."

#speaker:Alistair
"Take care."
(I'm... So sorry.)

-> Questions


//Miriam Harcourt (Old Lady/Storyteller) NPC Convo

===OLDLADY===
~ TOGGLE_SLIDER_INTERACTABLE(false)
{SET_PARAMETER("PrologueCharacters", 5)}
{metOldlady: -> Questions| -> meetOldlady}

=meetOldlady
~metOldlady = true
#speaker:Alistair
#NPC:Storyteller_Neutral
"Hello, ma'am. I couldn't help but notice, you appear to be a storyteller of sorts. Could you-"

#speaker:Miriam
"Storyteller? My dear boy, I am no mere storyteller, I am a purveyor of truth!"
"They all doubt old Miriam, but they'll soon see!"
"The dissapearance of PLANETNAME is a sign of things to come!"

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
-> OLDLADY

=Questions
#speaker:Miriam
#NPC:Storyteller_Neutral
"What curiosity do you hold, young man? I have all the answers!"
//12345
+ {time == 1} [Dissapearance of PLANETNAME?] ->Dissapearance
+ {time == 2} [Busy day?] ->Busy
+ {time == 3} [Can't get a crowd?] ->Crowd
+ {time == 4} [Who are you talking to?] ->Who
+ {time == 5} [About the announcement...] ->Announcement
+ [Nothing for now] -> END
#speaker:Miriam
"Whenever you seek truth, just find me again."
 #speaker: 
~ TOGGLE_SLIDER_INTERACTABLE(true)

=Dissapearance
#speaker:Alistair
"I think I overheard you say somethig about PLANETNAME... Dissapearing?" 
"The Director said it was destroyed."

#speaker:Miriam
"Aha! That's what they want you to think!"
"You see, PLANETNAME was not destroyed, but lost! Lost in the cosmic web!"
"The Strings that connect our vast universe are deeper than you could ever emagine..."
"So deep, even a planet could be shallowed up, lost in the space between spaces!"
"Not even the most traveled trade seams are truly safe..."

#speaker:Alistair
(She's not... Entirely incorrect.)
(Maybe PLANETNAME's been thrown off by what's happening here?)
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
"Busy! Well! Try frustrating! I can hardly think with all this racket."
"How am I supposed to spread truth like this? A sudden boom of products and everyone seems content to ignore the big picture..."

#speaker:Alistair
"Well..."
+ [It's understandable]
        #speaker:Alistair
        "Surely you understand the people's excitement?"
        "There are many unique artefacts being imported."
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
"A disc that makes machines work as if they were new!"
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
        "These people take secure seams, they would have no chance of ending up other than their destination."
-

#speaker:Miriam
"The Sirens mimic the sounds of ships in distress!"
"They lure others away from safety, into the horrors of a raw string!"
"The crew hears their dying words on repeat.."
"Before the vessel gets pushed to the edge of the universe, devoid of life."
"Or worse, become a ghost ship!"
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
"It's just like PLANETNAME all over again." 
"Doesn't anyone see? It's a pattern! A plot!"

#speaker:Alistair
(Curses! I can't contradict her without revealing too much!)
"Please, don't do anything crazy."
She begins muttering to herself incoherently, no longer acknowledging my presence.

#speaker:Alistair
(Curses.)
"I'll... See you around."

-> Questions



//Quest Specific Knots
//Placeholder