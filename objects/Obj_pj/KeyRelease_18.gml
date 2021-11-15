all_monster = [];

show_debug_message("-----------");
for(var i = 0; i < ds_grid_width(monster_waiting_queue); i ++){
	all_monster[i] = ds_grid_get(monster_waiting_queue, i, 0);
}

for(var i = 0; i < ds_grid_width(monster_in_fight_with); i ++){
	all_monster[i + ds_grid_width(monster_waiting_queue)] = ds_grid_get(monster_in_fight_with, i, 0);
}

for(var o = 0; o < array_length(all_monster); o++){
	with(all_monster[o]){
		show_debug_message(object_get_name(object_index));
	}
}
show_debug_message("-----------");