function FighterProcessAttack(argument0, argument1, argument2){
    //Start of the attack
    if (sprite_index != argument0)
    {
        sprite_index = argument0
        image_index = 0;    
        ds_list_clear(hitByAttack);
        ds_list_clear(hitByAttack2);
    }

    //Use attack hitbox & check for hits
    if (image_index < 4) {
        mask_index = argument1;
        var hitByAttackNow = ds_list_create()
        var hits = instance_place_list(x,y,OCat,hitByAttackNow,false);
        if (hits > 0)
        {
            for (var i = 0; i < hits; i++)
            {
                //if this instance has not yet been hit by this attack, hit it
                var hitID = hitByAttackNow[| i]
                if (ds_list_find_index(hitByAttack,hitID) == -1)
                {
                    ds_list_add(hitByAttack,hitID);
                    with (hitID)
                    {
                        PlayerHitByMelee1(1);
                    }
                }
            }
        }
        ds_list_destroy(hitByAttackNow);
    } else {
        mask_index = argument2;
        var hitByAttackNow = ds_list_create()
        var hits = instance_place_list(x,y,OCat,hitByAttackNow,false);
        if (hits > 0)
        {
            for (var i = 0; i < hits; i++)
            {
                //if this instance has not yet been hit by this attack, hit it
                var hitID = hitByAttackNow[| i]
                if (ds_list_find_index(hitByAttack2,hitID) == -1)
                {
                    ds_list_add(hitByAttack2,hitID);
                    with (hitID)
                    {
                        PlayerHitByMelee2(1);
                    }
                }
            }
        }
        ds_list_destroy(hitByAttackNow);
    }
    
    mask_index = SFMouseIdle;
}
