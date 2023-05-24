hsp = 0;
vsp = 0;
grv = 0.3;
move_alarm = 0;
rest_alarm = 0;
moving_time = 10;
resting_time = 5;
moveDirection = 1; // -1 for left, 1 for right
moveTimer = 0;
moveDuration = room_speed * 5;

hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 10;
state = SSTATE.STATUS;

detectionRadius = 100;
target = instance_nearest(x, y, OCat);

enum SSTATE
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
	return place_meeting(x,y+1,Owall);
}

function hitwall(){
	return place_meeting(x + hsp, y, Owall);
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
	   
	if (move_alarm > 0) {
	    move_alarm--;
	    hsp = moveDirection * 2;
	} else if (rest_alarm > 0) {
	    rest_alarm--;
	    hsp = 0;
	} else {
	    move_alarm = moving_time;
	    rest_alarm = resting_time;
	}
}

function roaming(){
	moveTimer++;
	if (moveTimer >= moveDuration) {
	    moveDirection *= -1; // Change direction
	    moveTimer = 0; // Reset timer
	}
	
	if(hitwall()){
		moveDirection *= -1;
	}
	
	if (move_alarm > 0) {
	    move_alarm--;
	    hsp = moveDirection;
	} else if (rest_alarm > 0) {
	    rest_alarm--;
	    hsp = 0;
	} else {
	    move_alarm = moving_time;
	    rest_alarm = resting_time;
	}
}

function animation(){
	if (!place_meeting(x,y+1,Owall))
	{
		sprite_index = SSlimeIdle;	
		image_speed = 0;
	}
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = SSlimeIdle;
		}
		else
		{
			sprite_index = SSlimeMove;
		}
	}
	if (hsp != 0) image_xscale = sign(hsp); //enemy sprite turn around
}