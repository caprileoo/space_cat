can_jump -= 1;
if(can_jump <= 0) can_jump = 0;

if(hascontrol) {
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A")); //Hold
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D")); //Hold
	key_jump = keyboard_check(vk_space) or keyboard_check(vk_up); //Hold
	key_atk = keyboard_check_pressed(ord("K")); //Press
	key_plasma = keyboard_check(ord("L")); //Hold
}
else {
	key_right = 0
	key_left = 0
	key_jump = 0
	key_atk = 0
	key_plasma = 0
}
switch(state)
{
	case PSTATE.IDLE: PState_Idle(); break;
	case PSTATE.WALK: PState_Walk(); break;
	case PSTATE.RISING: PState_Rising(); break;
	case PSTATE.FALLING: PState_Falling(); break;
	case PSTATE.CHARGE: PState_Charge(); break;
	case PSTATE.RELEASE: PState_Release(); break;
	case PSTATE.ATTACK_SLASH: PState_Atk_Slash(); break;
	case PSTATE.HIT: PState_Hit(); break;
	case PSTATE.DEAD: PState_Dead(); break;
}

//show_debug_message("Pre_Idle {0}", pre_idle);
//show_debug_message("Pre_Walk {0}", pre_move);
//show_debug_message("Can_Jump_Timer {0}", can_jump_timer);

show_debug_message(can_jump);