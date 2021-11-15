show_debug_message("---");
for( var i = 0; i < ds_grid_width(Obj_pj.monster_waiting_queue); i ++){
	show_debug_message(ds_grid_get(monster_waiting_queue, i, 0));
}
show_debug_message("---");