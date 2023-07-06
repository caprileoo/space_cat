//User event

function hitwall(){
    for (var i = 0; i < array_length(hit_wall_objects); i++) {
        if (place_meeting(x + 1, y, hit_wall_objects[i])) {
            return true;
        }
    }
    return false;
}

function hitwall_specific(_objs){
    for (var i = 0; i < array_length(_objs); i++) {
        if (place_meeting(x + 1, y, _objs[i])) {
            return true;
        }
    }
    return false;
}

function on_ground(){
    for (var i = 0; i < array_length(on_ground_objects); i++) {
        if (place_meeting(x, y + 1, on_ground_objects[i])) {
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

function move_n_collide(_obj){	
	var i;
	for (i = 0; i < array_length(_obj); i++) {
	    if (place_meeting(x + hsp, y, _obj[i])) {
	        while (!place_meeting(x + sign(hsp), y, _obj[i])) {
	            x += sign(hsp);
	        }
	        hsp = 0;
	    }
	}
	x += hsp;

	// Vertical movement
	for (i = 0; i < array_length(_obj); i++) {
	    if (place_meeting(x, y + vsp, _obj[i])) {
	        while (!place_meeting(x, y + sign(vsp), _obj[i])) {
	            y += sign(vsp);
	        }
	        vsp = 0;
	    }
	}
	y += vsp;
}