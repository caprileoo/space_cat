// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FState_Status(){
	vsp += grv;
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
	
	if (point_distance(x, y, target.x, target.y) <= detectionRadius) {
		if(point_distance(x, y, target.x, target.y) <= detectionRadius - 80 and (on_ground(Owall) or on_ground(OPlatform))){
			state = FSTATE.ATK;
		} else state = FSTATE.CHASE;
	} else state = FSTATE.FREE;
}