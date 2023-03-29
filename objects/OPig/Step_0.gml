switch (state)
{
	case ESTATE.FREE: EState_Free(); break;
	case ESTATE.HIT: EState_Hit(); break;
	case ESTATE.DEAD: EState_Dead(); break;
}