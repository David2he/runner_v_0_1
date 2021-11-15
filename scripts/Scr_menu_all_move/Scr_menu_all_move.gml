function Scr_menu_all_move(){
	Obj_open_menu.y = y + (sprite_get_height(Spr_menu_pannel) * Obj_menu._ratio_menu);
	Obj_button_parrent.y = y + ((sprite_get_height(Spr_menu_pannel) / 2) * Obj_menu._ratio_menu);
	Obj_open_stats.y = y + (sprite_get_height(Spr_menu_pannel) * Obj_menu._ratio_menu) - 30;
}