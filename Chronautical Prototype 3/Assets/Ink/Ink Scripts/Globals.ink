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
VAR directorName = "Bennet Crabb"
VAR seenPepTalk = false

//Variables for Side Quests
//Variable for if the player has spoke to Bennet about getting into the vault
VAR vaultDirector = false
//Variable for if Jules is the director or not
VAR julesDirector = false
//Variable for if the player has the code for the vault
VAR hasCode = false
//Variable for if the player has told Jules he should run for Director
VAR julesRun = false
//Variable for if the player has told Jules what topics he should address in his speech or not
VAR speechImproved = false
//Variable for if the player has spoken to Jules about how to pronounce theword "address"
VAR addressFix = false
//Variable for if the player has seen Jules' speech
VAR seenSpeech = false

//NPC Variables
VAR julesPresent = false
VAR directorPresent = false 
VAR shopownerPresent = false
VAR childPresent = false
VAR oldladyPresent = false
VAR metShopowner = false
VAR metOldlady = false
VAR noNPCS = false

//Variables for if player has met NPC
VAR metJules = false
VAR metChild = false
VAR metDirector = false

//Functions
EXTERNAL TOGGLE_SLIDER(state)
EXTERNAL TOGGLE_SLIDER_INTERACTABLE(state)
EXTERNAL TOGGLE_FILTER(state)

EXTERNAL PLAY_MUSIC(music)
EXTERNAL PLAY_AMBIENCE(ambience)
EXTERNAL SET_PARAMETER(parName, value)
EXTERNAL PLAY_SOUND(sound)

EXTERNAL CREATE_TIMELINE_CLUE(name, type, hoverDescription, fullDescription)
EXTERNAL CREATE_JOURNAL_OBJECT(name, type, hoverDescription, fullDescription)


=== function TOGGLE_SLIDER(state) ===
    ~return state
=== function TOGGLE_SLIDER_INTERACTABLE(state) ===
    ~return state
=== function PLAY_MUSIC(music) ===
    ~return music
=== function PLAY_AMBIENCE(ambience) ===
    ~return ambience
=== function SET_PARAMETER(parName, value) ===
    ~return parName
    ~return value
=== function CREATE_TIMELINE_CLUE(name, type, hoverDescription, fullDescription) ===
    ~return name
=== function CREATE_JOURNAL_OBJECT(name, type, hoverDescription, fullDescription) ===
    ~return name