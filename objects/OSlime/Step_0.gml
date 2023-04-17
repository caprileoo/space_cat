switch (state)
{
	case SSTATE.STATUS: SState_Status(); break;
	case SSTATE.FREE: SState_Free(); break;
	case SSTATE.CHASE: SState_Chase(); break;
	case SSTATE.ATK: SState_Atk(); break;
	case SSTATE.HIT: SState_Hit(); break;
	case SSTATE.DEAD: SState_Dead(); break;
}