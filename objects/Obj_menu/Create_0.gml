_ratio_menu =  global.scale_window * 0.75;

y = -sprite_height *  _ratio_menu;
x = (room_width/2) - ((sprite_width * _ratio_menu)/ 1.9);

curve = animcurve_get_channel(AnimC_menu, "curve0");
percent = 0;
animation_is_done = false;


image_xscale = _ratio_menu
image_yscale = _ratio_menu

