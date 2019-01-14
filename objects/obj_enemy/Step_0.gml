/// @description Insert description here
// You can write your code in this editor 
xx = phy_position_x;
yy = phy_position_y;

for (var i = 0; i < instance_number(obj_box); i++) {
	var box = instance_find(obj_box, i);
	var wrapped_box = closest_wrapped_point(xx, yy, box.xx, box.yy);
	var box_dist = point_distance(wrapped_box[0], wrapped_box[1], xx, yy);
	if (box_dist < avoid_dist) {
		var box_angle = arctan2(yy-wrapped_box[1], xx-wrapped_box[0]);
		var fx = avoid * cos(box_angle) / power(box_dist+1,1.5);
		var fy = avoid * sin(box_angle) / power(box_dist+1,1.5);
		physics_apply_force(xx, yy, fx, fy);
	}
}

var target = closest_wrapped_point(xx, yy, obj_ship.xx, obj_ship.yy);
//player_angle = point_direction(xx, yy, target[0], target[1]);
player_angle = arctan2(target[1]-yy, target[0]-xx);
var fx = seek * cos(player_angle);
var fy = seek * sin(player_angle);
physics_apply_force(xx, yy, fx, fy);

while xx < 0 {
	xx += room_width;
} 
while xx > room_width {
	xx -= room_width;
}
while yy < 0 {
	yy += room_height;
} 
while yy > room_height {
	yy -= room_height;
}

phy_position_x = xx;
phy_position_y = yy;
var sp = phy_speed;
if (sp > max_speed) {
	phy_speed_x = phy_speed_x / sp * max_speed;
	phy_speed_y = phy_speed_y / sp * max_speed;
}
phy_rotation = radtodeg(arctan2(phy_speed_y, phy_speed_x));

var inst = instance_place(x, y, obj_box);
if inst != noone {
	with (inst) instance_destroy();
}

var rscale = 0.25 + random(0.5);
part_type_direction(part_type, 180-phy_rotation-0.8*30, 180-phy_rotation+0.8*30,0,5);
part_emitter_region(part_system, part_emitter, x, x, y, y,
	ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(part_system, part_emitter, part_type, 4);