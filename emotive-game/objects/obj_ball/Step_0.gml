///Step


//Collide with the player
if(place_meeting(x + hsp, y+vsp, obj_player)){
	var playerCenterX = obj_player.x + 32*obj_player.image_xscale;
	var playerCenterY = obj_player.y + 32*obj_player.image_yscale + obj_player.hitTightening;	//The addition makes the hits trend upwards more
	var hitDir = point_direction(playerCenterX, playerCenterY, x, y);
	hsp = cos(degtorad(hitDir)) * obj_player.hitPower;
	vsp = -sin(degtorad(hitDir)) * obj_player.hitPower;
	
	//fx
	obj_cameraController.startShake(round(obj_player.hitPower/2));
}

///Move and bounce off bricks or walls
//Move horizontally
var hdir = hsp >= 0 ? 1 : -1;
if(collision(x + hsp, y)){
	for(var dx = 0; dx < abs(hsp); dx++){
		if(collision(x+hdir, y)){
			break;
		}
		x += hdir;
	}
	hsp = -hsp;
}else{
	x += hsp;
}

//Move vertically
var vdir = vsp >= 0 ? 1 : -1;
if(collision(x, y + vsp)){
	for(var dy = 0; dy < abs(vsp); dy++){
		if(collision(x, y+vdir)){
			break;
		}
		y += vdir;
	}
	vsp = -vsp;
}else{
	y += vsp;
}