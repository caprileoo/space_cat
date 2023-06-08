timer++;

if (timer >= room_speed * 4) { // 4 seconds
    if (state == RSTATE.IDLE) {
        state = RSTATE.WALK;
    } else if (state == RSTATE.WALK) {
        hsp = 0;
        state = RSTATE.IDLE;
    }
    timer = 0;
}

if (abs(target.x - x) <= 100 && abs(target.y - y) <= 0 && state != RSTATE.HIT && state != RSTATE.DEAD && on_ground()) {
    hsp = 0;
    state = RSTATE.ATK;
} else if ((abs(target.x - x) > 100 || abs(target.y - y) > 0) && state == RSTATE.ATK) {
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