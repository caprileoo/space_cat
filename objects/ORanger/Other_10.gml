//function on_ground_specific(_obj){
//	return place_meeting(x,y + 1,_obj);
//}

function on_ground(){
	return place_meeting(x, y + 1,Owall);
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

function move_n_collide(){	
    if (place_meeting(x+hsp,y,Owall))
    {
        while (!place_meeting(x+sign(hsp),y,Owall))
        {
            x = x + sign(hsp);
        }
        hsp = 0;
    }

    /**platform vertical collision**/
    if (place_meeting(x,y+vsp,Owall))
    {
        while (!place_meeting(x,y+sign(vsp),Owall))
        {
            y += sign(vsp);
        }
        vsp = 0;
    }
}

function update(){
	x = x + hsp;
	y = y + vsp;
}