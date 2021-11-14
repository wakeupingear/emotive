///Draw

///Darkness
if(!surface_exists(darkSurf)){
	darkSurf = surface_create(1920, 1080);
}
surface_set_target(darkSurf);
draw_clear_alpha(make_color_rgb(46,34,47), darkness);
gpu_set_blendmode(bm_subtract);
var scale = max(obj_cameraController.base_width / obj_cameraController.width, obj_cameraController.base_height / obj_cameraController.height);
draw_circle((obj_ball.x - 64)/scale, (obj_ball.y - 64)/scale, 300/scale, false);
gpu_set_blendmode(bm_normal);
surface_reset_target();

///Waviness
//Make sure our surface exists
if(!surface_exists(postSurf)){
	postSurf = surface_create(1920, 1080);
}

//Apply the shader
var uTime = shader_get_uniform(shd_wavy,"Time");
var uMag = shader_get_uniform(shd_wavy,"Mag");
shader_set(shd_wavy);
shader_set_uniform_f(uTime,current_time/1500);
shader_set_uniform_f(uMag,waviness/150);

//Copy it over
surface_copy(postSurf, 0, 0, application_surface);

//Reset the shader
shader_reset();

//Draw the darkness onto postsurf
surface_set_target(postSurf);
draw_surface(darkSurf, 0, 0);
surface_reset_target();