/// @description 
show_debug_overlay(1); //Show FPS

//Level
levelPath = asset_get_index("path" + string_digits(room_get_name(room)));
pathWidth = 128;
pathColor = c_white;

//Cars
instance_create_layer(path_get_point_x(levelPath, 0), path_get_point_y(levelPath, 0), "Instances", oCar);

//Vertex
vertex_format_begin();

vertex_format_add_position();
vertex_format_add_color();

vFormat = vertex_format_end();

vBuff = vertex_create_buffer();

vertex_begin(vBuff, vFormat);

//Fixture
levelFix1 = physics_fixture_create();
physics_fixture_set_chain_shape(levelFix1, 1);
levelFix2 = physics_fixture_create();
physics_fixture_set_chain_shape(levelFix2, 1);

var pathSize = path_get_number(levelPath);
var incr = (1/pathSize)/8;
for(var i=0; i<=1; i+=incr){
    //Vertex
    var px = path_get_x(levelPath, i mod 1);
    var py = path_get_y(levelPath, i mod 1);
    
    var pnext = (i+incr) mod 1;
	
	var pxn = path_get_x(levelPath, pnext);
	var pyn = path_get_y(levelPath, pnext);
	var pdir = point_direction(px, py, pxn, pyn);
        
    var px1 = px + lengthdir_x(pathWidth/2, pdir-90);
    var py1 = py + lengthdir_y(pathWidth/2, pdir-90);
    var px2 = px + lengthdir_x(pathWidth/2, pdir+90);
    var py2 = py + lengthdir_y(pathWidth/2, pdir+90);
    
    vertex_position(vBuff, px1, py1);
    vertex_colour(vBuff, pathColor, 1);
    vertex_position(vBuff, px2, py2);
    vertex_colour(vBuff, pathColor, 1);
	
	//Fixture
	physics_fixture_add_point(levelFix1, px1, py1);
	physics_fixture_add_point(levelFix2, px2, py2);
}

vertex_end(vBuff);
vertex_freeze(vBuff);

physics_fixture_bind(levelFix1, id);
physics_fixture_delete(levelFix1);
physics_fixture_bind(levelFix2, id);
physics_fixture_delete(levelFix2);