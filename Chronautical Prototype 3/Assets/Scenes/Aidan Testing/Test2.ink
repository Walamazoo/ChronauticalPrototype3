INCLUDE Globals.ink
//EXTERNAL SET_VALUES()

-> main

=== main ===
//~ SET_VALUES()
Which number do you choose?
    + [1]
        -> setTestInt(1)
    + [2]
        -> setTestInt(2)
    + [3]
        -> setTestInt(3)


=== setTestInt(number) ===
Test Int was {testInt}
~ testInt = number
Now Test Int is {testInt}
-> END