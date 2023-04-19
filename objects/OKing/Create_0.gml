hascontrol = true;

/**Physics**/
dir = 0;
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
max_vsp = 4;
walksp = 0.5; //walking speed
max_walksp = 3; //maximum walking speed
fuel = 10000;
max_fuel = 10000;


//solve for grv dynamically
coyote_time = 0;
coyote_time_max = 15;
j_height = 68;
time_to_apex = 28;
grv = (2 * j_height) / power(time_to_apex, 2);
j_velocity = -abs(grv) * time_to_apex;
stopping_grv = grv + 0.35;

//Player's States
state = PSTATE.FREE;
hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 6;

//Plasma
plasma_charge_time = 0;

enum PSTATE
{
    FREE,
    ATTACK_SLASH,
	CHARGE,
	RELEASE,
    HIT,
    DEAD
}

image_index = irandom(10);

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

function moving(){
	var move = key_right - key_left; //calculate movements

    if (move != 0) {
        walksp += 0.1;
        walksp = min(walksp, max_walksp);
    } else {
        walksp = 2.5;
    }
	hsp = move * walksp; //move speed
}

function jumping(){
	if(check_jump()){
		vsp = j_velocity;
		coyote_time = 0;
		if(!key_jump){
			vsp += stopping_grv;
			if (vsp > max_vsp) vsp = max_vsp;
		} else{
			vsp += grv;
			if (vsp > max_vsp) vsp = max_vsp;
		}
	}
}

function fuel_regen(){
	if (fuel < max_fuel and (on_ground(Owall) or on_ground(OPlatform)) and !key_jet) {
		fuel += 5;
	}
}

function jet(){
	if(key_jet and fuel > 0){
		vsp = j_velocity / 2;
		if(!key_jet){
			vsp += stopping_grv;
			if (vsp > max_vsp) vsp = max_vsp;
		} else{
			vsp += grv;
			fuel -= 5;
			if (vsp > max_vsp) vsp = max_vsp;
		}
	}
}

function shing(){
	if(key_atk and (on_ground(Owall) or on_ground(OPlatform))) state = PSTATE.ATTACK_SLASH;
}

function pew(){
	if(key_plasma and (on_ground(Owall) or on_ground(OPlatform))) state = PSTATE.CHARGE;
}

function get_dir(){
	if (key_right) {
		dir = 0;
	} else if (key_left) {
		dir = 180;
	}
}

function on_ground(_obj){
	return place_meeting(x,y+1,_obj);
}

function animation(){
	if (!on_ground(Owall) and !on_ground(OPlatform))
    {
        sprite_index = SKingAir;
        image_speed = 0;
    }
    else
    {
        image_speed = 1;
        if (hsp == 0)
        {
            sprite_index = sKing;
        }
        else
        {
            sprite_index = SKingRun;
        }
    }

    if (hsp != 0) image_xscale = sign(hsp); //player sprite turn around
}

function coyotetime(){
	if(coyote_time > 0) coyote_time --;
	if (on_ground(Owall) or on_ground(OPlatform)){
		coyote_time = coyote_time_max;
	}
}

function check_jump(){
	return coyote_time > 0 and key_jump;
}