draw_self();
draw_set_font(Font_lighter);
draw_set_valign(fa_top);
for(stats_loop = 0; stats_loop < array_length(all_displayable_stats); stats_loop++){
	draw_set_halign(fa_left);
	draw_text_transformed(x - sprite_width/2.5, initial_y_draw_stats + ((20* stats_loop)*global.scale_window), all_displayable_stats_transformed[stats_loop][0], global.scale_window * 0.75, global.scale_window * 0.75, 0);
	//draw_text(x + 15, initial_y_draw_stats + (20* stats_loop), all_displayable_stats[stats_loop][0]);
	//draw_set_halign(fa_right);
	//draw_text(x + sprite_width - 15, initial_y_draw_stats + (20* stats_loop), all_displayable_stats[stats_loop][1]);
	draw_text_transformed(x + sprite_width/4.5, initial_y_draw_stats + ((20* stats_loop)*global.scale_window), all_displayable_stats_transformed[stats_loop][1],global.scale_window * 0.75, global.scale_window * 0.75, 0);
}

draw_set_font(Font_base);