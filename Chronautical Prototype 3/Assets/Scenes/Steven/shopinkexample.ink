//These are variables, they are written and set at the start.
VAR coin = 100
VAR nosock = true
VAR nofur = true
VAR noglasses = true
VAR noring = true
VAR nopoof = true
VAR noshop = true
VAR hasshop = false

-> start
//This is a DIVERT. A DIVERT is a signal to ink to make your game go to a particular KNOT. A KNOT is a section of your game. It is used to make different choices go to different sections along with starting and ending your story.
== start ==
You enter the stall. You feel your coin purse jostle against your hip. There's not much, but it's something. 
The shop keep smiles at you toothily and leans against his work station.
"Greetings!"
You take a few steps forward and say:
//Use a + sign in front of a choice to make it disappear after being selected. Use * to make a choice remain after being selected. By placing [] between the text that the player selects, that means that that text will only show for the choice to be clicked. Once it is selected, the text following it is what will be shown to the player. Following the text is some small lines that give a little more uniquness to choices but still make them go to the same outcome or KNOT which is shown by a DIVERT.


    * [Hello.] "Hello sir."
        He gives a scoffing laugh, "Ello."
        -> shop
    * [How're you?] "Good evening, how are you?"
        The shop keep grins wickedly and looks at you a bit harder. "I'm peachy keen. And yourself?"
            ** [Good] "I'm doing alright myself, thank you for asking."
                -> shop
            ** [Bad] "I've had better days, that's for sure."
                He chuckles and slaps his workstation a bit in agreement.
                // This is a nested choice within a choice. It functions the same, but has two **
                //If a collection of choices has many nested choices, but need to come back together at some point before moving on to a different KNOT, use a - in front of text to GATHER the nested choices back together. Gathers can also be nested.
                -> shop
    * [Look around.] You don't respond and instead simply look around the room in silence. The shop keep raises an eyebrow and after a moment he bellows, "Lost, fellow?"
            ** [Respond] "My apologizes, just lost in thought..." The man just snorts.
                -> shop
            ** [Remain silent] You still do not respond. You simply gaze at the shop, seeming to be taking in the various bits and bobbles around you.
            The shop keeper promptly becomes impatient.
            "You going to buy anything?"
                *** [Respond] "Ah. Yes, yes I will..." The shop eyes you wearily.
                    -> shop
                *** [Remain silent] You still do not respond. The shop keep scowls, "Really? Now what are you-" 
                Abruptly, you approach the shop keep and simply drop your coin purse down in front of him.
                He raises an eyebrow, but then smiles once more. "Now we're in business..."
                -> shop
        

== shop ==
"Here's what's available at the moment..." The shop keep says as he swings around in his chair and comes back around with an armful of strange items. 
You have {coin} coins.
//This will print the value that is stored in the coin variable.
Will you peruse the items?
    +[Yes] -> storefront
    +[No] -> badend
//If you use a plus, this choice will remain an option even if the story takes the player back to this choice/knot. This will not be the case if you simply use the back button.
== storefront ==
The items are presented in front of you by the shop keep. 
You have {coin} coins.
//Below, this is conditional logic. You will state your variable that you are checking. If it is set to true, the first option willl appear (the option BEFORE the |) but if your variable is not true it will print the section option. In this case, when it is false, it will print nothing. 
{nosock: The first item you see is a sock. It appears to be quite silky and has frilled edges but has become dirtied.| }

{nofur: The second item is what appears to be a large patch of fur that's been made into a rug. It's a brilliant red. | }

{noglasses: The next item is a pair of glasses. One arm is crooked and the lenses within shine with gold. | }

{noring: Beside the glasses sits a ring. It's simple in structure; a simple silver band. | }

{nopoof: The last item you see is hard to place. It appears to just be a large ball of tawny fluff that floats above the table. | }

"Anything strike your fancy?"

//A variable can be changed by using a ~ within a choice. 
//Below, "the sock" choice will only appear if no sock is true.
    +{nosock}[The sock] "That old thing?" The shop keep snorts. "I don't know, you can have it if you want it..."
    The sock can be purchased for 5 coins.
    You have {coin} coins.
//This is more conditional logic. If that is stated at first, that coin is greater than 5, then what follows will print. Else, the other option will print.
    {coin > 5:
        ++[Purchase]
        ~ coin = coin-5
        ~ nosock = false
        ~ hasshop = true
        ~ noshop = false
            ->storefront
        - else:
        You don't have enough coins.
    }
        ++["Nevermind."] The man scoffs, "Bah!"
            -> storefront

            
    +{nofur}[The fur] "Now that!" The shop keep exclaims, stroking the fur with the back of his hand, "Is a piece of hide from a cow. A cow up north, they've got big wooly coats. It'll keep you warm. What do you say?"
    The fur can be purchased for 20 coins.
    You have {coin} coins.
    {coin >= 20:
        ++[Purchase]
        ~ coin = coin-20
        ~ nofur = false
        ~ hasshop = true
        ~ noshop = false
            ->storefront
        - else:
        You don't have enough coins.
    }
        ++["Nevermind."] The man scoffs, "Bah!"
            -> storefront
            
            
    +{noglasses}[The glasses] "They're broken, why do you want them? The arm is all kinds of messed up."
    The glasses can be purchased for 25 coins.
    You have {coin} coins.
    {coin >= 25:
        ++[Purchase]
        ~ coin = coin-25
        ~ noglasses = false
        ~ hasshop = true
        ~ noshop = false
            ->storefront
        - else:
        You don't have enough coins.
    }
        ++["Nevermind."] The man scoffs, "Bah!"
            -> storefront
            
            
    +{noring}[The ring] The shop keep shrugs, "Not sure where I got it. It's probably some poor sod's wedding ring."
    The ring can be purchased for 50 coins.
    You have {coin} coins.
    {coin >= 50:
        ++[Purchase]
        ~ coin = coin-50
        ~ noring = false
        ~ hasshop = true
        ~ noshop = false
            ->storefront
        - else:
        You don't have enough coins.
    }
        ++["Nevermind."] The man scoffs, "Bah!"
            -> storefront
            
            
    +{nopoof}[The strange item] "I'll be honest, I'm not quite sure where I got that," the man says as he scratches his chin, "It is strange... I can't remember at all..."
    The strange item can be purchased for 80 coins.
    You have {coin} coins.
    {coin >= 80:
        ++[Purchase]
        ~ coin = coin-80
        ~ nopoof = false
        ~ hasshop = true
        ~ noshop = false
            ->storefront
        - else:
        You don't have enough coins.
    }
        ++["Nevermind."] The man scoffs, "Bah!"
            -> storefront
            
            
    +{noshop}[No]
        -> badend
    
    
    +{hasshop}[Done shopping]
        -> goodend

== goodend ==

The shop keep grins from ear to ear as he fingers the coins you handed over and slides them into some sort of container under the desk.
"It's a pleasure doing business with you."
You slide your coins back into your own purse, all {coin} of them. After pulling your coin purse closed, you turn and promptly leave the store. You've got a little less metal in your purse now, but perhaps your puchase today could be helpful.

    -> END
    
== badend ==

The shop keep scowls at you, "No? No!" He swings around an arm and sweeps all of his items back to his chest. He grumbles as he pulls them back to their storage cabinet.
"No? Why even bother coming in..." He grumbles.
You pause for a moment before turning and moving back to the door from where you entered the stall. He seemed like a nasty man anyway, you'll keep your coin.

    -> END
