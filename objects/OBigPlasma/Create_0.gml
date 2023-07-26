event_user(0);

collision_objects = [Owall, OEnemyEdge, OCheeseMain];
collision = false;

hitByAttack = ds_list_create();
hitNow = false;

distanceTraveled = 0;