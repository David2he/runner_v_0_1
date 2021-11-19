randomize();

global.scale_window = 1.5;
global.ground_level = 945;

depth = -2;
x = (window_get_width() / 3) - sprite_width;
y = global.ground_level - sprite_height * (4 * global.scale_window);


middle_x_player = x + sprite_width / 2;
show_debug_message(middle_x_player);

image_xscale = 4 * global.scale_window;
image_yscale = 4 * global.scale_window;
show_debug_message("------");

middle_x_player = x + sprite_width / 2;
show_debug_message(middle_x_player);

// LIFE
max_hp = 100;
current_hp = max_hp;
armor = 5;
flat_armor = 5;
is_dead = false;

game_over = false;

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
attack_animation_speed = 0.9;
cut_through_the_enemies = 1.25;
check_os = 0;


monster_waiting_queue = ds_grid_create(0, 0);
monster_in_fight_with = ds_grid_create(0, 0);

all_monster = [];

how_many_enemies_dies_begin = 0;
how_many_enemies_dies_last = 5;

max_enemies_stacked_in_fight = 5;




/// GAME OVER CASE	
ratio_effect_death = 0;
reset_frame_death_allowed = true;