| Reserve 1 byte in memory called min
min: ds.b 1

| Move 5 numbers to sequential locations in memory
	 move.b #6, D0
	 move.b D0, 1
	 move.b #4, D0
	 move.b D0, 2
	 move.b #9, D0
	 move.b D0, 3
	 move.b #12, D0 
	 move.b D0, 4
	 move.b #5, D0
	 move.b D0, 5
	 
	 
| Move the number 5 into address register A0 to be our pointer to memory location
move.b #5, A0

| Store how many times we've been round the loop in D1
move.b #0, D1

| Subtract 1 from the values in memory until we hit 0, the first number to hit 0 must be the smallest so store that in min

subroute: move.b (A0), D2
		  sub #1, D2
		  BEQ end
		  move.b D2, (A0)
		  dec A0
		  BMI reset
		  JMP subroute
		  
| If we've been through every number in memory and subtracted one but haven't hit 0 yet we need to do it again so reset A0 to 5
| We increment D1 each time we get here so we know what value was at the memory location initially 

reset: move.b #5, A0
	   inc D1
	   JMP subroute

| Increment D1 as we skipped over the reset method when coming here. Now D1 contains the smallest number so move it to min		  

end: inc D1
     move.b D1, min		  
		   
