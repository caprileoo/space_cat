//We need: OWaterfallFoam, OWaterfallLines, OWaterfallMist, OWaterfallBase.

//Vars
splash_timer = 0;
max_splash_timer = 3;
max_line_timer = 30;
line_timer = irandom_range(0, max_line_timer);
overlay_layer = layer_create(layer_get_depth(layer) - 1);

//Top Foam
for (i = 4; i < sprite_width - 3; i += 1.5){
	with instance_create_layer(x + i, y + random_range(-1, 1), layer, OWaterfallSmall){
		max_xscale = random_range(4, 6);
		min_xscale = 2;
		max_yscale = random_range(2, 2.5);
		min_yscale = 0.5;
		xgrow_rate = random_range(0.2, 0.23);
		ygrow_rate = random_range(0.07, 0.09);
		image_xscale = random_range(min_xscale, max_xscale);
		image_yscale = random_range(min_yscale, max_yscale);
		waterfall_x = x;
	}
}

//Bottom Foam
for (i = 4; i < sprite_width - 3; i += 1.5){
	with instance_create_layer(x + i, y + sprite_height + random_range(-1, 1), layer, OWaterfallSmall){
		max_xscale = random_range(4, 6);
		min_xscale = 2;
		max_yscale = random_range(2, 2.5);
		min_yscale = 0.5;
		xgrow_rate = random_range(0.2, 0.23);
		ygrow_rate = random_range(0.07, 0.09);
		image_xscale = random_range(min_xscale, max_xscale);
		image_yscale = random_range(min_yscale, max_yscale);
		waterfall_x = x;
	}
}

//Bottom Water Lines
for (i = 0; i < sprite_width + 4; i += choose(4, 8, 10)){
	with instance_create_layer(x + i, y + sprite_height + irandom_range(5, 12), layer, OWaterfallSmall){
		max_xscale = irandom_range(5, 8);
		min_xscale = 3;
		xgrow_rate = random_range(0.34, 0.38);
		image_xscale = random_range(min_xscale, max_xscale);
	}
}

//Bottom Mist
for (i = 4; i < sprite_width + 4; i += choose(4, 8, 10)){
	with instance_create_layer(x + i, y + sprite_height + irandom_range(5, 12), layer, OWaterfallSmall){
		image_index = choose(0, 1, 2, 3);
		max_xscale = random_range(0.5, 0.7);
		min_xscale = 0.2;
		max_yscale = max_xscale;
		min_yscale = 0.2;
		xgrow_rate = random_range(0.025, 0.035);
		ygrow_rate = random_range(0.025, 0.035);
		image_xscale = random_range(min_xscale, max_xscale);
		image_yscale = image_xscale;
		waterfall_x = x;
		image_alpha = 0.25;
		image_angle = irandom_range(0, 360);
	}
}

//Blue underlay
with instance_create_layer(x, y + (sprite_height / 2), layer_get_name(layer), OWaterfallSmall){
	target_xscale = other.image_xscale;
	target_yscale = other.image_yscale / 2.9;
}