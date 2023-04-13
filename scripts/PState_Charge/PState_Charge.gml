function PState_Charge(){
	plasma_charge_time += 1;
	if(!key_plasma){
		state = PSTATE.RELEASE;
	}
}