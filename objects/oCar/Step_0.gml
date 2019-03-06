/// @description 
var hor, ver;
hor = (keyboard_check(ord("D")) || keyboard_check(vk_right))-(keyboard_check(ord("A")) || keyboard_check(vk_left));
ver = (keyboard_check(ord("S")) || keyboard_check(vk_down))-(keyboard_check(ord("W")) || keyboard_check(vk_up));

//Movement
if (phy_speed<topspeed){
    physics_apply_local_force(0, 0, -(accspeed*sprite_width*ver), 0);
}

//Rotation
if (abs(phy_angular_velocity)<toprot){
    physics_apply_torque(hor*accrot);
}