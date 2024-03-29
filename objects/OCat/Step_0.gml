#region Game Settings

if(hascontrol) {
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A")); //Hold
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D")); //Hold
	key_jump = keyboard_check(vk_space) or keyboard_check(vk_up); //Hold
	key_atk = keyboard_check_pressed(ord("K")); //Press
	key_plasma = keyboard_check(ord("L")); //Hold
	key_fly = keyboard_check(ord("J")); //Hold
}
else {
	key_right = 0
	key_left = 0
	key_jump = 0
	key_atk = 0
	key_plasma = 0
}

if(hp <= 0){
	state = PSTATE.DEAD;
}

if(key_fly){
	vsp -= 0.7;
}

#endregion

#region Animation

switch (state) {
    case PSTATE.IDLE_CHARGE:
        sprite_index = SCatShootIdle;
        break;
    case PSTATE.WALK_CHARGE:
        sprite_index = SCatShootRun;
        break;
    case PSTATE.RISING_CHARGE:
        sprite_index = SCatShootAir;
        if (vsp > -2) {
            sprite_index = SCatShootMidAir;
        }
        break;
    case PSTATE.FALLING_CHARGE:
        sprite_index = SCatShootFall;
        break;
    case PSTATE.IDLE:
        if (touching_wall() and on_ground()) {
            if (plasma_using) {
                sprite_index = SCatShootIdle;
            } else {
                sprite_index = sCat;
            }
        } else {
            if (plasma_using) {
                sprite_index = SCatShootIdle;
            } else {
                sprite_index = sCat;
            }
        }
        break;
    case PSTATE.WALK:
        if (touching_wall() and on_ground()) {
            if (plasma_using) {
                sprite_index = SCatShootIdle;
            } else {
                sprite_index = sCat;
            }
        } else {
            if (plasma_using) {
                sprite_index = SCatShootRun;
            } else {
                sprite_index = sCatRun;
            }
        }
        break;
    case PSTATE.RISING:
        if (plasma_using) {
            sprite_index = SCatShootAir;
            if (vsp > -2) {
                sprite_index = SCatShootMidAir;
            }
        } else {
            sprite_index = sCatAir;
            if (vsp > -2) {
                sprite_index = SCatMidAir;
            }
        }
        break;
    case PSTATE.FALLING:
        if (plasma_using) {
            sprite_index = SCatShootFall;
        } else {
            sprite_index = SCatFall;
        }
		break;
	case PSTATE.SWIMMING:
		if(place_meeting(x, y, oCheeseWaterfall)){
			sprite_index = sCatSwim02;
		}
}

#endregion

#region Obstacles

if(place_meeting(x, y, obj_spikes) or place_meeting(x, y, ODeathWall)){
	state = PSTATE.DEAD;
}

if(place_meeting(x, y, oCheeseLava)){
	lava_timer++;
	
	if(lava_timer == room_speed){
		hp -= 1;
		lava_timer = 0;
	}
}

#endregion

#region Plasma Attack

if(!key_plasma and ++reload_time = room_speed * 2){
	energy += 1;
	reload_time = 0;
	if(energy >= max_energy) energy = max_energy;
}

if(key_atk){
	plasma_using = false;
}

if(plasma_hold >= room_speed * 2 and !key_atk){
	plasma_hold = 0;
	plasma_using = false;
}

if(plasma_using == true and !key_atk){
	plasma_hold++;
	if(key_plasma) plasma_hold = 0;
}

#endregion

switch(state)
{
	case PSTATE.IDLE: PState_Idle(); break;
	case PSTATE.WALK: PState_Walk(); break;
	case PSTATE.RISING: PState_Rising(); break;
	case PSTATE.FALLING: PState_Falling(); break;
	case PSTATE.SWIMMING: PState_Swim(); break;
	
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
