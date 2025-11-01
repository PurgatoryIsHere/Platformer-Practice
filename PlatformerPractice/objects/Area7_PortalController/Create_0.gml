/// @description Initialization
//You can write your code in this editor
persistent = true;

// os = other sider, en = entrance, ex = exit

portal_data = ds_map_create();

// Area 1 Subsection
var area1_entrance = ds_map_create();
var ex1 = ds_map_create();

ex1[? "x"] = 2032;
ex1[? "y"] = 720;
ex1[? "room"] = Area7_1;

area1_entrance[? "ex"] = ex1;


var area1_exit = ds_map_create();
var ex2 = ds_map_create();

ex2[? "x"] = 816;
ex2[? "y"] = 304;
ex2[? "room"] = Area7;

area1_exit[? "ex"] = ex2;

// Area 3 Subsection
var area3_entrance = ds_map_create();
var ex3 = ds_map_create();

ex3[? "x"] = 48;
ex3[? "y"] = 112;
ex3[? "room"] = Area7_2;

area3_entrance[? "ex"] = ex3;


var area3_exit = ds_map_create();
var ex4 = ds_map_create();

ex4[? "x"] = 1120;
ex4[? "y"] = 352;
ex4[? "room"] = Area7;

area3_exit[? "ex"] = ex4;

// Area 5 Subsection
var area5_entrance = ds_map_create();
var ex5 = ds_map_create();

ex5[? "x"] = 2016;
ex5[? "y"] = 1088;
ex5[? "room"] = Area7_3;

area5_entrance[? "ex"] = ex5;

var area5_exit = ds_map_create();
var ex6 = ds_map_create();

ex6[? "x"] = 1232;
ex6[? "y"] = 352;
ex6[? "room"] = Area7;

area5_exit[? "ex"] = ex6;

portal_data[? "area1_entrance"] = area1_entrance;
portal_data[? "area1_exit"] = area1_exit;
portal_data[? "area3_entrance"] = area3_entrance;
portal_data[? "area3_exit"] = area3_exit;
portal_data[? "area5_entrance"] = area5_entrance;
portal_data[? "area5_exit"] = area5_exit;


teleport_key = "";

SetPortalDetails = function()
{
	if(teleport_key = "area1_entrance")
	{
		
	}
}


// Screen white-out effects
fade_alpha = 0;
fading_out = false;
fading_in = false;
fade_speed = 0.1;

