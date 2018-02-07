key_left = -keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));

if(keyboard_check_released(ord("W")) && vsp <0){
	vsp /= 2;
}
//if(keyboard_check(ord("W")));
//if(keyboard_check(ord("S")));

move = key_left + key_right;

hsp = move * moveSpd;

image_xscale = sign(hsp) == 0 ? image_xscale : sign(hsp);

if (vsp < 10){
	vsp += g;
}

if (place_meeting(x,y+1,obj_floor)){
	vsp = key_jump * -jmpSpd;
}

//Horizontal Collision
if(place_meeting(x+hsp,y, obj_floor) && sprite_index != spr_player_grapple){
	show_debug_message("test Horizontal Collision");
	while(!place_meeting(x+sign(hsp),y,obj_floor)){
		x += sign(hsp);
	}
	hsp = 0;
}

if(place_meeting(x,y, obj_floor) && sprite_index != spr_player_grapple){
	show_debug_message("test already grapple");
	hsp = -image_xscale;
	while(place_meeting(x,y,obj_floor)){
		x -= sign(hsp);
		show_debug_message(x);
	}
	hsp = 0;
}

x += hsp;
//Vertical Collision
if(place_meeting(x,y + vsp, obj_floor)){
	show_debug_message("test Vertical Collision");
	while(!place_meeting(x,y + sign(vsp),obj_floor)){
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;