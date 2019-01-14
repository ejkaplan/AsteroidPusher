/// @description Insert description here
// You can write your code in this editor
if game_state != gs_playing and spr_freeze != pointer_null {
	draw_sprite(spr_freeze, 0, 0, 0);
	draw_set_font(fnt_game_over);
	draw_set_color(c_blue);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	if game_state = gs_loss
		draw_text(window_get_width()/2, window_get_height()/2, "GAME OVER");
	else if game_state = gs_win
		draw_text(window_get_width()/2, window_get_height()/2, "YOU WIN");
}