all_displayable_stats = 
[
	["Dammage", Obj_pj.damage],
	["First Attack", Obj_pj.current_damage],
	["Movement speed", Obj_pj.movement_speed],
	["Current speed", Obj_pj.curent_movement_speed],
	["distance km",round(Obj_pj.running_stat_counter)],
	["Gold earned", Obj_pj.gold_earned],
	["Gold current", Obj_pj.current_gold],
];


for(i = 0; i < array_length(all_displayable_stats); i ++){
	if (all_displayable_stats[i][1] >= 1000000000000){
		all_displayable_stats_transformed[i][1] = string(all_displayable_stats[i][1] / 1000000000000) + "B" ;
	}else if (all_displayable_stats[i][1] >= 1000000000){
		all_displayable_stats_transformed[i][1] = string(all_displayable_stats[i][1] / 1000000000) + "G" ;
	} else if (all_displayable_stats[i][1] >= 1000000){
		all_displayable_stats_transformed[i][1] = string(all_displayable_stats[i][1] / 1000000) + "M" ;
	} else if(all_displayable_stats[i][1] >= 1000){
		all_displayable_stats_transformed[i][1] = string(all_displayable_stats[i][1] / 1000) + "K" ;;
	} else{
			all_displayable_stats_transformed[i][0] = all_displayable_stats[i][0];
			all_displayable_stats_transformed[i][1] = all_displayable_stats[i][1];
	}
}



