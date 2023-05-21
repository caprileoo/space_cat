hascontrol = true;

/**Physics**/
dir = 0;
hsp = 0; //horizontal speed
vsp = 0; //vertical speed
max_vsp = 4;

walksp = 2.75; //walking speed
accel_time = 6 // accelerate time in frame
deccel_time = 3 //deccelerate time in frame

coyote_time = 0;
coyote_time_max = 15;

//solve for grv dynamically (without grav_bender)
j_height = 70;
time_to_apex = 32;
grv = (2 * j_height) / power(time_to_apex, 2);
j_velocity = -abs(grv) * time_to_apex;
stopping_grv = grv + 0.35;
fall_speed = 0; //for fall damage

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

function approach(_start, _end, _shift){
	if (_start < _end) {
		return min(_start + _shift, _end); 
	} else {
		return max(_start - _shift, _end);
	}
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

function moving(){
	var move = key_right - key_left;

	if (key_right ^ key_left){
		hsp = approach(hsp, move * walksp, walksp / accel_time)
	}
	else hsp = approach(hsp, 0, walksp / deccel_time)
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
	} else {
		vsp += grv;
		if (vsp > max_vsp) vsp = max_vsp;
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
	var move = key_right - key_left;
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
	if (move != 0) image_xscale = move;
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
    if (vsp > 0) {
        fall_speed += vsp;
    } else {
        fall_speed = 0;
    }

    if (fall_speed > _max_fall_speed) {
        hp -= fall_speed * _fall_damage_rate;
    }
}