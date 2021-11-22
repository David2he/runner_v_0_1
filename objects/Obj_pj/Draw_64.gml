//x_draw = x + (sprite_width/2);
//draw_set_font(Font_base);
//draw_sprite(Spr_health_bar_layout,  -1, x_draw, (y));
//draw_sprite_ext(Spr_health_bar_fill, -1, x_draw - (sprite_get_width(Spr_health_bar_fill)/2), (y), (current_hp/max_hp), 1, 0, c_white, 1);

//draw_set_valign(fa_middle);
//draw_set_halign(fa_left);
//draw_text((x_draw + 20)  - (sprite_get_width(Spr_health_bar_fill)/2), y, string(current_hp) + "/" + string(max_hp));	


if(current_hp <= 0){
	current_hp = 0;
}

draw_set_font(Font_base);
x_draw = x + (sprite_width/2);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

draw_sprite_ext(Spr_health_bar_layout, -1, x_draw, y, 1*global.scale_window, 1 * global.scale_window, 0, c_white, 1)
draw_sprite_ext(Spr_health_bar_fill_temp, -1, x_draw - (sprite_get_width(Spr_health_bar_fill)/2) * global.scale_window, y, (current_temp_hp/max_hp) * global.scale_window, 1 * global.scale_window, 0, c_white, 1);
draw_sprite_ext(Spr_health_bar_fill, -1, x_draw - (sprite_get_width(Spr_health_bar_fill)/2) * global.scale_window, y, (current_hp/max_hp) * global.scale_window, 1 * global.scale_window, 0, c_white, 1);
draw_sprite_ext(Spr_health_bar_bonus_hp, -1, x_draw - (sprite_get_width(Spr_health_bar_fill)/2) * global.scale_window, y, (bonus_hp/max_hp) * global.scale_window, 1 * global.scale_window, 0, c_white, 1);
draw_text(((x_draw + 20)  - (sprite_get_width(Spr_health_bar_fill)/2)* global.scale_window), y, string(current_hp) + "/" + string(max_hp));

draw_set_halign(fa_center);

draw_sprite_ext(Spr_armor_icon, -1, (x_draw + (sprite_get_width(Spr_health_bar_fill)/2)* global.scale_window), y, global.scale_window +0.5, global.scale_window + 0.5,  0, c_white, 1);
if(flat_armor < 99){
	draw_text((x_draw + (sprite_get_width(Spr_health_bar_fill)/2)* global.scale_window), y, string(flat_armor));
} else {
	draw_text((x_draw + (sprite_get_width(Spr_health_bar_fill)/2)* global.scale_window), y, "99+");
}

draw_set_halign(fa_left);