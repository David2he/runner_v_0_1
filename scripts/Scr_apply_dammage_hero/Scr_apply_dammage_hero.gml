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
	var calc_damage = 0;

	if(!is_ignoring_armor){
		calc_damage = (damage_against_player - flat_armor) * (1 - (armor / 100));
	} else {
		calc_damage = damage_against_player;
	}
	
	if(calc_damage >= player_current_hp){
		Obj_pj.is_dead = true;
	}
	instance_create_depth(Obj_pj.x, Obj_pj.y, -1, Obj_draw_damage_player);
	Obj_pj.current_hp -= calc_damage ;
}