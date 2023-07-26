draw_sprite(SHearts,0,240,100);

if (OCat.hp <= 10) {
	image_index = 1;
}
else if (OCat.hp <= 5) {
	image_index = 2;
}
else if (OCat.hp = 0) {
	image_index = 3;
}