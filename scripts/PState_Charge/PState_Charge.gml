// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PState_Charge(){
	charge += 1;
	if (charge > max_charge) {
		charge = max_charge;
	}
	state = PSTATE.FREE;
}