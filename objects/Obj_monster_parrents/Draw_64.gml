if(!is_dead){
	x_draw = x + sprite_width/2;
	draw_set_font(Font_base);
	draw_sprite(Spr_health_bar_layout,  -1, x_draw, (y - sprite_height * 0.85));
	draw_sprite_ext(Spr_health_bar_fill, -1, x_draw - (sprite_get_width(Spr_health_bar_fill)/2), (y - sprite_height * 0.85), (current_hp/max_hp), 1, 0, c_white, 1);

	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text((x_draw + 20)  - (sprite_get_width(Spr_health_bar_fill)/2), y - (sprite_height * 0.85), string(current_hp) + "/" + string(max_hp));	
}