if(Obj_open_menu.show_menu){
	if(percent <= 1){
		animation_is_done = false;
		percent  += 1/60;
		position = animcurve_channel_evaluate(curve, percent);
		var y_start = -sprite_height;
		var y_end =  -42 * _ratio_menu;
		var _distance = y_end - y_start;
		y = y_start + (_distance * position);
	} else {
		animation_is_done = true;
	}
}else if(!Obj_open_menu.show_menu){
	if(percent <= 1){
		animation_is_done = false;
		percent  += 1/60;
		position = animcurve_channel_evaluate(curve, percent);
		var y_start = -42 * _ratio_menu;
		var y_end = -sprite_height + 30;
		var _distance = y_end - y_start;
		y = y_start + (_distance * position);
	}else {
		animation_is_done = true;
	}
}

if(!animation_is_done){
	Scr_menu_all_move();
}