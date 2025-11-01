/// @description Pillar drop mechanics
// You can write your code in this editor

with(WarningObject)
{
	instance_destroy();
}

if(phase == 1)
{
	var pillar_x = [816, 832, 896, 912, 1168, 1184, 1248, 1264];
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
	var pillar_x = [784, 800, 816, 832, 848, 864, 928, 944, 960, 976, 992, 1008, 1056, 1072, 1088, 1104, 1120, 1136, 1200, 1216, 1232, 1248, 1264, 1280];
	var pillar_y = [368, 352, 336, 320, 304, 288, 272, 256, 240, 224, 208, 192, 176, 160];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", PillarObject);
        }
    }
}