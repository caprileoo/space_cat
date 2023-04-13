function PState_Charge(){
	show_debug_message("Charging");
	charge += 1;
	if (charge > max_charge) {
		charge = max_charge;
	}
	if(charge >= 1){
		state = PSTATE.FREE;
	}
}