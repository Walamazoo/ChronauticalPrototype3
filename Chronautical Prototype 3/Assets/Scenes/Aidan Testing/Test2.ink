VAR testInt = 0
EXTERNAL STORE_NUMBER(name, value)
EXTERNAL GET_NUMBER(name)

~ testInt = GET_NUMBER("testInt")
Test int is {testInt}

~ testInt = 2
~ STORE_NUMBER("testInt", 2)


Test int is now {testInt}