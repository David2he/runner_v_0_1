/// @function												Scr_parralax_speed(is_running, resolution, player_curent_movement_speed);
/// @param  {bool}		is_running							bool handle the stop or start parralax
/// @param  {int}		resolution							bool handle the stop or start parralax
/// @param  {int}		player_curent_movement_speed		bool handle the stop or start parralax
/// @description
///						This script is used to handle speed on layers and create the way the player "moves"

function Scr_parralax_speed(){
	var is_running = argument[0];
	var resolution = argument[1];
	var player_curent_movement_speed = argument[2];
	var _ground_speed = 0;
	var background_looper = 0;
	var additional_base_ground_speed = 0;
	
	/// set the sprite and handle the additional speed of ground if players is running or not
	if(is_running){
		curent_movement_speed = lerp(curent_movement_speed, movement_speed, 0.05);
		running_stat_counter += curent_movement_speed / 1000;
		var additional_base_ground_speed = 3;
		if(end_fight){ /// 
			if(image_index > image_number-1 || image_index == 0){
				Obj_pj.sprite_index = Spr_player_run;
				//reset_frame = true;
				end_fight = false;
			}
		}else{
			Obj_pj.sprite_index = Spr_player_run;
		}
		
	} else{
		var additional_base_ground_speed = 0;
	}
	
	
	/// according to the current resolutuion, ground speed wont be the same
	switch(resolution){
		case 720:
			var _ground_speed = player_curent_movement_speed / 6;
		break;
		
		case 1080:
			var _ground_speed = player_curent_movement_speed / 4;
		break;
	}

	
	/// array that stocks layer background and the speed of them
	var background_array_data = [
		[layer_get_id("Backgrounds_1"), (_ground_speed + additional_base_ground_speed) * - 1],
		[layer_get_id("Backgrounds_2"), (_ground_speed * 0.6) * - 1],
		[layer_get_id("Backgrounds_3"), (_ground_speed * 0.4) * - 1],
		[layer_get_id("Backgrounds_4"), (_ground_speed * 0.2) * - 1],
		[layer_get_id("Backgrounds_5"), (_ground_speed * 0.1) * - 1],
		[layer_get_id("Backgrounds_6"), (_ground_speed * 0.05) * - 1],
	]
	var background_layers_lenght = array_length(background_array_data);
	
	
	// applies in a loop the changement of speed
	for(background_looper = 0; background_looper <= background_layers_lenght - 1; background_looper++){
		layer_hspeed(
			background_array_data[background_looper][0],
			background_array_data[background_looper][1],
		)
	}
	
	ground_speed = (_ground_speed + additional_base_ground_speed) * - 1;
}