// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PState_Release(){
	if (charge > 16) {
		var bullet = instance_create_layer(x, y, "Instances", OPlasma);
		bullet.direction = dir;
		bullet.speed = 5;
		bullet.image_xscale = charge / max_charge;
		bullet.image_yscale = charge / max_charge;
		charge = 16; //charge values should be all same
	}
	state = PSTATE.FREE;
}