function RState_Atk(){
	attacking = true;	
	
	vsp += grv;
	image_speed = 1;
	
	if (target.x < x) {
	    image_xscale = -1;
	} else {
	    image_xscale = 1;
	}
	
	if (fire_timer >= room_speed / 4) { // 1 second interval between each bullet
	    if(burst_count < 3){
			sprite_index = SRMouseShoot;
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
		    if (burst_timer >= room_speed * 2) {
		        burst_count = 0;
		        burst_timer = 0;
		    } else {
		        burst_timer ++;
		    }
	    }
	} else {
		attacking = false;
	    fire_timer ++;
	}
	
	move_n_collide(collision_objects);
}