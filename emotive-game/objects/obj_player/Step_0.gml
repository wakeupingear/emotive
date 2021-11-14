/// @description Insert description here
// You can write your code in this editor

//Move according to input
var moveDir = keyboard_check(ord("D")) - keyboard_check(ord("A"));
if(moveDir == 0){
	moveDir = keyboard_check(vk_right) - keyboard_check(vk_left)
}
x = clamp(x + spd*moveDir, 576, 1472 - image_xscale*64);


//Check for win
if(instance_number(obj_brick) == 0){
	won = true;
}

//Check for loss
if(obj_ball.y > room_height){
	lost = true;
}

//Reset the game
if(won || lost){
	resetTimer--;
}
if(resetTimer <= 0){
	room_restart();
}
