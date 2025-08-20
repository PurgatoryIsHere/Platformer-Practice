/// @description Pillar drop mechanics
// You can write your code in this editor

with(WarningObject)
{
	instance_destroy();
}

if(phase == 1)
{
	var pillar_x = [2880, 2896, 2960, 2976, 3232, 3248, 3312, 3328];
	var pillar_y = [368, 352, 336, 320, 304, 288, 272, 256, 240, 224, 208, 192, 176, 160];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", PillarObject);
        }
    }
}

else if(phase == 2)
{
	var pillar_x = [2848, 2864, 2880, 2896, 2912, 2928, 2992, 3008, 3024, 3040, 3056, 3072, 3120, 3136, 3152, 3168, 3184, 3200, 3264, 3280, 3296, 3312, 3328, 3344];
	var pillar_y = [368, 352, 336, 320, 304, 288, 272, 256, 240, 224, 208, 192, 176, 160];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", PillarObject);
        }
    }
}