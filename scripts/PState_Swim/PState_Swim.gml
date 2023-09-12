function PState_Swim(){
	
	var move = key_right - key_left;
	
	if (move != 0) image_xscale = move;
	
	moving();
	
	vsp = 0.8;
    hsp *= 0.6;
	
    if(key_jump && y > oCheeseWaterfall.y){
        vsp -= 3;
    }
    
    if(y <= oCheeseWaterfall.y && key_jump){
        y = oCheeseWaterfall.y;
        vsp = 0;
    }
	
	if(!place_meeting(x, y, oCheeseWaterfall) and !place_meeting(x, y, oCheeseLava)){
		state = PSTATE.IDLE;
	}
	
	move_n_collide(collision_objects);
}
