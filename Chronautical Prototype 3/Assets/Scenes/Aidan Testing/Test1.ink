VAR testInt = 0
EXTERNAL STORE_NUMBER(name, value)
EXTERNAL GET_NUMBER(name)

~ testInt = GET_NUMBER("testInt")
Test int is {testInt}

~ testInt = 1
~ STORE_NUMBER("testInt", 1)


Test int is now {testInt}