random_sprite = irandom(4);
random_curve = irandom(2);
random_rotate_x_y = irandom(1);
is_out_the_room = false;
should_be_destroyed = false;

sprite_index = asset_get_index("Spr_loot_" + string(random_sprite));
curve = animcurve_get_channel(AnimC_loots, "curve" + string(random_curve));
percent = 0;

player_take_it = false;
stop = false;


if(random_rotate_x_y == 0){
	x_goal = xstart + (random_range(100, 800)); 
	rotate_sprite = irandom_range(-4, -6);
} else{
	x_goal = xstart - (random_range(100, -800));
	rotate_sprite = irandom_range(4, 6);
}
y_goals = random_range(100, 300)

image_xscale = 	global.scale_window;
image_yscale = global.scale_window;