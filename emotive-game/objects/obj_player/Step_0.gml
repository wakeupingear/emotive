/// @description Insert description here
// You can write your code in this editor

//For debug -- update emotion
if(keyboard_check_pressed(ord("0"))){emotion = Emotions.neutral;}
if(keyboard_check_pressed(ord("1"))){emotion = Emotions.angry;}
if(keyboard_check_pressed(ord("2"))){emotion = Emotions.disgust;}
if(keyboard_check_pressed(ord("3"))){emotion = Emotions.fear;}
if(keyboard_check_pressed(ord("4"))){emotion = Emotions.happy;}
if(keyboard_check_pressed(ord("5"))){emotion = Emotions.sad;}
if(keyboard_check_pressed(ord("6"))){emotion = Emotions.surprise;}

//Update emotion
if(emotion != lastEmotion){
	switch(emotion){
	case(Emotions.neutral):
		color1goal = make_color_rgb(155,171,178);
		color2goal = make_color_rgb(127,112,138);
		color3goal = make_color_rgb(105,79,98);
		goalWidth = 3;
		hitPower = 10;
		spd = 8;
		break;
	case(Emotions.angry):
		color1goal = make_color_rgb(234,79,54);
		color2goal = make_color_rgb(179,56,49);
		color3goal = make_color_rgb(110,39,39);
		goalWidth = 2;
		hitPower = 10;
		spd = 8;
		break;
	case(Emotions.disgust):
		color1goal = make_color_rgb(162,169,71);
		color2goal = make_color_rgb(103,102,51);
		color3goal = make_color_rgb(76,62,36);
		goalWidth = 3;
		hitPower = 10;
		spd = 8;
		break;
	case(Emotions.fear):
		color1goal = make_color_rgb(98,85,101);
		color2goal = make_color_rgb(62,53,70);
		color3goal = make_color_rgb(46,34,47);
		goalWidth = 3;
		hitPower = 10;
		spd = 8;
		break;
	case(Emotions.happy):
		color1goal = make_color_rgb(30,188,115);
		color2goal = make_color_rgb(35,144,99);
		color3goal = make_color_rgb(22,90,76);
		goalWidth = 3;
		hitPower = 15;
		spd = 12;
		break;
	case(Emotions.sad):
		color1goal = make_color_rgb(77,101,180);
		color2goal = make_color_rgb(72,74,119);
		color3goal = make_color_rgb(50,51,83);
		goalWidth = 3;
		hitPower = 10;
		spd = 8;
		break;
	case(Emotions.surprise):
		color1goal = make_color_rgb(246,129,129);
		color2goal = make_color_rgb(240,79,120);
		color3goal = make_color_rgb(131,28,93);
		goalWidth = 3;
		hitPower = 10;
		spd = 8;
		break;
	}
	
	lastEmotion = emotion;
}

//Update colors
color1 = make_color_rgb(lerp(color_get_red(color1), color_get_red(color1goal), colorSpd),
						lerp(color_get_green(color1), color_get_green(color1goal), colorSpd),
						lerp(color_get_blue(color1), color_get_blue(color1goal), colorSpd));
color2 = make_color_rgb(lerp(color_get_red(color2), color_get_red(color2goal), colorSpd),
						lerp(color_get_green(color2), color_get_green(color2goal), colorSpd),
						lerp(color_get_blue(color2), color_get_blue(color2goal), colorSpd));
color3 = make_color_rgb(lerp(color_get_red(color3), color_get_red(color3goal), colorSpd),
						lerp(color_get_green(color3), color_get_green(color3goal), colorSpd),
						lerp(color_get_blue(color3), color_get_blue(color3goal), colorSpd));


//Resize the paddle
image_xscale = lerp(image_xscale, goalWidth, 0.1);

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
if(!won && obj_ball.y > room_height){
	lost = true;
}

//Reset the game
if(won || lost){
	resetTimer--;
}
if(resetTimer <= 0){
	room_restart();
}
