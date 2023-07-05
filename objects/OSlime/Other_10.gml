//User Event

//function hitwall_specific(_obj){
//	return place_meeting(x + hsp, y, _obj);
//}

function on_ground_specific(_obj){
	return place_meeting(x,y + 1,_obj);
}

function on_ground(){
	return place_meeting(x,y + 1,Owall);
}

function hitwall(){
	return place_meeting(x + hsp, y, Owall);
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