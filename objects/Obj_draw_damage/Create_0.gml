ammount_damage = 0;
draw_damage_color = c_white;
size_supp = 0;
effect = 0;

max_size_grow_up_ratio = 2;


curve = animcurve_get_channel(AnimC_damage_text, "curve_damage_player");
percent = 0;


y_goal_random = irandom_range(150 , 250);
x_goal = random_range(-60, 60);