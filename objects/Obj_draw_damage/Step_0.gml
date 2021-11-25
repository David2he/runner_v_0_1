if(text_avaible){
	ammount_damage = text;
}


if(percent > 1){
	instance_destroy();
} else {
	percent  += 1/60;
	position = animcurve_channel_evaluate(curve_to_use, percent);
	
	if(curve_x_allowed){
		position_x = animcurve_channel_evaluate(curve_x, percent);	
		var x_start = xstart;
		var x_end = x_start + x_goal;
		var x_distance = x_start - x_end;
		x = x_start + (x_distance * position_x);
	}

	
	var y_start = ystart;
	var y_end =  ystart - y_goal_random;
	var _distance = y_end - y_start;
	
	var _size_start = size_grow_up_ratio_start;
	var _size_end = size_grow_up_ratio_max;
	var size = _size_end - _size_start;
	

	
	y = y_start + (_distance * position);

	size_supp = _size_start + (size * position);
	
	if(size_supp < 0){
		size_supp = 0;
	}
}