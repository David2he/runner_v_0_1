/// @function									Scr_apply_dammage_hero(hit_frames, hits_left, sprite, next_combo, damage);
/// @param	{float}		damage_against_player	/// damage against player lol
/// @param	{float}		player_current_hp		/// current hp of player 
/// @param	{int}		armor					/// armor reduce damage by percentage 
/// @param	{int}		flat_armor				/// flat_armor reduce damage in a flat way for exemple 15 armor allow player to reduce damage from 15
/// @param {bool}		is_ignoring_armor		/// is dot, poison ...

function Scr_apply_dammage_hero(){
	var damage_against_player = argument[0];
	var player_current_hp = argument[1];
	var armor = argument[2];
	var flat_armor = argument[3];
	var is_ignoring_armor = argument[4];
	
	
	var hp_bonus_swap = 0;
	
	var calc_damage = 0;
	var damage_to_display = 0;

	
	var can_display_text_damage = false;
	var text_to_display = "";
		
	var c_effect = "hit_taken";
	

	if(!is_ignoring_armor){
		calc_damage = ((damage_against_player) * (1 - (armor / 100))) - (flat_armor);
		
		////////////////////// 
		///damage full reduced by flat armor and armor
		if(calc_damage <= 0){
			can_display_text_damage = true;
			c_effect = "total_blocked";
			text_to_display = "Blocked";
			Scr_handle_damage_drawned(
				[Obj_pj.x + Obj_pj.sprite_width / 2, (Obj_pj.y - Obj_pj.sprite_height) - 15 *global.scale_window],
				damage_to_display,
				c_effect,
				text_to_display,
				can_display_text_damage,
			);
		} ////////////////////// 
		
		////////////////////// 
		///bonus hp exist
		else if(Obj_pj.bonus_hp > 0){
			////////////////////// 
			///damage after amor < to current bonus hp
			if(calc_damage < Obj_pj.bonus_hp){
				damage_to_display = calc_damage;
				c_effect = "blocked";
				Scr_handle_damage_drawned(
					[Obj_pj.x + Obj_pj.sprite_width / 2, (Obj_pj.y - Obj_pj.sprite_height) - 15 *global.scale_window],
					damage_to_display,
					c_effect,
					text_to_display,
					can_display_text_damage,
				);
			}
			////////////////////// 
			
			////////////////////// 
			///damage is superior to currrent bonus hp
			else  if (calc_damage >= Obj_pj.bonus_hp){
				damage_to_display = calc_damage - (calc_damage - Obj_pj.bonus_hp);
				c_effect = "blocked";
				Scr_handle_damage_drawned(
					[Obj_pj.x + Obj_pj.sprite_width / 2, (Obj_pj.y - Obj_pj.sprite_height) - 15 *global.scale_window],
					damage_to_display,
					c_effect,
					text_to_display,
					can_display_text_damage,
				);
			}
			////////////////////// 
			
			/// reduce hp bonus and calc damage according to the context 
			hp_bonus_swap = calc_damage;
			calc_damage -= Obj_pj.bonus_hp;
			Obj_pj.bonus_hp -= hp_bonus_swap;
			if(Obj_pj.bonus_hp < 0){
				Obj_pj.bonus_hp = 0;
			}
		}
			////////////////////// 
		
	}
	else{
		calc_damage = damage_against_player;
		damage_to_display = calc_damage;
	}
	
	if(calc_damage <= 0){
		calc_damage = 0;
		damage_to_display = calc_damage;
	} else {
		damage_to_display = calc_damage;
		c_effect = "hit_taken";
		Scr_handle_damage_drawned(
		[Obj_pj.x + Obj_pj.sprite_width / 2, (Obj_pj.y - Obj_pj.sprite_height) - 15 *global.scale_window],
			damage_to_display,
			c_effect,
			text_to_display,
			can_display_text_damage,
		);
	}
	Obj_pj.current_hp -= calc_damage;		
}