xorigin = argument0;
yorigin = argument1;
xtarget = argument2;
ytarget = argument3;
out[0] = xtarget;
out[1] = ytarget;
for (xoff = -1; xoff <= 1; xoff += 2) {
	xnew = xtarget + xoff * room_width;
	if (abs(xorigin - xnew) < abs(xorigin - out[0]))
		out[0] = xnew;
}
for (yoff = -1; yoff <= 1; yoff += 2) {
	ynew = ytarget + yoff * room_height;
	if (abs(yorigin - ynew) < abs(yorigin - out[1])) 
		out[1] = ynew;
}
return out;