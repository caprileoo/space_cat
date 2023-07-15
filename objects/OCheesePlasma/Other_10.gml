function kaboom(){
	speed = 0;
	sprite_index = SBigPlasmaExplode;
	if(animation_end()){
		instance_destroy();	
	}
}