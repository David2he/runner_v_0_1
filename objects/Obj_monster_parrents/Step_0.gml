/// select how many enemies can go to fight based on Obj_pj.max_enemies_stacked_in_fight values
/// The other enemies wait in a queue to go in a fight (can be added = can go to fight)
if(distance_to_object(Obj_pj) <= 120 + 40* queue && !can_be_added){
	for(var i = 0; i < Obj_pj.max_enemies_stacked_in_fight; i ++){
		if(ds_grid_width(Obj_pj.monster_waiting_queue) > i){
			with(ds_grid_get(Obj_pj.monster_waiting_queue, i, 0)){
				Obj_pj.max_enemies_stacked_in_fight -= 1;
				can_be_added = true;
				Scr_resize_ds_grid(Obj_pj.monster_waiting_queue, i);
			}
		}
	}
	if(!can_be_added){
		sprite_index = sprite_idle;
	}
} else {
	if(distance_to_object(Obj_pj) <= 10){
		//show_debug_message(ds_grid_width(Obj_pj.monster_in_fight_with));
		is_in_the_area = false;
		if(!is_in_array){
			alarm[0] = 1;
			sprite_index = sprite_idle;
		}
	} else {
		x -= 9;
		sprite_index = sprite_running;
	}
}



if(hitted){
	color_c_blend_monster = c_red;
	hitted = false;
	image_index = 0;
	alarm[1] = room_speed * 0.15;
	sprite_index = sprite_hurted;
	//show_debug_message("---");
	//	show_debug_message(max_hp - current_hp);
	//	show_debug_message(id);
	//show_debug_message("---");
}

if(sprite_index == sprite_hurted){
	if(image_index >= image_number - 1){
		sprite_index = sprite_idle
	}
}

if(is_dead){
	Obj_pj.max_enemies_stacked_in_fight += 1;
	for( var i = 0; i < ds_grid_width(Obj_pj.monster_in_fight_with); i ++){
		if(id == ds_grid_get(Obj_pj.monster_in_fight_with, i, 0)){
			Scr_resize_ds_grid(Obj_pj.monster_in_fight_with, i);
		} 
	}
	ammount_of_gold = irandom_range(20, 30);
	for(i = 0; i < ammount_of_gold; i ++){
		instance_create_depth(x + sprite_width / 2, y - sprite_height, -2,Obj_loots);
	}
		instance_destroy();

}
