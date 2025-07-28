/// @description Check to see if self is next_site 
// You can write your code in this editor

if (!instance_exists(Area5_BossObject))
{
	instance_destroy(self);
}
else if (Area5_BossObject.phase = phase)
{
	Area5_BossObject.next_site = self;	
}
