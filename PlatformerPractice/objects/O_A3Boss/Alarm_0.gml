/// @description Pillar drop mechanics
// You can write your code in this editor

with(O_Warning)
{
	instance_destroy();
}

if(phase == 1)
{
	var pillar_x = [128, 144, 208, 224, 416, 432, 496, 512];
	var pillar_y = [928, 912, 896, 880, 864, 848, 832, 816, 800, 784, 768, 752, 736];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", O_Pillar);
        }
    }
}

else if(phase == 2)
{
	var pillar_x = [112, 128, 192, 208, 272, 288, 352, 368, 432, 448, 512, 528];
	var pillar_y = [928, 912, 896, 880, 864, 848, 832, 816, 800, 784, 768, 752, 736];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", O_Pillar);
        }
    }
}

else if(phase = 3)
{
	var pillar_x = [80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 256, 272, 288, 352, 368, 384, 400, 416, 432, 448, 464, 480, 496, 512, 528, 544, 560];
	var pillar_y = [928, 912, 896, 880, 864, 848, 832, 816, 800, 784, 768, 752, 736];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", O_Pillar);
        }
    }
}