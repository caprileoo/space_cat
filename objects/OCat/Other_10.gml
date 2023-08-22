function approach(argument0, argument1, argument2){
	if (argument0 < argument1) {
		return min(argument0 + argument2, argument1); 
	} else {
		return max(argument0 - argument2, argument1);
	}
}

function move_n_collide(_obj) {
    var i;
    var collision = false;
    for (i = 0; i < array_length(_obj); i++) {
        if (place_meeting(x + hsp, y, _obj[i])) {
            collision = true;
            break;
        }
    }
    if (!collision) {
        x += hsp;
    } else {
        hsp = 0;
    }

    collision = false;
    for (i = 0; i < array_length(_obj); i++) {
        if (place_meeting(x, y + vsp, _obj[i])) {
            collision = true;
            break;
        }
    }
    if (!collision) {
        y += vsp;
    } else {
        vsp = 0;
    }
}

function moving(){
	var move = key_right - key_left;

	if (key_right xor key_left){
		hsp = approach(hsp, move * walksp, walksp / accel_time)
	}
	else hsp = approach(hsp, 0, walksp / deccel_time)
}

function get_dir(){
	if (image_xscale = 1) {
		dir = 0;
	} else {
		dir = 180;
	}
}

function on_ground(){
    for (var i = 0; i < array_length(collision_objects); i++) {
        if (place_meeting(x, y + 1, collision_objects[i])) {
            return true;
        }
    }
    return false;
}

function on_ground_specific(_objs) {
    for (var i = 0; i < array_length(_objs); i++) {
        if (place_meeting(x, y + 1, _objs[i])) {
            return true;
        }
    }
    return false;
}

function touching_wall() {
    var move = key_right - key_left;

    for (var i = 0; i < array_length(collision_objects); i++) {
        if (move > 0 and place_meeting(x + 1, y, collision_objects[i])) {
            return true;
        } else if (move < 0 and place_meeting(x - 1, y, collision_objects[i])) {
            return true;
        }
    }
    return false;
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