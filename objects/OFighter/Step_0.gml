//Step Event

timer++;

if (timer >= room_speed * 4) { // 4 seconds
    if (state == FSTATE.IDLE) {
        state = FSTATE.WALK;
    } else if (state == FSTATE.WALK) {
		state = FSTATE.IDLE;
    }
    timer = 0;
}

if (abs(target.x - x) <= detectionRadius and abs(target.y - y) <= 50 and on_ground() and state != FSTATE.HIT and state != FSTATE.DEAD) {
	if (abs(target.x - x) <= 17) {
		attacking = true;
		hsp = 0;
	    state = FSTATE.ATK;
	} else if(abs(target.x - x) > 17 and attacking == false){
		state = FSTATE.CHASE;
	}
} else if ((abs(target.x - x) > detectionRadius or abs(target.y - y) > 50) and (state == FSTATE.CHASE or state == FSTATE.ATK)) {
    state = FSTATE.IDLE;
}

switch (state)
{
	case FSTATE.IDLE: FState_Idle(); break;
	case FSTATE.WALK: FState_Walk(); break;
	case FSTATE.CHASE: FState_Chase(); break;
	case FSTATE.ATK: FState_Atk(); break;
	case FSTATE.HIT: FState_Hit(); break;
	case FSTATE.DEAD: FState_Dead(); break;
}

show_debug_message(hp);