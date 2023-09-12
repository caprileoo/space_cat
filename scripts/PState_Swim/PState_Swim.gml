function PState_Swim(){
	
	var move = key_right - key_left;
	
	if (move != 0) image_xscale = move;
	
	moving();
	
	vsp = 0.8;
    hsp *= 0.6;
	
    var waterfallY = instance_exists(oCheeseWaterfall) ? oCheeseWaterfall.y : -infinity;
    var lavaY = instance_exists(oCheeseLava) ? oCheeseLava.y : -infinity;
    
    if(key_jump and y > max(waterfallY, lavaY)){
        vsp -= 3;
    }
    
    if(y <= max(waterfallY, lavaY) and key_jump){
        y = max(waterfallY, lavaY);
        vsp = 0;
    }
	
	if(!place_meeting(x, y, oCheeseWaterfall) and !place_meeting(x, y, oCheeseLava)){
		state = PSTATE.IDLE;
	}
	
	move_n_collide(collision_objects);
}
