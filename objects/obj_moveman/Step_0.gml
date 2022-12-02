/// @description player logic

// get variables
kLeft = keyboard_check(vk_left);
kRight = keyboard_check(vk_right);
kUp = keyboard_check_pressed(vk_up);

// run code
if (runstop = 0) {
	var vMove = kRight - kLeft;
}
else vMove = 0

if (keyboard_check(vk_shift)) or (runcheck = 1) {
	runcheck = 1;
	if (place_meeting(x,y+1,obj_inviswall)) {
	hsp = hsp + hsp * abs(vMove * 0.001 + hsp div 10 - vMove)
	}
	if (hsp*vMove > 10) {
		hsp = (10*vMove);
	}
	if (sign(vMove) != sign(hsp)) {
		runstop = 1;
		if (place_meeting(x,y+1,obj_inviswall)) {
			if (sign(hsp) = -1) {
				hsp = hsp + ffriction;
				if (hsp > 0) {
					hsp = 0;
				}
			}
			else {
				hsp = hsp - ffriction;
				if (hsp < 0) {
					hsp = 0;
				}
			}
		}
	}
}
else runcheck = 0
if (hsp = 0) and (runstop = 1) {
	runstop = 0;
	runcheck = 0;
}

// vertical movement
vsp = vsp + grav;

// horizontal movemant
if (runcheck = 0) {
	hsp = vMove * walksp;
}

if (place_meeting(x,y+1,obj_inviswall)) and (kUp) {
	vsp = -jsp 
}

// horizontal collision
if (place_meeting(x+hsp,y,obj_inviswall)) {
	while (!place_meeting(x+sign(hsp),y,obj_inviswall)) {
	x = x + sign(hsp); 
	}
	hsp = 0;
}
x = x + hsp;

// vertical collision
if (place_meeting(x,y+vsp,obj_inviswall)) {
	while (!place_meeting(x,y+sign(vsp),obj_inviswall)) {
	y = y + sign(vsp); 
	}
	vsp = 0;
}
y = y + vsp;

// animations
if (!place_meeting(x,y+1,obj_inviswall)) {
	sprite_index = spr_moveman_jump;
	image_speed = 0;
	if (vsp > 0) image_index = 2 else
	if (vsp < -2.4) image_index = 0 else image_index = 1
} else {
	image_speed = 1
	if (hsp = 0) {
		sprite_index = spr_moveman_idle
	} else {
	if (runstop = 1) {
		sprite_index = spr_moveman_jump
		image_index = 2
	}
	else sprite_index = spr_moveman_walk
	} if (keyboard_check(vk_shift)) and (hsp != 0) {
		sprite_index = spr_moveman_run
	}
}

if (hsp != 0) image_xscale = sign(hsp);

// oops I fell
if (y > 900 ) {
	obj_moveman.x = 96;
	obj_moveman.y = 288;
	hsp = 0
}


	