EXTERNAL SetIntVariable(variableName, value)
EXTERNAL GetIntVariable(variableName)
EXTERNAL GET_NUMBER()
EXTERNAL SHOW_BUTTON()
EXTERNAL BUTTON_GONE()
EXTERNAL CREATE_JOURNAL_OBJECT(name, type, hover, full)
EXTERNAL STORE_NUMBER(stored_number)
VAR number = 0

-> beginning
== beginning ==
#Background:Background1
~BUTTON_GONE()
~GET_NUMBER()
The number is {number}.
Wowie!
+ I think it's too big.    
-> descision
+ I think it's too small.   
-> descision

== descision ==
{ number > 4:
    It's too big.
	~SetIntVariable("num", 0)
	~number = 0
	~STORE_NUMBER(number)
	//~TextUpdate()
}
Now.
The number is {number}.
~STORE_NUMBER(number)
~SHOW_BUTTON()
~CREATE_JOURNAL_OBJECT("Duh", "itemclue", "owealsinvw", "aolvigbwesngwelgnw")
~CREATE_JOURNAL_OBJECT("Duh", "item", "owsjbenonw evna", "piaenf") 
#Background:Background2

    ->END

=== function GET_NUMBER() ===
	~ return 1
=== function STORE_NUMBER(stored_number) ===
	~ return "(Storing {stored_number})"
=== function SHOW_BUTTON() ===
	~ return "(Button shown)"
=== function CREATE_JOURNAL_OBJECT(name1, type1, hover1, full1) ===
	~ return "(didn't work)"
=== function BUTTON_GONE() ===
	~ return "(Button Gone)"