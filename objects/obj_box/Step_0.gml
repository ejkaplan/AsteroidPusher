/// @description Insert description here
// You can write your code in this editor
xx = phy_position_x;
yy = phy_position_y;

if xx > room_width + sprite_width/2 {
	xx = -sprite_width/2;
} else if xx < -sprite_width/2 {
	xx = room_width + sprite_width/2;
}
if yy > room_height + sprite_height/2 {
	yy = -sprite_height/2;
} else if yy < -sprite_height/2 {
	yy = room_height + sprite_height/2;
}

phy_position_x = xx;
phy_position_y = yy;