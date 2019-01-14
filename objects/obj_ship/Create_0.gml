/// @description Insert description here
// You can write your code in this editor
xx = phy_position_x;
yy = phy_position_y;

max_speed = 5;
accel_coef = 400;
thrust_coef = 600;
thrust_angle = 30;
phy_fixed_rotation = true;

part_system = part_system_create();
part_emitter = part_emitter_create(part_system);
part_type = part_type_create();
part_type_alpha3(part_type, 0.5, 0.8, 0);
part_type_shape(part_type, pt_shape_disk);
part_type_color3(part_type, c_white, c_yellow, c_red);

var sp = game_get_speed(gamespeed_fps);
part_type_life(part_type, 0.1*sp, 0.25*sp);
part_type_scale(part_type, 0.3, 0.3);
part_type_speed(part_type, 5, 5, 0, 0);