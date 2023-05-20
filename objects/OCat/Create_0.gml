hascontrol = true;

/**Physics**/
dir = 0;
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
fall_speed = 0;
max_vsp = 4;
walksp = 0.5; //walking speed
max_walksp = 3; //maximum walking speed
coyote_time = 0;
coyote_time_max = 15;

//solve for grv dynamically (without grav_bender)
j_height = 68;
time_to_apex = 20;
grv = (2 * j_height) / power(time_to_apex, 2);
j_velocity = -abs(grv) * time_to_apex;
stopping_grv = grv + 0.35;

//solve for grv dynamically (with grav_bender)
j_height_bender = 108;
time_to_apex_bender = 48;
grv_bender = (2 * j_height_bender) / power(time_to_apex_bender, 2);
j_velocity_bender = -abs(grv_bender) * time_to_apex_bender;
stopping_grv_bender = grv_bender + 0.35;

//Player's States
state = PSTATE.FREE;
hitByAttack = ds_list_create();
hitNow = false;
frameCount = 0;
hp = 100;

//Plasma
plasma_charge_time = 0;

enum PSTATE
{
    FREE,
	LOW_GRAV,
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

function grav_bender(){
	if(check_jump()){
		vsp = j_velocity_bender;
		coyote_time = 0;
		if(!key_jump){
			vsp += stopping_grv_bender;
			if (vsp > max_vsp) vsp = max_vsp;
		} else{
			vsp += grv_bender;
			if (vsp > max_vsp) vsp = max_vsp;
		}
	}
}

function shing(){
	if(key_atk and (on_ground(Owall))) state = PSTATE.ATTACK_SLASH;
}

function pew(){
	if(key_plasma and (on_ground(Owall))) state = PSTATE.CHARGE;
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
	if (!on_ground(Owall))
    {
		if(vsp < 0){ //jump when vsp is negative
			sprite_index = sCatAir;
			image_speed = 0;
		} else if(vsp > 0 and vsp < 2.0) {
			sprite_index = SCatMidAir;
			image_speed = 0;		
		} else if(vsp > 2.0) {
			sprite_index = SCatFall;	
			image_speed = 0;
		}
    }
    else
    {
        image_speed = 1;
        if (hsp == 0)
        {
            sprite_index = sCat;
        }
        else
        {
            sprite_index = sCatRun;
        }
    }

    if (hsp != 0) image_xscale = sign(hsp); //player sprite turn around
}

function coyotetime(){
	if(coyote_time > 0) coyote_time --;
	if (on_ground(Owall)){
		coyote_time = coyote_time_max;
	}
}

function check_jump(){
	return coyote_time > 0 and key_jump;
}
	
function apply_fall_damage(_max_fall_speed, _fall_damage_rate) {
    // check if the object is falling
    if (vsp > 0) {
        // increase the fall speed
        fall_speed += vsp;
    } else {
        // if the object is not falling, reset the fall speed
        fall_speed = 0;
    }

    // check if the fall speed exceeds the maximum fall speed
    if (fall_speed > _max_fall_speed) {
        // apply fall damage based on the fall speed and fall damage rate
        hp -= fall_speed * _fall_damage_rate;
    }
}