hsp = 0;
vsp = 0; //vertical speed
max_vsp = 4;
moveDirection = 1; // -1 for left, 1 for right
moveTimer = 0;
moveDuration = room_speed * 3; // 3 seconds

//solve for grv dynamically
j_height = 60;
time_to_apex = 20; //jump time
grv = (2 * j_height) / power(time_to_apex, 2);
j_velocity = -abs(grv) * time_to_apex;
stopping_grv = grv + 0.35;

//Hit
hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 20;
state = FSTATE.STATUS;

detectionRadius = 100;
target = instance_nearest(x, y, OCat);

enum FSTATE
{
	STATUS,
	FREE,
	CHASE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);
function on_ground(){
	return place_meeting(x,y + 1,Owall);
}

function hitwall(){
	return place_meeting(x + 1, y, Owall);
}

function get_dir(){
	if (image_xscale = 1) {
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

function jump(){
	if(on_ground() and hitwall()) {
		vsp = j_velocity;
		if(!on_ground()){
			vsp += stopping_grv;
			if (vsp > max_vsp) vsp = max_vsp;
		} else{
			vsp += grv;
			if (vsp > max_vsp) vsp = max_vsp;
		}
	}
}

function move_n_chase(){
	moveDirection = sign(target.x - x); // Move towards the target
	hsp = moveDirection * 1.3; //divide = low speed | multiply = high speed
}

function roaming(){
	moveTimer++;
	if (moveTimer >= moveDuration) {
		moveDirection *= -1; // Change direction
		moveTimer = 0; // Reset timer
	}
	
	if(hitwall()){
		moveDirection *= 1; //Change direction
	}
	
	if (place_meeting(x + hsp, y, Owall)) {
		// If there is a wall collision, chagne direction
		moveDirection *= -1; // Change direction
	}
	hsp = moveDirection; //divide = low speed | multiply = high speed
}

function animation(){
	if (!on_ground()){
		if(vsp < 0){ //jump when vsp is negative
			sprite_index = SFMouseJump;
			image_speed = 0;
		} else {
			sprite_index = SFMouseFall;	
			image_speed = 0;
		}
	} 
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = SFMouseIdle;
		}
		else
		{
			sprite_index = SFMouseRun;
		}
	}
	if (hsp != 0) image_xscale = sign(hsp); //enemy sprite turn around
}
