/// @description player logic

// get variables
kLeft = keyboard_check(vk_left);
kRight = keyboard_check(vk_right);
kUp = keyboard_check_pressed(vk_up);

// vertical movement
var vMove = kRight - kLeft;
vsp = vsp + grav;

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
	sprite_index = spr_moveman_walk
	} if (keyboard_check(vk_shift)) and (hsp != 0) {
		sprite_index = spr_moveman_run
	}
}

if (hsp != 0) image_xscale = sign(hsp);

// oops I fell
if (y > 900 ) {
	obj_moveman.x = 96;
	obj_moveman.y = 288;
}
// run code
if (keyboard_check(vk_shift)) {
	runcheck = 1;
	hsp = hsp + vMove*0.2
}
else runcheck = 0

// horizontal movemant
if (runcheck = 0) {
	hsp = vMove * walksp;
}
	