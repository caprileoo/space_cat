////Create event
instance_create_layer(0, 0, "Instances", ODeathWall); // create an instance of ODeathWall
spacing = sprite_get_width(ODeathWall.sprite_index); // spacing between instances
x = 0; // starting x position
y = room_height * 3/4;