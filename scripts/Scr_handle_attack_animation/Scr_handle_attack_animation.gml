/// @function												Scr_handle_attack_animation(hit_frames, hits_left, sprite, next_combo, damage);
/// @param  {array}		hit_frames			/// hit_frames is a double array in a case i need 2 different frame damage in a same animation
/// @param  {array}		hits_left			/// hits_left allow me to know how many dammage frame i handle, I stock it in a "normal" var to not reattribute the same amount at each call of scritp
/// @param  {int}		sprite				bool handle the stop or start parralax
/// @param  {int}		next_combo			bool handle the stop or start parralax
/// @param  {int}		damage				the ammount of damage attack will create
/// @description
///						This script is used to handle animation in fight

function Scr_handle_attack_animation(){
	var hit_frames = argument[0]; 
	var hits_left = argument[1]; 
	var sprite = argument[2];	
	var next_combo = argument[3];
	var damage_arg = argument[4];
	
	var loop_frame_damage = 0;
	sprite_index = sprite;
	
	/// check if animation need to be reset and go to next combo if current frame is past
	if(image_index > 0 && reset_frame){
		image_index = 0;
		reset_frame = false;
		hit_frames_stocked = hits_left;
	} else if(image_index > image_number-1){
		reset_frame = true;
		combo = next_combo
	}
	
	/// check effect for the next attack
	/// Loop to select the frame to apply dammage
	for(loop_frame_damage = 0; loop_frame_damage < array_length(hit_frames); loop_frame_damage++){
		if((
	/*1*/	image_index > hit_frames[loop_frame_damage][0]&&	// Start frame to apply damage
	/*2*/	image_index < hit_frames[loop_frame_damage][1])&&	// End frame to apply damage
	/*3*/	hit_frames_stocked[loop_frame_damage] > 0)			// Check how many attacks I'm allowed too
		{
			if(crit_rate >= random_range(0, 1)){
				will_be_a_crit = true;
			} else {
				will_be_a_crit = false;
			}
			Scr_apply_damage(how_many_enemies_dies_begin, how_many_enemies_dies_last, damage_arg, current_effect);
			current_effect = 0;
			hit_frames_stocked[loop_frame_damage] --;
		}
	}

}