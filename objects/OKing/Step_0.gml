if(hascontrol) {
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A")); //Hold
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D")); //Hold
	key_jump = keyboard_check(vk_space) or keyboard_check(vk_up); //Press
	key_atk = keyboard_check_pressed(ord("K")); //Attack
	key_plasma = keyboard_check(ord("L")); //Plasma Attack
	key_jet = keyboard_check(ord("J"));
}
else {
	key_right = 0
	key_left = 0
	key_jump = 0
	key_atk = 0
	key_jet = 0
}
switch(state)
{
	case PSTATE.FREE: PState_Free(); break;
	case PSTATE.ATTACK_SLASH: PState_Atk_Slash(); break;
	case PSTATE.ATTACK_PLASMA: PState_Atk_Plasma(); break;
	case PSTATE.HIT: PState_Hit(); break;
	case PSTATE.DEAD: PState_Dead(); break;
}
