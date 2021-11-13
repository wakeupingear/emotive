/// @description Insert description here
// You can write your code in this editor

spd = 8;

hitPower = 10;
hitTightening = 80;

color1 = c_aqua;
color2 = c_blue;
color3 = c_navy;

image_xscale = 2;
image_yscale = .5;

won = false;
lost = false;
resetTimer = 120;


//Make the bricks
for(var yy = 0; yy < 5; yy++){
	for(var xx = 0; xx < 8; xx++){
		var newX = 576 + xx*112;
		var newY = 288 + yy*56;
		instance_create_layer(newX, newY, "Bricks", obj_brick);
	}
}