if(hp < 0) hp = 0;

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


if(!key_plasma and ++reload_time = room_speed * 2){
	energy += 1;
	reload_time = 0;
	if(energy >= max_energy) energy = max_energy;
}

if (on_ground_specific(cheese_platforms)) {
    if (++cheese_timer == room_speed * 3) {
        var platform = instance_place(x, y + 1, OCheeseMain);
        if (platform != noone) {
            with (platform) {
                instance_destroy();
            }
        }
        cheese_timer = 0;
    }
} else {
    cheese_timer = 0;
}

switch(state) {
    case PSTATE.IDLE:
        sprite_index = sCat;
        break;
    case PSTATE.WALK:
        sprite_index = sCatRun;
        break;
    case PSTATE.RISING:
        sprite_index = sCatAir;
        if(vsp > -2){
            sprite_index = SCatMidAir;
        }
        break;
    case PSTATE.FALLING:
        sprite_index = SCatFall;
        break;
    case PSTATE.IDLE_CHARGE:
    case PSTATE.IDLE_RELEASE:
        sprite_index = SCatShootIdle;
        break;
    case PSTATE.WALK_CHARGE:
    case PSTATE.WALK_RELEASE:
        sprite_index = SCatShootRun;
        break;
    case PSTATE.RISING_CHARGE:
    case PSTATE.RISING_RELEASE:
        sprite_index = SCatShootAir;
        if(vsp > -2){
            sprite_index = SCatShootMidAir;
        }
        break;
    case PSTATE.FALLING_CHARGE:
    case PSTATE.FALLING_RELEASE:
        sprite_index = SCatShootFall;
        break;
}


switch(state)
{
	case PSTATE.IDLE: PState_Idle(); break;
	case PSTATE.WALK: PState_Walk(); break;
	case PSTATE.RISING: PState_Rising(); break;
	case PSTATE.FALLING: PState_Falling(); break;
	
	case PSTATE.IDLE_CHARGE: PState_Idle_Charge(); break;
	case PSTATE.WALK_CHARGE: PState_Walk_Charge(); break;
	case PSTATE.RISING_CHARGE: PState_Rising_Charge(); break;
	case PSTATE.FALLING_CHARGE: PState_Falling_Charge(); break;
	
	case PSTATE.IDLE_RELEASE: PState_Idle_Release(); break;
	case PSTATE.WALK_RELEASE: PState_Walk_Release(); break;
	case PSTATE.RISING_RELEASE: PState_Rising_Release(); break;
	case PSTATE.FALLING_RELEASE: PState_Falling_Release(); break;
	
	case PSTATE.COMBO1: PState_Atk_Slash1(); break;
	case PSTATE.COMBO2: PState_Atk_Slash2(); break;
	case PSTATE.COMBO3: PState_Atk_Slash3(); break;
	
	case PSTATE.MELEE1: PState_HitByMelee1(); break;
	case PSTATE.MELEE2: PState_HitByMelee2(); break;
	case PSTATE.SLIME: PState_HitBySlime(); break;
	case PSTATE.RANGER: PState_HitByRanger(); break;
	case PSTATE.DEAD: PState_Dead(); break;
}