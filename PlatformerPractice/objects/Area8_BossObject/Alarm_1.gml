/// @description Area 3 Boss Pillar Drop
// You can write your code in this editor

with(WarningObject)
{
	instance_destroy();
}

if(wave == 1)
{
	var pillar_x = [32, 48, 112, 128, 192, 208, 480, 496, 560, 576, 640, 656];
	var pillar_y = [1120, 1104, 1088, 1072, 1056, 1040, 1024, 1008, 992, 976, 960, 944, 928, 912, 896];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", PillarObject);
        }
    }
	
	// slanted pillar
	var slant_y = 912;
	var slant_x = 224;
	
	while(slant_y <= 1120)
	{
		instance_create_layer(slant_x, slant_y, "Instances", PillarObject);
		instance_create_layer(slant_x + 16, slant_y, "Instances", PillarObject);
		
		slant_x += 16;
		slant_y += 16;
	}
}

else if(wave == 2)
{
	var pillar_x = [112, 128, 192, 208, 272, 288, 352, 368, 432, 448, 512, 528];
	var pillar_y = [928, 912, 896, 880, 864, 848, 832, 816, 800, 784, 768, 752, 736];
	
	for (var i = 0; i < array_length(pillar_x); i++)
    {
        for (var j = 0; j < array_length(pillar_y); j++)
        {
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", PillarObject);
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
            instance_create_layer(pillar_x[i], pillar_y[j], "Instances", PillarObject);
        }
    }
}