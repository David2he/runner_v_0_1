// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_handle_damage_drawned(){
	var target = argument[0];
	var ammount_damage = argument[1];
	var c_effect = argument[2];
	var draw_damage_color = c_white;
	
	
	switch(c_effect){
		case 0:
			draw_damage_color = c_white;
		break;
		case 1:
			draw_damage_color = c_red;
		break;
	}

	var instance_damage_drawned = instance_create_depth(target.x + sprite_width ,target.y - sprite_height - 30, -2, Obj_draw_damage);
	instance_damage_drawned.ammount_damage = ammount_damage;
	instance_damage_drawned.draw_damage_color = draw_damage_color;
	instance_damage_drawned.effect = c_effect;
}