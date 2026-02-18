/// @description Spawn Bullets
// You can write your code in this editor

pattern = irandom_range(1,3)

switch (pattern)
{
	case 1:
		//Circle burst
		alarm[1] = 30
	break;
	
	case 2:
		//Spiral Spray
		alarm[2] = 30
	break;
	
	case 3:
		//Chunk Shot
		alarm[3] = 30
	break;
}