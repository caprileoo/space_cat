switch (state)
{
	case RSTATE.STATUS: RState_Status(); break;
	case RSTATE.WAIT: RState_Wait(); break;
	case RSTATE.FREE: RState_Free(); break;
	case RSTATE.CHASE: RState_Chase(); break;
	case RSTATE.ATK: RState_Atk(); break;
	case RSTATE.HIT: RState_Hit(); break;
	case RSTATE.DEAD: RState_Dead(); break;
}