switch (state)
{
	case RSTATE.FREE: RState_Free(); break;
	case RSTATE.ATK: RState_Atk(); break;
	case RSTATE.HIT: RState_Hit(); break;
	case RSTATE.DEAD: RState_Dead(); break;
}
show_debug_message(moveDirection);