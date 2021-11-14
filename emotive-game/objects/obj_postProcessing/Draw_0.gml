///Draw

///Darkness
if(!surface_exists(darkSurf)){
	darkSurf = surface_create(1920, 1080);
}
surface_set_target(darkSurf);
draw_clear(make_color_rgb(46,34,47));
gpu_set_blendmode(bm_subtract);
draw_circle(obj_ball.x - 128, obj_ball.y - 128, 300, false);
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



