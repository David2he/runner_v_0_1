// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_apply_damage(){
	
	var focus_list_start = argument[0];
	var focus_list_end = argument[1];
	var damage = argument[2];
	var c_effect = argument[3];
	
	
	var damage_ratio = damage;
	
	
	/// check if ds_grid is > 0 
	///set a loop with a specific start and end (if u wants to apply damage on the first enemeis or the seond and both or all
	/// is the loop and ds_grid have common index (if u wants to kill 2 first enemies but there is only one enemies, things like that)
	/// with allow me to go inside the instance and modify value i want
	if(ds_grid_width(monster_in_fight_with) > 0){
		for(var i = focus_list_start; i <= focus_list_end; i ++){
			if(i <= ds_grid_width(monster_in_fight_with) - 1){
				damage_ratio = damage - (damage * (i / (focus_list_end * Obj_pj.cut_through_the_enemies)));
				if(damage_ratio < 0){
					damage_ratio = 0;
				}
				with(ds_grid_get(monster_in_fight_with, i, 0)){
					hitted = true;
					if(damage_ratio >= current_hp){
						current_hp -= damage_ratio;
						is_dead = true;
					} else if(current_hp > 0){
						current_hp -= damage_ratio;
					}
				
				}
				Scr_handle_damage_drawned(ds_grid_get(monster_in_fight_with, i, 0), damage_ratio, c_effect);
			}
		}	
	}
	
}