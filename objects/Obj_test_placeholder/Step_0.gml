ammount_damage = 0;
draw_damage_color = c_white;
size_supp = 0;
effect = 0;

//max_size_g

alarm[0] = room_speed * 0.5;
curve = animcurve_get_channel(AnimC_damage_text, "curve" + string(irandom_range(0, 1)));
curve_x = animcurve_get_channel(AnimC_damage_text, "curveX");
percent = 0;


y_goal_random = irandom_range(150 , 250);
x_goal = random_range(-60, 60);












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
	position_x = animcurve_channel_evaluate(curve_x, percent);
	
	var y_start = ystart;
	var y_end =  ystart - y_goal_random;
	var _distance = y_end - y_start;
	
	var _size_start = 1;
	var _size_end = max_size_grow_up_ratio;
	var size = _size_end - _size_start;
	
	var x_start = xstart;
	var x_end = x_start + x_goal;
	var x_distance = x_start - x_end;
	
	y = y_start + (_distance * position);
	x = x_start + (x_distance * position_x);
	size_supp = _size_start + (size * position);
	
	if(size_supp < 0){
		size_supp = 0;
	}
}









