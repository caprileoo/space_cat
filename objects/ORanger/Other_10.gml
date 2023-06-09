//function hitwall_specific(_obj){
//	return place_meeting(x + hsp, y, _obj);
//}

function on_ground_specific(_obj){
	return place_meeting(x,y + 1,_obj);
}

function on_ground(){
	return place_meeting(x, y + 1,Owall) or place_meeting(x, y + 1,OEdge);
}

function hitwall(){
	return place_meeting(x + hsp, y, Owall);
}

function get_dir(){
	if (moveDirection = 1) {
		dir = 0;
	} else {
		dir = 180;
	}
}

function move_n_collide(_obj_array){	
	var i;
	for (i = 0; i < array_length_1d(_obj_array); i++) {
	    if (place_meeting(x + hsp, y, _obj_array[i])) {
	        while (!place_meeting(x + sign(hsp), y, _obj_array[i])) {
	            x += sign(hsp);
	        }
	        hsp = 0;
	    }
	}
	x += hsp;

	// Vertical movement
	for (i = 0; i < array_length_1d(_obj_array); i++) {
	    if (place_meeting(x, y + vsp, _obj_array[i])) {
	        while (!place_meeting(x, y + sign(vsp), _obj_array[i])) {
	            y += sign(vsp);
	        }
	        vsp = 0;
	    }
	}
	y += vsp;
}