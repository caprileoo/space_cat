//Step event

timer++;

if (timer >= room_speed * 4) { // 4 seconds
    if (state == RSTATE.IDLE) {
        state = RSTATE.WALK;
    } else if (state == RSTATE.WALK) {
		state = RSTATE.IDLE;
    }
    timer = 0;
}

if (abs(target.x - x) <= 100 and abs(target.y - y) <= 50 and state != RSTATE.HIT and state != RSTATE.DEAD and on_ground()) {
    hsp = 0;
    state = RSTATE.ATK;
} else if ((abs(target.x - x) > 100 or abs(target.y - y) > 50) and state == RSTATE.ATK) {
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