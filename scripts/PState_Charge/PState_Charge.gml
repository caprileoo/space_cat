function PState_Charge(){
	hsp = 0;
	vsp = 0;
	
	move_n_collide();

	plasma_charge_time += 1;
	if(!key_plasma){
		state = PSTATE.RELEASE;
	}
}