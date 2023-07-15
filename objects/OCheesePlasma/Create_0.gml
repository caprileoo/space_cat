event_user(0);

collision_objects = [Owall, OEdge, OCheeseMain];
collision = false;

hitByAttack = ds_list_create();
hitNow = false;

hsp = 0;
vsp = 0;

distanceTraveled = 0;