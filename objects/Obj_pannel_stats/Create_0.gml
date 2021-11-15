image_xscale =  global.scale_window;
image_yscale = global.scale_window;

t_dammage = 0;
t_first_attack = 0;
t_movement_speed = 0;
t_current_speed = 0;
t_distance_travelled = 0;
t_gold_earned = 0;
t_gold_current = 0;


all_displayable_stats = 
[
	["Dammage", Obj_pj.damage],
	["First Attack", Obj_pj.current_damage],
	["Movement speed", Obj_pj.movement_speed],
	["Current speed", Obj_pj.curent_movement_speed],
	["distance km",round(Obj_pj.running_stat_counter)],
	["Gold earned", Obj_pj.gold_earned],
	["Gold current", Obj_pj.current_gold],
];

all_displayable_stats_transformed = [
	["Dammage", t_dammage],
	["First Attack", t_first_attack],
	["Movement speed", t_movement_speed],
	["Current speed", t_current_speed],
	["distance km", t_distance_travelled],
	["Gold earned", t_gold_earned],
	["Gold current", t_gold_current],
]

initial_y_draw_stats = y + 75 * (global.scale_window * 0.75);