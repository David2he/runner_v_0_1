y = global.ground_level;

max_hp = undefined;
current_hp = undefined;
is_dead = false;
hitted = false;
color_c_blend_monster = c_white;
sprite_running = undefined;
sprite_idle = undefined;
sprite_hurted = undefined;
//sprite_die = undefined;

ammount_of_gold = 0;

is_in_the_area = false;
queue = ds_grid_width(Obj_pj.monster_waiting_queue);



can_be_added = 0;
is_in_array = false;


ds_grid_resize(Obj_pj.monster_waiting_queue, ds_grid_width(Obj_pj.monster_waiting_queue)+1, 1);
ds_grid_add(Obj_pj.monster_waiting_queue, ds_grid_width(Obj_pj.monster_waiting_queue)-1, 0, id);



