function RState_Walk() {
	vsp += grv;
	
	image_speed = 1;
	sprite_index = SRMouseRun;
	image_xscale = moveDirection; //ranged enemy sprite turn around
	
	if(hitwall()){
		moveDirection *= -1;
	}
	
	hsp = moveDirection; //divide = low speed | multiply = high speed
	
	move_n_collide();
	update();
}

