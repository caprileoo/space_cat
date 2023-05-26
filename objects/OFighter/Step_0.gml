switch (state)
{
	case FSTATE.STATUS: FState_Status(); break;
	case FSTATE.FREE: FState_Free(); break;
	case FSTATE.CHASE: FState_Chase(); break;
	case FSTATE.LEFTATK: FState_Atk_Left(); break;
	case FSTATE.RIGHTATK: FState_Atk_Right(); break;
	case FSTATE.HIT: FState_Hit(); break;
	case FSTATE.DEAD: FState_Dead(); break;
}