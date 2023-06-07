function RState_Atk(){
	
	hsp = 0;
	vsp = 0;
	
	if (target.x < x) {
	    image_xscale = -1;
	} else {
	    image_xscale = 1;
	}
	
	move_n_collide();
	update();
	
	if (fire_timer >= room_speed / 4) { // 1 second interval between each bullet
	    if(burst_count < 3){
			sprite_index = SRMouseShoot;
			image_speed = 1;
	        var bullet;
	        bullet = instance_create_layer(x,y,"Instances",OCheesePlasma);
	        if (image_xscale == -1) {
	            bullet.direction = 180;
	        } else {
	            bullet.direction = 0;
	        }
	        bullet.speed = 5;
	        burst_count ++;
	        fire_timer = 0;
	    } else {
			image_index = 0;
			image_speed = 0;
			hsp = 0;
			vsp = 0;
	        if (burst_timer >= room_speed * 2) {
	            burst_count = 0;
	            burst_timer = 0;
	        } else {
	            burst_timer ++;
	        }
	    }
	} else {
	    fire_timer ++;
	}
	
	if(abs(x - target.x) > detectionRadius){
		image_index = 0;
		state = RSTATE.FREE;
	}
}