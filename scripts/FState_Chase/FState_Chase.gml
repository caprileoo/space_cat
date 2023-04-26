// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FState_Chase(){
	vsp += grv;
	jump(Owall);
	jump(OPlatform);
	move_n_chase();
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	state = FSTATE.STATUS;
}