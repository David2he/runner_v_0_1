// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_apply_damage(){
	
	var focus_list_start = argument[0];
	var focus_list_end = argument[1];
	var damage = argument[2];
	var c_effect = argument[3];
	
	var damage_ratio = damage;
	
	
	var draw_damage_color = c_white;
	var can_display_text_damage = false;
	var text_to_display = "";
	var size_off_content_start = 1.3;
	var size_off_content_max = 1.8;
	
	
	
	var array_effect = [
		["poison", Obj_pj.effect_poison_rate],
		["fire", Obj_pj.effect_fire_rate],
		["ice", Obj_pj.effect_ice_rate],
	];
	
	/// check if ds_grid is > 0 
	///set a loop with a specific start and end (if u wants to apply damage on the first enemeis or the seond and both or all
	/// is the loop and ds_grid have common index (if u wants to kill 2 first enemies but there is only one enemies, things like that)
	/// with allow me to go inside the instance and modify value i want
	if(ds_grid_width(monster_in_fight_with) > 0){
		for(var i = focus_list_start; i <= focus_list_end; i ++){
			
			if(i <= ds_grid_width(monster_in_fight_with) - 1){
				
				/// calcul damage for each enemies in a fight queue 
				damage_ratio = damage - (damage * (i / (focus_list_end * Obj_pj.cut_through_the_enemies)));
				if(damage_ratio < 0){
					damage_ratio = 0;
				}
				
				with(ds_grid_get(monster_in_fight_with, i, 0)){
					hitted = true;
					if(damage_ratio >= current_hp){
						current_hp -= damage_ratio;
						is_dead = true;
					} else {
						current_hp -= damage_ratio;
					}
					
					
					if(Obj_pj.life_steal > 0){
						if((Obj_pj.current_hp + damage_ratio * (Obj_pj.life_steal / 100)) >= max_hp ){
							draw_damage_color = make_colour_rgb(2175,238,238);
							Obj_pj.current_hp = max_hp;
							if(Obj_pj.bonus_hp >= Obj_pj.max_bonus_hp){
								Obj_pj.bonus_hp = Obj_pj.max_bonus_hp;
							} else {
								Obj_pj.bonus_hp += damage_ratio * (Obj_pj.life_steal / 100);
							}
						} else {
							show_debug_message(damage_ratio * (Obj_pj.life_steal / 100));
							draw_damage_color = c_green;
							Obj_pj.current_hp += damage_ratio * (Obj_pj.life_steal / 100);
						}
			
						var instance_damage_drawned = instance_create_depth(Obj_pj.middle_x_player, Obj_pj.y, -1, Obj_draw_damage_player);
						instance_damage_drawned.text_avaible = can_display_text_damage;
						instance_damage_drawned.text = text_to_display;
						
						instance_damage_drawned.draw_damage_color = draw_damage_color;
						instance_damage_drawned.ammount_damage = damage_ratio * (Obj_pj.life_steal / 100);
						instance_damage_drawned.effect = 0;
						
						instance_damage_drawned.size_grow_up_ratio_start = size_off_content_start
						instance_damage_drawned.size_grow_up_ratio_max = size_off_content_max
						
					}	
				}
				Scr_handle_damage_drawned(
					ds_grid_get(monster_in_fight_with, i, 0),
					damage_ratio,
					c_effect,
					text,
					text_avaible,
				);
			}
		}	
	}
	
}