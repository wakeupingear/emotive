///Step


//Collide with the player
var hitSomething = false;
if(place_meeting(x + hsp, y+vsp, obj_player)){
	var playerCenterX = obj_player.x + 32*obj_player.image_xscale;
	var playerCenterY = obj_player.y + 32*obj_player.image_yscale + obj_player.hitTightening;	//The addition makes the hits trend upwards more
	var hitDir = point_direction(playerCenterX, playerCenterY, x, y);
	if(obj_player.emotion == Emotions.surprise){ hitDir = random_range(20, 160); }
	if(obj_player.emotion == Emotions.fear){
		//pick a random brick, and shoot at it
		var bricks = instance_number(obj_brick);
		if(bricks > 0){
			var target = instance_find(obj_brick, irandom_range(0, bricks-1));
			hitDir = point_direction(x, y, target.x + 56, target.y + 28);
		}
	}
	hsp = cos(degtorad(hitDir)) * obj_player.hitPower;
	vsp = -sin(degtorad(hitDir)) * obj_player.hitPower;
	
	//fx
	obj_cameraController.startShake(round(obj_player.hitPower/2));
	hitSomething = true;
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
	hitSomething = true;
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
	hitSomething = true;
}else{
	y += vsp;
}

//Play sound
if(hitSomething){
	popSound();
}