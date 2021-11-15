if(Obj_menu.animation_is_done){
	show_stats = !show_stats;
	image_index = show_stats;

	if(show_stats){
		instance_create_depth(x, y + sprite_height, -1, Obj_pannel_stats);
	} else {
		instance_destroy(Obj_pannel_stats);
	}
}