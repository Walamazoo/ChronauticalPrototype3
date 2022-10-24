EXTERNAL SetIntVariable(variableName, value)
EXTERNAL GetIntVariable(variableName)
VAR number = 0
EXTERNAL SetVariables()

-> start

== start ==
~SetVariables()
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
	//~TextUpdate()
}
Now.
The number is {number}.

    ->END
    
=== function SetVariables() ===
~return 1