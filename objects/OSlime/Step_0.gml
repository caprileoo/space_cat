//Step Event

turnTimer++;

if (on_ground_specific(turn_objects) and turnTimer >= room_speed * 2) {
    moveDirection *= -1;
    state = SSTATE.IDLE;
	turnTimer = 0;
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

if (abs(target.x - x) <= 100 and abs(target.y - y) <= 50 and on_ground() and !on_ground_specific(turn_objects) and state != SSTATE.HIT and state != SSTATE.DEAD) {
	if (abs(target.x - x) <= 12) {
		attacking = true;
		hsp = 0;
	    state = SSTATE.ATK;
	} else if (abs(target.x - x) > 12 and attacking == false){
		state = SSTATE.CHASE;
	}
} else if ((abs(target.x - x) > 100 or abs(target.y - y) > 50) and (state == SSTATE.CHASE or state == SSTATE.ATK)) {
	attacking = false;
    state = SSTATE.IDLE;
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