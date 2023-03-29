if(hascontrol) {
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A")); //Hold
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D")); //Hold
	key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up); //Press
	//key_sprint_hold = keyboard_check(vk_shift); //Hold
	key_atk = keyboard_check_pressed(ord("K")) or keyboard_check_pressed(ord("L")); //Attack
}
else {
	key_right = 0
	key_left = 0
	key_jump = 0
	key_atk = 0
}
switch(state)
{
	case PSTATE.FREE: PState_Free(); break;
	case PSTATE.ATTACK_SLASH: PState_Atk_Slash(); break;
}
