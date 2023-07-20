//Step Event

if(hp <= 0){
	state = RSTATE.DEAD;
}

turnTimer++;

if (on_ground_specific(turn_objects) and turnTimer >= room_speed * 2) {
    moveDirection *= -1;
    state = RSTATE.IDLE;
	turnTimer = 0;
}

timer++;

if (timer >= room_speed * 4) { // 4 seconds
    if (state == RSTATE.IDLE) {
        state = RSTATE.WALK;
    } else if (state == RSTATE.WALK) {
		state = RSTATE.IDLE;
    }
    timer = 0;
}

if(state != RSTATE.ATK){
	attacking = false;
}

if (abs(target.x - x) <= 120 and abs(target.y - y) <= 40 and on_ground() and state != RSTATE.HIT and state != RSTATE.DEAD) {
	if (abs(target.x - x) <= 100) {
		hsp = 0;
	    state = RSTATE.ATK;
	} else if (abs(target.x - x) > 100 and attacking = false){
		state = RSTATE.CHASE;
	}
} else if ((abs(target.x - x) > 120 or abs(target.y - y) > 40) and (state == RSTATE.CHASE or state == RSTATE.ATK)) {
    state = RSTATE.IDLE;
}

switch (state)
{
	case RSTATE.IDLE: RState_Idle(); break;
	case RSTATE.WALK: RState_Walk(); break;
	case RSTATE.CHASE: RState_Chase(); break;
	case RSTATE.ATK: RState_Atk(); break;
	case RSTATE.HIT: RState_Hit(); break;
	case RSTATE.DEAD: RState_Dead(); break;
}