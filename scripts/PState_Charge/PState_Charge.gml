function PState_Charge(){
	hsp = 0;
	vsp = 0;
	plasma_charge_time += 1;
	if(!key_plasma){
		state = PSTATE.RELEASE;
	}
}