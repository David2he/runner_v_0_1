randomize();

global.scale_window = 1.5;
global.ground_level = 945;

depth = -2;
x = (window_get_width() / 3) - sprite_width;
y = global.ground_level - sprite_height * (4 * global.scale_window);

image_xscale = 4 * global.scale_window;
image_yscale = 4 * global.scale_window;



/// MOVEMENT
movement_speed = 1;
curent_movement_speed = movement_speed;
running_stat_counter = 0;
lower_movement_speed = 0;
run_animation_speed = 0.9;
ground_speed = 0;

/// STAT VALUES
gold_earned = 0;
current_gold = gold_earned;


// VALUES HANDLE FIGHT
reset_frame = true;
combo = 0;
is_fighting = false;
will_be_a_crit = false;
//is_a_crit = false;
end_fight = false;
current_effect = 0;

/// STAT DAMAGE
damage = 10;
current_damage = damage + movement_speed/5;;
crit_rate = 0.2;
crit_bonus_damage = 1.5;
first_attack = true;
attack_animation_speed = 1;


check_os = 0;

monster_waiting_queue = ds_grid_create(0, 0);
monster_in_fight_with = ds_grid_create(0, 0);
max_enemies_stacked_in_fight = 5;
all_monster = [];

how_many_enemies_dies_begin = 0;
how_many_enemies_dies_last = 5;

cut_through_the_enemies = 1.25;