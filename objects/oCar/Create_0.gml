/// @description 
//Car
topspeed = 20;
accspeed = 10;
toprot = 200;
accrot = 80;

//Camera
view_enabled = true;
view_visible[0] = true;

var width = 480, height = 270, scale = 2;

var cam = camera_create_view(0, 0, width, height, 0, id, -1, -1, width/2, height/2);
view_set_camera(0, cam);

window_set_size(width*scale, height*scale);
surface_resize(application_surface, width*scale, height*scale);

window_set_position(display_get_width()/2-(width*scale)/2, display_get_height()/2-(height*scale)/2);