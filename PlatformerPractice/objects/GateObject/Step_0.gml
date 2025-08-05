/// @description Insert description here
// You can write your code in this editor

if(instance_exists(AreaBossParentObject))
{
	if(!global.isBossAlive && global.drops_ability && global.ability_collected)
	{
		instance_destroy(self);
	}

	else if(!global.isBossAlive && !global.drops_ability)
	{
		instance_destroy(self);	
	}
}