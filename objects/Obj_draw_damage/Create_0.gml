ammount_damage = 0;
draw_damage_color = c_white;
text = "";
text_avaible = undefined;
size_grow_up_ratio_start = 0;
size_grow_up_ratio_max = 0;
curve_to_use = undefined;
curve_x_allowed = undefined;

y_goal_random = 0;


max_size_grow_up_ratio = 0;


size_supp = 0;
effect = 0;
alarm[0] = room_speed * 0.5;

curve_x = animcurve_get_channel(AnimC_damage_text, "curveX");
percent = 0;



x_goal = random_range(-60, 60);