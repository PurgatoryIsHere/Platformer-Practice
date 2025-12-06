 /// @description Insert description here
// You can write your code in this editor

if (!instance_exists(O_A5Boss))
{
	instance_destroy(self)	
}
else if (O_A5Boss.phase = self.phase)
{
	O_A5Boss.next_site = self;	
}
