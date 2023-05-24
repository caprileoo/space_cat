function PState_Charge(){
	plasma_charge_time++;
	if(!key_plasma){
		hsp = 0;
		vsp = 0;
		state = PSTATE.RELEASE;
	}
	move_n_collide();
}