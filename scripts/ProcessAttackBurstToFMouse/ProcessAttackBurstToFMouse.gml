// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ProcessAttackBurstToFMouse(argument0, argument1){
	//Start of the attack
	if (sprite_index != argument0)
	{
		sprite_index = argument0
		image_index = 0;	
		ds_list_clear(hitByAttack);
	}

	//Use attack hitbox & check for hits
	mask_index = argument1;
	var hitByAttackNow = ds_list_create()
	var hits = instance_place_list(x,y,OFighter,hitByAttackNow,false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it
			var hitID = hitByAttackNow[| i]
			if (ds_list_find_index(hitByAttack,hitID) == -1)
			{
				ds_list_add(hitByAttack,hitID);
				with (hitID)
				{
					FighterMouseHit(20);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sCat;
}