//function on_ground_specific(_obj){
//	return place_meeting(x,y + 1,_obj);
//}

function on_ground(){
	return place_meeting(x,y + 1,Owall);
}

function hitwall(){
	return place_meeting(x + 1, y, Owall);
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

function move_n_chase(){
	moveDirection = sign(target.x - x); // Move towards the target
	hsp = moveDirection; //divide = low speed | multiply = high speed
}

function roaming(){
	moveTimer++;
	if (moveTimer >= moveDuration) {
		moveDirection *= -1; // Change direction
		moveTimer = 0; // Reset timer
	}
	
	if (hitwall()) {
		moveDirection *= -1; // Change direction
	}
	hsp = moveDirection; //divide = low speed | multiply = high speed
}

function animation(){
    if (on_ground()) {
        image_speed = 0;
        if (hsp == 0 and state != RSTATE.ATK) {
            sprite_index = SRMouseIdle;
        } else {
            sprite_index = SRMouseRun;
        } 
    }
    image_xscale = moveDirection; //ranged enemy sprite turn around
}