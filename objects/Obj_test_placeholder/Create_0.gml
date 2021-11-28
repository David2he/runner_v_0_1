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
	var draw_damage_color = c_white;
	var damage_to_display = 0;

	
	var can_display_text_damage = false;
	var text_to_display = "";
	
	
	var c_effect = "normal_hit";
	
	

	if(!is_ignoring_armor){
		calc_damage = ((damage_against_player) * (1 - (armor / 100))) - (flat_armor);
		if(damage_against_player > 0 && calc_damage <= 0){
			can_display_text_damage = true;
			c_effect = "blocked";
			text_to_display = "Blocked";
		} 
		damage_to_display = calc_damage;
	} else {
		calc_damage = damage_against_player;
	}
	
	if(calc_damage >= player_current_hp + Obj_pj.bonus_hp) {
		Obj_pj.is_dead = true;
	}
	
	if(Obj_pj.bonus_hp > 0) {
		hp_bonus_swap = Obj_pj.bonus_hp;
		Obj_pj.bonus_hp -= calc_damage
		if(Obj_pj.bonus_hp < 0){
			Obj_pj.bonus_hp = 0;
		}
		calc_damage -= hp_bonus_swap;
	}	
	
	if(calc_damage <= 0) {
		damage_to_display = damage_against_player;
		calc_damage = 0;
	}
	
	Scr_handle_damage_drawned(
		[Obj_pj.x + Obj_pj.sprite_width / 2, (Obj_pj.y - Obj_pj.sprite_height) - 15 *global.scale_window],
		damage_to_display,
		c_effect,
		text_to_display,
		can_display_text_damage,
	);
	
	Obj_pj.current_hp -= calc_damage;	
}