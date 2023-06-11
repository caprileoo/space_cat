function PState_HitByMelee(){
	vsp += grv;
	
	//Stun
	frameCount++;
	if (frameCount < 3){
		//Just hit
		if (hitNow)
		{
			sprite_index = SCatHit;
			image_index = 0;
			hitNow = false;
			frameCount = 0;
			// Apply a bounce effect when hitting the ground
			if (place_meeting(x, y + vsp, Owall) or place_meeting(x, y + vsp, OEdge)) {
				vsp = -abs(vsp) * 5;
			}
		}
	} else if (frameCount > 3) {
		frameCount = 0;
		state = PSTATE.IDLE;
	}
	
	move_n_collide(collision_objects);
	
	show_debug_message(hsp);
}