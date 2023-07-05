function FState_Chase(){
    vsp += grv;
    
    image_speed = 1;
    sprite_index = SFMouseRun;
	image_xscale = sign(target.x - x);
	
	hsp = 2 * sign(target.x - x);
	
	move_n_collide(collision_objects);
}