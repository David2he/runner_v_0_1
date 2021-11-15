//x = Obj_menu.x + (((sprite_get_width(Spr_menu_pannel) * Obj_menu._ratio_menu)/ 2) - (sprite_width * Obj_menu._ratio_menu+ 20));
image_xscale =  global.scale_window;
image_yscale = global.scale_window;
image_speed = 0;
x = Obj_menu.x + (sprite_get_width(Spr_menu_pannel) * Obj_menu._ratio_menu) - ((sprite_width/1.3) * global.scale_window);

show_stats = false;
