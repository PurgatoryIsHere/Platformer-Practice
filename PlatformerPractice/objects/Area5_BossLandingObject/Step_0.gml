/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(Area5_BossObject))
{
	instance_destroy(self)	
}
else if (Area5_BossObject.phase = self.phase)
{
	Area5_BossObject.next_site = self;	
}
