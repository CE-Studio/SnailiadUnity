extends Player


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	default_gravity = Statics.DirsSurface.FLOOR
	can_jump = [ [ -1 ] ]
	can_swap_gravity = [ [ -1, -3 ] ]
	retain_gravity_on_airborne = [ [ 8 ] ]
	can_gravity_jump_opposite = [ [ 8 ] ]
	can_gravity_jump_adjacent = [ [ 8 ] ]
	can_gravity_shock = [ [ -1 ] ]
	shellable = [ [ -1 ] ]
	hop_while_moving = [ [ -2 ] ]
	hop_power = 0.0
	can_round_inner_corners = [ [ -1 ] ]
	can_round_outer_corners = [ [ -1 ] ]
	can_round_opposite_outer_corners = [ [ 8 ] ]
	stick_to_walls_when_hurt = [ [ 8 ] ]
	run_speed = [ 8.6667, 8.6667, 8.6667, 11 ]
	jump_power = [ 26.5, 26.5, 26.5, 26.5, 31.125, 31.125, 31.125, 31.125 ]
	gravity = [ 1.5, 1.5, 1.5, 1.5 ]
	terminal_velocity = [ 0.5208, 0.5208, 0.5208, 0.5208 ]
	jump_floatiness = [ 4, 4, 4, 4, 4, 4, 4, 4 ]
	#weapon_cooldowns
	apply_rapid_fire_multiplier = true
	time_until_idle = 30.0
	hitbox_size_normal = Vector2(24, 13)
	hitbox_offset_normal = Vector2(0, 1.5)
	hitbox_offset_shell = Vector2(12, 13)
	hitbox_offset_shell = Vector2(-3, 1.5)
	#unshell_adjust
	shell_turnaround_adjust = 0.1667
	coyote_time = 0.0625
	jump_buffer = 0.125
	grav_shock_charge_time = 0.75
	grav_shock_charge_mult - 0.5
	grav_shock_speed = 40.0
	grav_shock_steering = 2.5
	damage_multiplier = 1
	health_gain_from_parry = 4
	sprite.action = "0.ground.right.idle"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super(delta)
	pass
