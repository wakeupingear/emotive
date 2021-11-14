/// @description Insert description here
// You can write your code in this editor

if(obj_player.emotion == Emotions.disgust){
	waviness = lerp(waviness, 1, 0.1);
}else{
	waviness = lerp(waviness, 0, 0.1);
}

if(obj_player.emotion == Emotions.fear){
	darkness = lerp(darkness, 1, 0.1);
}else{
	darkness = lerp(darkness, 0, 0.1);
}