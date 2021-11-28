
for(var i = 0; i < array_length(effect_suffered); i++){
	//show_debug_message("----");
	//show_debug_message(effect_suffered[i][1]);
	//show_debug_message("----");
	switch(effect_suffered[i][0]){
		case "poison":
			show_debug_message(effect_suffered[i][1]);
			if(effect_suffered[i][1] > 0){
				effect_suffered[i][1] --;
			}else if(effect_suffered[i][1] == 0){
				show_debug_message("aaaaaaaaa");
			}
		break;
		//case "fire":
		//	if(effect_suffered[i][1] > 0){
		//		effect_suffered[i][1] --;
		//	}else if(effect_suffered[i][1] == 0){
		//		show_debug_message("bbbbbbbbbbb");
		//	}
		//break;
		//case "ice":
		//	if(effect_suffered[i][1] > 0){
		//		effect_suffered[i][1] --;
		//	}else if(effect_suffered[i][1] == 0){
		//		show_debug_message("cccccccccccc");
		//	}
		//break;
	}
}