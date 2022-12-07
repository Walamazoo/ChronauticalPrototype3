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

//Placeholder: VARIABLES FOR THE SIDE QUEST STUFF
VAR julesDirector = false
VAR hasCode = false
VAR julesRun = false
VAR speechImproved = false
VAR addressFix = false

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

EXTERNAL PLAY_MUSIC(music)
EXTERNAL PLAY_AMBIENCE(ambience)
EXTERNAL SET_PARAMETER(parName, value)

EXTERNAL CREATE_TIMELINE_CLUE(name, type, hoverDescription, fullDescription)


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