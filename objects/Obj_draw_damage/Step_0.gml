if(effect == 1){
	max_size_grow_up_ratio = 3;
} else {
	max_size_grow_up_ratio = 2;
}



if(percent > 1){
	instance_destroy();
} else {
	percent  += 1/60;
	position = animcurve_channel_evaluate(curve, percent);
	
	var y_start = ystart;
	var y_end =  ystart - y_goal_random;
	var _distance = y_end - y_start;
	
	var _size_start = 1;
	var _size_end = max_size_grow_up_ratio;
	var size = _size_end - _size_start;
	
	y = y_start + (_distance * position);
	size_supp = _size_start + (size * position);
	
	if(size_supp < 0){
		size_supp = 0;
	}
}