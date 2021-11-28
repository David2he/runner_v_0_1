// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_handle_damage_drawned(){
	var target_middle_x_y = argument[0];
	var ammount_damage = argument[1];
	var c_effect = argument[2];
	var text = argument[3];
	var text_avaible = argument[4];
	var size_grow_up_ratio_start = 0
	var size_grow_up_ratio_max  = 0
	
	var curve = undefined;
	var curve_x_allowed = true;
	var y_goal_random = 0;
	var draw_damage_color = undefined;
	
	switch(c_effect){
		case "normal_hit":
			draw_damage_color = c_white;
			curve = animcurve_get_channel(AnimC_damage_text, "curve" + string(irandom_range(0, 1)));
			curve_x_allowed = true;
			size_grow_up_ratio_start = 1;
			size_grow_up_ratio_max = 1.5;
			y_goal_random = irandom_range(150 , 250);
		break;
		case "crit_hit":
			draw_damage_color = c_red;
			curve = animcurve_get_channel(AnimC_damage_text, "curve" + string(irandom_range(0, 1)));
			curve_x_allowed = true;
			size_grow_up_ratio_start = 1;
			size_grow_up_ratio_max = 2;
			y_goal_random = irandom_range(150 , 250);
		break;
		case "heal":
			draw_damage_color = c_green;
			curve = animcurve_get_channel(AnimC_damage_text, "curve_damage_player");
			curve_x_allowed = false;
			size_grow_up_ratio_start = 1;
			size_grow_up_ratio_max = 1.5;
			y_goal_random = irandom_range(80 , 100);
		break;
		case "armor":
			draw_damage_color = c_blue;
			curve = animcurve_get_channel(AnimC_damage_text, "curve_damage_player");
			curve_x_allowed = false;
			size_grow_up_ratio_start = 1;
			size_grow_up_ratio_max = 1.5;
			y_goal_random = irandom_range(80 , 100);
		break;
		case "total_blocked":
			draw_damage_color = c_gray;
			curve = animcurve_get_channel(AnimC_damage_text, "curve_damage_player");
			curve_x_allowed = false;
			size_grow_up_ratio_start = 1;
			size_grow_up_ratio_max = 1.5;
			y_goal_random = irandom_range(80 , 100);
		break;
		case "blocked":
			draw_damage_color = c_orange;
			curve = animcurve_get_channel(AnimC_damage_text, "curve_damage_player");
			curve_x_allowed = false;
			size_grow_up_ratio_start = 1;
			size_grow_up_ratio_max = 1.5;
			y_goal_random = irandom_range(80 , 100);
		break;
		case "hit_taken":
			draw_damage_color = c_white;
			curve = animcurve_get_channel(AnimC_damage_text, "curve_damage_player");
			curve_x_allowed = false;
			size_grow_up_ratio_start = 1;
			size_grow_up_ratio_max = 1.5;
			y_goal_random = irandom_range(80 , 100);
		break;
		
	}

	var instance_damage_drawned = instance_create_depth(target_middle_x_y[0] ,target_middle_x_y[1], -2, Obj_draw_damage);
		instance_damage_drawned.ammount_damage = ammount_damage;
		instance_damage_drawned.draw_damage_color = draw_damage_color;
		instance_damage_drawned.text = text;
		instance_damage_drawned.text_avaible = text_avaible;
		instance_damage_drawned.size_grow_up_ratio_start = size_grow_up_ratio_start;
		instance_damage_drawned.size_grow_up_ratio_max = size_grow_up_ratio_max;
		instance_damage_drawned.curve_to_use = curve;
		instance_damage_drawned.curve_x_allowed = curve_x_allowed;
		instance_damage_drawned.y_goal_random = y_goal_random;
}