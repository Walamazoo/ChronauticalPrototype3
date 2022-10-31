EXTERNAL SetIntVariable(variableName, value)
EXTERNAL GetIntVariable(variableName)
EXTERNAL GET_NUMBER()
EXTERNAL SHOW_BUTTON()
EXTERNAL MAKE_LOG()
EXTERNAL STORE_NUMBER(stored_number)
VAR number = 0

-> beginning
== beginning ==
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
~MAKE_LOG()

    ->END

=== function GET_NUMBER() ===
	~ return 1
=== function STORE_NUMBER(stored_number) ===
	~ return "(Storing {stored_number})"
=== function SHOW_BUTTON() ===
	~ return "(Button shown)"
=== function MAKE_LOG() ===
	~ return "(Debug done)"