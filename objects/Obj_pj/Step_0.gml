
/// check if instance exist and allow fight or not
if(ds_grid_width(monster_in_fight_with > 0) && !is_dead){
	is_fighting = true;
} else {
	is_fighting = false;
}

	/// switch check what animation have to be played and start script of animation
if(will_be_a_crit){
	current_damage = (damage + curent_movement_speed/5) * crit_bonus_damage;
	current_effect = 1;
} else {
	current_damage = (damage + curent_movement_speed/5);
	current_effect = 0;
}



if(ds_grid_width(monster_in_fight_with) > 0 && first_attack){
	//show_debug_message(ds_grid_get(monster_in_fight_with, 0, 0));
	with(ds_grid_get(monster_in_fight_with, 0, 0)){
		Obj_pj.check_os = current_hp;
	}
	if(current_damage >= check_os){
		combo = 0;
	} else {
		combo = 1;
	}
	first_attack = false;
}

if(is_fighting){
	image_speed = attack_animation_speed;
	end_fight = true;
	/// switch check what animation have to be played and start script of animation
	switch(combo){
		case 0:
			Scr_handle_attack_animation([[1, 2]], [1], Spr_player_attack_run_0, 1, current_damage);
			lower_movement_speed = 0.01 * movement_speed;
		break;
		
		case 1:
			Scr_handle_attack_animation([[2 ,3]], [1], Spr_player_attack_transition_2, 2, current_damage);
			lower_movement_speed = 0.02 * movement_speed;
		break;
		
		case 2:
			Scr_handle_attack_animation([[2, 3]], [1], Spr_player_attack_1, 3, current_damage);
			lower_movement_speed = 0.05 * movement_speed;
		break;
		case 3:
			Scr_handle_attack_animation([[1 ,2]], [1], Spr_player_attack_2, 2, current_damage);
			lower_movement_speed = 0.05 * movement_speed;
		break;
	}
	
	/// decrease movement speed according to the current combo and call the parralax speed script and turn in to off, aso make the base bonus speed of the ground to 0
	if(curent_movement_speed > 0){
		curent_movement_speed -= lower_movement_speed; 
	} else if (curent_movement_speed < 0) curent_movement_speed = 0;
		Scr_parralax_speed(false, 1080, curent_movement_speed);
	
} else{
	 if(!is_dead){
		reset_frame = true;
		first_attack = true;
		image_speed = run_animation_speed;
		combo = 0;
		Scr_parralax_speed(true, 1080, curent_movement_speed);
	 }	
}


if(current_hp <= 0){
	is_dead = true;
}
if(is_dead && !game_over){
	if(reset_frame_death_allowed){
		image_index = 0;
		reset_frame_death_allowed = false;
	}
	sprite_index = Spr_player_die;
	image_speed = 0.7;
	curent_movement_speed = 0;
	Scr_parralax_speed(false, 1080, curent_movement_speed);
	if(image_index >= image_number - 1){
		game_over = true;
	}
} 
if(is_dead){
	if(ratio_effect_death <= 1){
		ratio_effect_death += 0.01;
	}
	fx_set_parameter(layer_get_fx("Effect_1"), "g_Intensity", ratio_effect_death);
}

if(game_over){
	sprite_index = Spr_player_die_stuck;
}
