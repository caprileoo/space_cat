function PState_Free(){
	var on_ground = place_meeting(x,y+1,Owall) or (place_meeting(x,y+1,OPlatform));
	vsp += grv;
	
	#region Fuel Regen
	if (fuel < max_fuel and on_ground and !key_jet) {
		fuel += 5;
	}
	#endregion
	
    #region Movements
    var move = key_right - key_left; //calculate movements

    if (move != 0) {
        walksp += 0.1;
        walksp = min(walksp, max_walksp);
    } else {
        walksp = 2.5;
    }
	
	if (key_right) {
		dir = 0;
	} else if (key_left) {
		dir = 180;
	}

    hsp = move * walksp; //move speed
    #endregion
	
	#region Jumping
	if(key_jump and on_ground){
		vsp = j_velocity;
		if(!key_jump){
			vsp += stopping_grv;
			if (vsp > max_vsp) vsp = max_vsp;
		} else{
			vsp += grv;
			if (vsp > max_vsp) vsp = max_vsp;
		}
	}
	#endregion
	
	#region Jet
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
	#endregion

    #region Collisions
    if (place_meeting(x+hsp,y,Owall)) or (place_meeting(x+hsp,y,OPlatform))
    {
        while (!place_meeting(x+sign(hsp),y,Owall)) and(!place_meeting(x+sign(hsp),y,OPlatform))
        {
            x = x + sign(hsp);
        }
        hsp = 0;
    }
    x = x + hsp;

    /**platform vertical collision**/
    if (place_meeting(x,y+vsp,Owall) or (place_meeting(x,y+vsp,OPlatform)))
    {
        while (!place_meeting(x,y+sign(vsp),Owall)) and (!place_meeting(x,y+sign(vsp),OPlatform))
        {
            y += sign(vsp);
        }
        vsp = 0;
    }
    y = y + vsp;
    #endregion

    #region Animations
    if (!on_ground)
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
    #endregion

	#region Atack
	if(key_atk and on_ground) state = PSTATE.ATTACK_SLASH;
	
	if(key_plasma){
		state = PSTATE.CHARGE;
	} else {
		state = PSTATE.RELEASE;
	}
	
	//if (key_plasma) {
	//    charge += 1;
	//    if (charge > max_charge) {
	//        charge = max_charge;
	//    }
	//} else {
	//    if (charge > 16) {
	//        var bullet = instance_create_layer(x, y, "Instances", OPlasma);
	//		bullet.direction = dir;
	//        bullet.speed = 5;
	//        bullet.image_xscale = charge / max_charge;
	//        bullet.image_yscale = charge / max_charge;
	//        charge = 16; //charge values should be all same
	//    }
	//}
	#endregion
}