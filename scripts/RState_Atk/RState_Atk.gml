function RState_Atk(){
	vsp += grv;
	move_n_collide();
	update();
	animation();
	move_n_chase();
	get_dir();
	if (fire_timer >= room_speed / 4) { // 1 second interval between each bullet
		sprite_index = SRMouseShoot;
	    if(burst_count < 3){
	        var bullet;
	        bullet = instance_create_layer(x,y,"Instances",OCheesePlasma);
	        bullet.direction = dir;
			bullet.image_xscale = (dir == 0) ? -1 : 1;
	        bullet.speed = 5;
	        burst_count ++;
	        fire_timer = 0;
	    } else {
	        if (burst_timer >= room_speed * 2) {
	            burst_count = 0;
	            burst_timer = 0;
	            state = RSTATE.STATUS;
	        } else {
	            burst_timer ++;
	        }
	    }
	} else {
	    fire_timer ++;
	}
}