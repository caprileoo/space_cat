function RState_Atk(){
	vsp += grv;
	move_n_chase();
	if (fire_timer >= room_speed / 4) { // 1 second interval between each bullet
	    if(burst_count < 3){
	        var bullet;
	        bullet = instance_create_layer(x,y,"Instances",OCheesePlasma);
	        get_dir();
	        bullet.direction = dir;
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
	hsp = 0;
	vsp = 0;
	move_n_collide(Owall);
	move_n_collide(OPlatform);
	update();
	animation();
}