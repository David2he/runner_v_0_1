// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_resize_ds_grid(){
	var array = argument[0];
	var colomn = argument[1];
	ds_grid_set_grid_region(array, array, colomn +1, 0, ds_grid_width(array), 1, colomn, 0);
	ds_grid_resize(array ,ds_grid_width(array) - 1, 1);
}