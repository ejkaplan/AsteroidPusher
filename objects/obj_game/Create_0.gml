/// @description Insert description here
// You can write your code in this editor
gs_playing = 0;
gs_loss = 1;
gs_win = 2;

separation_dist = 100;
nboxes = 5;

game_state = gs_playing;
spr_freeze = pointer_null;

randomize();
var player = instance_create_layer(room_width/3, room_height/2, "Ships", obj_ship);
var enemy = instance_create_layer(2*room_width/3, room_height/2, "Ships", obj_enemy);

while instance_number(obj_box) < nboxes {
	var bx, by;
	var collide = false;
	bx = random_range(0.15*room_width, 0.85*room_width);
	by = random_range(0.15*room_height, 0.85*room_height);
	if point_distance(player.xx, player.yy, bx, by) < separation_dist or 
		point_distance(enemy.xx, enemy.yy, bx, by) < separation_dist {
		continue;
	}
	for (var i = 0; i < instance_number(obj_box); i++) {
		var other_box = instance_find(obj_box, i);
		if point_distance(other_box.xx, other_box.yy, bx, by) < separation_dist {
			collide = true;
			break;
		}
	}
	if not collide 
		var b = instance_create_layer(bx, by, "Boxes", obj_box);
		with b {
			image_xscale = 1.25;
			image_yscale = 1.25;
		}
}