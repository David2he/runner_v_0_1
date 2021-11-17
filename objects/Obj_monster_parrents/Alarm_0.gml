/// Add in array the if of monster 

is_in_array = true;
ds_grid_resize(Obj_pj.monster_in_fight_with, ds_grid_width(Obj_pj.monster_in_fight_with)+1, 1);
Obj_pj.monster_in_fight_with[# ds_grid_width(Obj_pj.monster_in_fight_with)-1, 0] = id;

