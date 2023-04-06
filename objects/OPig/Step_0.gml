switch (state)
{
	case ESTATE.STATUS: EState_Status(); break;
	case ESTATE.FREE: EState_Free(); break;
	case ESTATE.CHASE: EState_Chase(); break;
	case ESTATE.ATK: EState_Atk(); break;
	case ESTATE.HIT: EState_Hit(); break;
	case ESTATE.DEAD: EState_Dead(); break;
}