///Create

hsp = 0;
vsp = 7;

image_xscale = .25;
image_yscale = .25;

function collision(checkX, checkY){
	if(place_meeting(checkX, checkY, obj_brick)){
		//Figure out the brick we hit
		var hitBlock = instance_place(checkX, checkY, obj_brick);
		var hitCenterX = hitBlock.x+56;
		var hitCenterY = hitBlock.y+28;
		
		//If we're mad, explode
		if(obj_player.emotion == Emotions.angry){
			//make particles
			for(var i = 0; i < 100; i++){
				var part = instance_create_layer(hitCenterX, hitCenterY, "Particles", obj_explosionParticle);
				part.life = random_range(15, 30);
				part.size = random_range(0.75, 1.5);
				part.spd = random_range(0, 3);
				part.dir = random_range(0, 2*pi);
			}
			
			//kill the other blocks
			if(random(1)<0.75){instance_destroy(instance_place(hitCenterX+112, hitCenterY, obj_brick))};
			if(random(1)<0.75){instance_destroy(instance_place(hitCenterX-112, hitCenterY, obj_brick))};
			if(random(1)<0.75){instance_destroy(instance_place(hitCenterX, hitCenterY+56, obj_brick))};
			if(random(1)<0.75){instance_destroy(instance_place(hitCenterX, hitCenterY-56, obj_brick))};
			
			//big shake
			obj_cameraController.startShake(10);
		}else{
			//Make normal particles
			for(var i = 0; i < 30; i++){
				var part = instance_create_layer(hitCenterX + random_range(-40, 40), hitCenterY + random_range(-20, 20), "Particles", obj_explosionParticle);
				part.life = random_range(15, 50);
				part.size = random_range(0.2, 1);
				part.spd = random_range(0, .5);
				part.dir = random_range(0, 2*pi);
			}
			
			//small shake
			obj_cameraController.startShake(3);
		}
		
		//Destroy the block we hit
		instance_destroy(hitBlock);
		return true;
	}
	if(checkX < 576 || checkX > 1472 - image_xscale*64 || checkY < 128){
		return true;
	}
}


function popSound(){
	var sound = irandom_range(0,5);
	show_debug_message(sound);
	switch(sound){
	case 0: audio_play_sound(snd_pop_1, 1, false); break;
	case 1: audio_play_sound(snd_pop_2, 1, false); break;
	case 2: audio_play_sound(snd_pop_3, 1, false); break;
	case 3: audio_play_sound(snd_pop_4, 1, false); break;
	case 4: audio_play_sound(snd_pop_5, 1, false); break;
	case 5: audio_play_sound(snd_pop_6, 1, false); break;
	}
}