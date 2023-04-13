function PState_Charge(){
	show_debug_message("Charging");
	plasma_charge_time += 1;
	if(!key_plasma){
		state = PSTATE.RELEASE;
	}
}