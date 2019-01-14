xx = phy_position_x;
yy = phy_position_y;

direction = arctan2(mouse_y - yy, mouse_x - xx);
phy_rotation = radtodeg(direction);
if mouse_button = mb_left {
	var fx = accel_coef * cos(direction);
	var fy = accel_coef * sin(direction);
	physics_apply_force(xx, yy, fx, fy);
	var x1 = xx + lengthdir_x(room_width, -phy_rotation-thrust_angle+180);
	var y1 = yy + lengthdir_y(room_width, -phy_rotation-thrust_angle+180);
	var x2 = xx + lengthdir_x(room_width, -phy_rotation+thrust_angle+180);
	var y2 = yy + lengthdir_y(room_width, -phy_rotation+thrust_angle+180);
	draw_triangle(xx, yy, x1, y1, x2, y2, false);
	for (var i = 0; i < instance_number(obj_box); i++) {
		var box = instance_find(obj_box, i);
		var dist = distance_to_object(box);
		var bfx = -thrust_coef*fx / power(dist+1,1.5);
		var bfy = -thrust_coef*fy / power(dist+1,1.5);
		if point_in_triangle(box.xx, box.yy, xx, yy, x1, y1, x2, y2) {
			with(box) physics_apply_force(xx, yy, bfx, bfy);
		}
	}
}
if xx < -sprite_width/2 {
	xx = room_width + sprite_width/2;
} else if xx > room_width + sprite_width/2 {
	xx = -sprite_width/2;
}
if yy < -sprite_height/2 {
	yy = room_height + sprite_height/2;
} else if yy > room_height + sprite_height/2 {
	yy = -sprite_height/2;
}

phy_position_x = xx;
phy_position_y = yy;

if place_meeting(xx, yy, obj_enemy) {
	obj_game.game_state = obj_game.gs_loss
}

if mouse_button = mb_left {
	var rscale = 0.25 + random(0.5);
	part_type_direction(part_type, 180-phy_rotation-0.8*thrust_angle, 180-phy_rotation+0.8*thrust_angle,0,5);
	part_emitter_region(part_system, part_emitter, x, x, y, y,
		ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(part_system, part_emitter, part_type, 4);
}