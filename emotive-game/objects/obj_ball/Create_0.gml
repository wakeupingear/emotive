///Create

hsp = 0;
vsp = 7;

image_xscale = .25;
image_yscale = .25;

function collision(checkX, checkY){
	if(place_meeting(checkX, checkY, obj_brick)){
		instance_destroy(instance_place(checkX, checkY, obj_brick));
		return true;
	}
	if(checkX < 576 || checkX > 1472 - image_xscale*64 || checkY < 128){
		return true;
	}
}