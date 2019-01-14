/// @description Insert description here
// You can write your code in this editor
if game_state != gs_playing {
	spr_freeze = sprite_create_from_surface(application_surface, 0, 0, window_get_width(), window_get_height(), false, true, 0, 0);
	instance_deactivate_all(true);
} else if instance_number(obj_box) == 0 {
	game_state = gs_win;
}