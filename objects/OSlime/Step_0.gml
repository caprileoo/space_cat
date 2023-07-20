//Step Event

if(hp <= 0){
	state = SSTATE.DEAD;
}

turnTimer++;

if (on_ground_specific(turn_objects) and turnTimer >= room_speed * 2) {
    moveDirection *= -1;
    state = SSTATE.IDLE;
	turnTimer = 0;
	out_of_reach = true;
}

timer++;

if (timer >= room_speed * 4) { // 4 seconds
    if (state == SSTATE.IDLE) {
        state = SSTATE.WALK;
    } else if (state == SSTATE.WALK) {
		state = SSTATE.IDLE;
    }
    timer = 0;
}

if(state != SSTATE.ATK){
	attacking = false;
}

if (abs(target.x - x) <= 120 and abs(target.y - y) <= 40 and on_ground() and state != SSTATE.HIT and state != SSTATE.DEAD) {
	if (abs(target.x - x) <= 10 and out_of_reach == false) {
		hsp = 0;
	    state = SSTATE.ATK;
	} else if (abs(target.x - x) > 10 and attacking = false and out_of_reach == false){
		state = SSTATE.CHASE;
	}
} else if ((abs(target.x - x) > 120 or abs(target.y - y) > 40)) {
	out_of_reach = false;
}

switch (state)
{
	case SSTATE.IDLE: SState_Idle(); break;
	case SSTATE.WALK: SState_Walk(); break;
	case SSTATE.CHASE: SState_Chase(); break;
	case SSTATE.ATK: SState_Atk(); break;
	case SSTATE.HIT: SState_Hit(); break;
	case SSTATE.DEAD: SState_Dead(); break;
}