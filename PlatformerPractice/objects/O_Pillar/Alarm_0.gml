/// @description Insert description here
// You can write your code in this editor

// Directions to check: below, above, left, right
var neighbors = [
    [0, sprite_height],
    [0, -sprite_height],
    [-sprite_width, 0],
    [sprite_width, 0]
];

for (var i = 0; i < array_length(neighbors); i++) 
{
    var offset = neighbors[i];
    var nx = x + offset[0];
    var ny = y + offset[1];

    var neighbor = instance_place(nx, ny, O_Pillar);
	
    if (neighbor != noone && !neighbor.alarm_triggered) 
	{
        collapse_tile(neighbor); // Spread the collapse
    }
}

instance_destroy(); // Bye-bye tile!