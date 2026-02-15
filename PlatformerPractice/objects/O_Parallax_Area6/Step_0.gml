/// @description Insert description here
// You can write your code in this editor

layer_x(fifthLayer, lerp(camera_get_view_x(view_camera[0]) / 1.25, camera_get_view_x(view_camera[0]), 0.55))
layer_x(fourthLayer, lerp(camera_get_view_x(view_camera[0]) / 1.25, camera_get_view_x(view_camera[0]), 0.65))
layer_x(thirdLayer, lerp(camera_get_view_x(view_camera[0]) / 1.25, camera_get_view_x(view_camera[0]), 0.75))
layer_x(secondLayer, lerp(camera_get_view_x(view_camera[0]) / 1.25, camera_get_view_x(view_camera[0]), 0.85))
layer_x(firstLayer, lerp(camera_get_view_x(view_camera[0]) / 1.25, camera_get_view_x(view_camera[0]), 0.95))

layer_y(fifthLayer, lerp(0, camera_get_view_y(view_camera[0]), 0.9))
layer_y(fourthLayer, lerp(0, camera_get_view_y(view_camera[0]), 0.9))
layer_y(thirdLayer, lerp(0, camera_get_view_y(view_camera[0]), 0.9))
layer_y(secondLayer, lerp(0, camera_get_view_y(view_camera[0]), 0.9))
layer_y(firstLayer, lerp(0, camera_get_view_y(view_camera[0]), 0.9)) 