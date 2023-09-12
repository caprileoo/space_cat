function PState_Swim(){
	
	var move = key_right - key_left;
	
	if (move != 0) image_xscale = move;
	
	moving();
	
	vsp = 0.8;
    hsp *= 0.6;
	
    if(key_jump){
        vsp -= 3;
    }
	
	if(!place_meeting(x, y, oCheeseWaterfall)){
		state = PSTATE.IDLE;
	}
	
	move_n_collide(collision_objects);
}