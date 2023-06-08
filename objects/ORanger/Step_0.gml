if(hitwall()){
	moveDirection *= -1;
}

if (state == RSTATE.WALK || state == RSTATE.IDLE) {
    stateTimer++;
    if (stateTimer >= stateDuration) {
        if (state == RSTATE.WALK) {
			hsp = 0;
            state = RSTATE.IDLE;
        } else {
			moveDirection *= -1;
            state = RSTATE.WALK;
        }
        stateTimer = 0;
    }
}

if (abs(x - target.x) <= detectionRadius) {
	hsp = 0;
    state = RSTATE.ATK;
} else if (state == RSTATE.ATK) {
	hsp = 0;
    state = RSTATE.IDLE;
}

switch (state)
{
	case RSTATE.WALK: RState_Walk(); break;
	case RSTATE.IDLE: RState_Idle(); break;
	case RSTATE.ATK: RState_Atk(); break;
	case RSTATE.HIT: RState_Hit(); break;
	case RSTATE.DEAD: RState_Dead(); break;
}