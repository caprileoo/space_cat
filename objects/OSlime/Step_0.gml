//Step Event

timer++;

if (timer >= room_speed * 4) { // 4 seconds
    if (state == SSTATE.IDLE) {
        state = SSTATE.WALK;
    } else if (state == SSTATE.WALK) {
		state = SSTATE.IDLE;
    }
    timer = 0;
}

if (abs(target.x - x) <= detectionRadius and abs(target.y - y) <= 50 and on_ground() and state != SSTATE.HIT and state != SSTATE.DEAD) {
	if (abs(target.x - x) <= 12) {
		attacking = true;
		hsp = 0;
	    state = SSTATE.ATK;
	} else if (abs(target.x - x) > 12 and attacking == false){
		state = SSTATE.CHASE;
	}
} else if ((abs(target.x - x) > detectionRadius or abs(target.y - y) > 50) and (state == SSTATE.CHASE or state == SSTATE.ATK)) {
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