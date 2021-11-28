for(var i = 0; i < array_length(array_effect); i++){
	if(array_effect[i][1] >= random_range(0, 1)){
		var array_length_effect_incrementor = array_length(effect_suffered);
		effect_suffered[array_length_effect_incrementor][1] = array_effect[i][2];
		effect_suffered[array_length_effect_incrementor][0] = array_effect[i][0];
	} 
}