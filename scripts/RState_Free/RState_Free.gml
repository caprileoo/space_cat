function RState_Free() {
	
	vsp += grv;

	sprite_index = SRMouseRun;
	
	//moveTimer++;
	//if (moveTimer >= moveDuration) {
	//	moveDirection *= -1; // Change direction
	//	moveTimer = 0; // Reset timer
	//}
	
	if (hitwall()) {
		moveDirection *= -1; // Change direction
	}
	hsp = moveDirection; //divide = low speed | multiply = high speed
	
	image_xscale = moveDirection; //ranged enemy sprite turn around
	
	move_n_collide();
	update();
	
	if(abs(x - target.x) <= detectionRadius){
		image_index = 0;
		state = RSTATE.ATK;
	}
}

