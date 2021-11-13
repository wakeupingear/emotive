/// @description Insert description here
// You can write your code in this editor

//Draw the paddle
/*
draw_sprite_ext(spr_block, 0, x, y, image_xscale, image_yscale, 0, color1, 1);
draw_sprite_ext(spr_ball, 0, x-16, y, image_yscale, image_yscale, 0, color1, 1);
draw_sprite_ext(spr_ball, 0, x + image_xscale*64 - 16, y, image_yscale, image_yscale, 0, color1, 1);
*/
draw_sprite_ext(spr_player, 0, x, y, image_xscale*2, image_yscale*2, 0, color1, 1);

//Draw Text
if(won){
	draw_set_color(color1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_large);
	draw_text(room_width/2, room_height/2, "You Won!");
	draw_set_color(c_white);
}
if(lost){
	draw_set_color(color1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_large);
	draw_text(room_width/2, room_height/2, "You Lost...");
	draw_set_color(c_white);
}