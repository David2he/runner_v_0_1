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
	var size_off_content_start = 0;
	var size_off_content_max = 0;
	
	

	if(!is_ignoring_armor) {
		calc_damage = ((damage_against_player) * (1 - (armor / 100))) - (flat_armor);
		if(damage_against_player > 0 && calc_damage <= 0){
			draw_damage_color = make_colour_rgb(2175,238,238);
			can_display_text_damage = true;
			text_to_display = "Blocked";
			size_off_content_start = 1.3;
			size_off_content_max = 1.8;
		}
	} else {
		calc_damage = damage_against_player;
	}
	
	if(calc_damage < 0) {
		damage_to_display = damage_against_player;
		calc_damage = 0;
		size_off_content_start = 1.3;
		size_off_content_max = 1.8;
	} else {
		size_off_content_start = 1.8;
		size_off_content_max = 2.5;
	}
	
	
	if(calc_damage >= player_current_hp + Obj_pj.bonus_hp) {
		Obj_pj.is_dead = true;
		size_off_content_start = 3;
		size_off_content_max = 4;
	}
	
	var instance_damage_drawned = instance_create_depth(Obj_pj.middle_x_player, Obj_pj.y, -1, Obj_draw_damage_player);
	
	instance_damage_drawned.text_avaible = can_display_text_damage;
	instance_damage_drawned.text = text_to_display;
	instance_damage_drawned.draw_damage_color = draw_damage_color;
	instance_damage_drawned.ammount_damage = calc_damage;
	instance_damage_drawned.effect = 0;
	instance_damage_drawned.size_grow_up_ratio_start = size_off_content_start
	instance_damage_drawned.size_grow_up_ratio_max = size_off_content_max
	
	
	
	if(Obj_pj.bonus_hp > 0) {
		hp_bonus_swap = Obj_pj.bonus_hp;
		Obj_pj.bonus_hp -= calc_damage
		if(Obj_pj.bonus_hp < 0){
			Obj_pj.bonus_hp = 0;
		}
		calc_damage -= hp_bonus_swap;
	}	
	Obj_pj.current_hp -= calc_damage;	
}