function approach(_start, _end, _shift){
	if (_start < _end) {
		return min(_start + _shift, _end); 
	} else {
		return max(_start - _shift, _end);
	}
}

function move_n_collide(){		
	repeat(abs(hsp)) {
		if (!place_meeting(x + sign(hsp), y, Owall)) {
	        x += sign(hsp);
	    } else {
	        hsp = 0;
	        break;
	    }
	}
	
	repeat(abs(vsp)) {
	    if (!place_meeting(x, y + sign(vsp), Owall)) {
	        y += sign(vsp);
	    } else {
	        vsp = 0;
	        break;
	    }
	}
}

function moving(){
	var move = key_right - key_left;

	if (key_right ^ key_left){
		hsp = approach(hsp, move * walksp, walksp / accel_time)
	}
	else hsp = approach(hsp, 0, walksp / deccel_time)
}

function shing(){
	if(key_atk and (on_ground())) state = PSTATE.ATTACK_SLASH;
}

function pew(){
	if(key_plasma and (on_ground())) state = PSTATE.CHARGE;
}

function get_dir(){
	if (key_right) {
		dir = 0;
	} else if (key_left) {
		dir = 180;
	}
}

function on_ground(){
	return place_meeting(x,y + 1,Owall);
}

function check_jump(){
	return key_jump and on_ground();
}
	
//function apply_fall_damage(_max_fall_speed, _fall_damage_rate) {
//    if (vsp > 0) {
//        fall_speed += vsp;
//    } else {
//        fall_speed = 0;
//    }

//    if (fall_speed > _max_fall_speed) {
//        hp -= fall_speed * _fall_damage_rate;
//    }
//}