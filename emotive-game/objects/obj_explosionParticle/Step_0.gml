/// @description Insert description here
// You can write your code in this editor

x += spd*cos(dir);
y -= spd*sin(dir);
lifespan++;
image_xscale = size * (1 - power(2, 10*(lifespan / life - 1)));
image_yscale = image_xscale;


if(lifespan >= life){
	instance_destroy();
}