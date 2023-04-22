hsp = 0;
vsp = 0;
grv = 0.3;
moveDirection = 1; // -1 for left, 1 for right
moveTimer = 0;
moveDuration = room_speed * 3; // 3 seconds


hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 20;
state = ESTATE.STATUS;

detectionRadius = 100;
target = instance_nearest(x, y, OKing);

enum ESTATE
{
	STATUS,
	FREE,
	CHASE,
	ATK,
	HIT,
	DEAD
}
image_index = irandom(10);
function on_ground(_obj){
	return place_meeting(x,y+1,_obj);
}

function hitwall(_obj){
	return place_meeting(x + hsp, y, _obj);
}

function move_n_collide(_obj){	
    if (place_meeting(x+hsp,y,_obj))
    {
        while (!place_meeting(x+sign(hsp),y,_obj))
        {
            x = x + sign(hsp);
        }
        hsp = 0;
    }

    /**platform vertical collision**/
    if (place_meeting(x,y+vsp,_obj))
    {
        while (!place_meeting(x,y+sign(vsp),_obj))
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
	hsp = moveDirection * 2; //divide = low speed | multiply = high speed
}

function roaming(){
	moveTimer++;
	if (moveTimer >= moveDuration) {
		moveDirection *= -1; // Change direction
		moveTimer = 0; // Reset timer
	}
	
	if(hitwall(Owall)){
		moveDirection *= 1; //Change direction
	}
	
	if (place_meeting(x + hsp, y, Owall)) {
		// If there is a wall collision, chagne direction
		moveDirection *= -1; // Change direction
	}
	hsp = moveDirection; //divide = low speed | multiply = high speed
}

function animation(){
	if (!place_meeting(x,y+1,Owall)) and (!place_meeting(x,y+1,OPlatform))	
	{
		sprite_index = SPigIdle;	
		image_speed = 0;
	}
	else
	{
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = SPigIdle;
		}
		else
		{
			sprite_index = SPigRun;
		}
	}
	if (hsp != 0) image_xscale = sign(hsp); //enemy sprite turn around
}