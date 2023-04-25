switch (state)
{
	case FSTATE.STATUS: FState_Status(); break;
	case FSTATE.FREE: FState_Free(); break;
	case FSTATE.CHASE: FState_Chase(); break;
	case FSTATE.ATK: FState_Atk(); break;
	case FSTATE.HIT: FState_Hit(); break;
	case FSTATE.DEAD: FState_Dead(); break;
}