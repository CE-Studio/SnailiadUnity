class_name Player
extends CutsceneControllable


#region Global control
const MAX_DIST_CASTS:int = 4
const THIN_TUNNEL_ENTRANCE_STEPS:int = 16
const DIST_CAST_EDGE_BUFFER:int = 0
const STUCK_DETECT_MARGIN:float = PlayState.FRAC_64

var gravity_dir:PlayState.DirsSurface
var last_gravity:PlayState.DirsSurface
var home_gravity:PlayState.DirsSurface
var current_surface:PlayState.DirsSurface
var facing_left:bool
var facing_down:bool
var selected_weapon:int
var armed:bool
var health:int
var max_health:int
var stunned:bool
var in_death_cutscene:bool
var underwater:bool
var velocity:Vector2
var grounded:bool
var grounded_last_frame:bool
var shelled:bool
var ungrounded_via_hop:bool
var last_distance:float
var toggle_mode_active:bool
var speed_mod:float
var jump_mod:float
var gravity_mod:float
var holding_jump:bool
var holding_shell:bool
var axis_flag:bool
var against_wall:bool
var fire_cooldown:float
var idle_timer:Timer
var is_idling:bool
var read_i_speed:int
var read_i_jump:int
var jump_buffer_counter:float
var coyote_time_counter:float
var last_point_before_hop:float
var force_face_x:int
var force_face_y:int
#endregion


#region Character control
# Movement control vars
# Any var tagged with "[I]" (as in "item") follows this scheme:
# -1 = always, -2 = never, any item ID = item-bound, -3 = disabled by Gravity Lock
# Item scheme variables can contain multiple values, denoting an assortment of items
# that can fulfill a given check
# Example: setting hopWhileMoving to { { 4, 7 }, 8 } will make Snaily hop along the
# ground if they find either (High Jump AND Ice Snail) OR Gravity Snail

var default_gravity:PlayState.DirsSurface
# Determines the default direction gravity pulls the player
var can_jump
# [I] Determines if the player can jump
var can_swap_gravity
# [I] Determines if the player can change their gravity state
var retain_gravity_on_airborne
# [I] Determines whether or not player keeps their current gravity when in the air
var can_gravity_jump_opposite
# [I] Determines if the player can change their gravity mid-air to the opposite direction
var can_gravity_jump_adjacent
# [I] Determines if the player can change their gravity mid-air relatively left or relatively right
var can_gravity_shock
# [I] Determines if the player is capable of using Gravity Shock
var shellable
# [I] Determines if the player can retract into a shell
var hop_while_moving
# [I] Determines if the player bounces along the ground when they move
var hop_power
# The power of a walking bounce
var can_round_inner_corners
# [I] Determines if the player can round inside corners
var can_round_outer_corners
# [I] Determines if the player can round outside corners
var can_round_opposite_outer_corners
# [I] Determines if the player can round outside corners opposite the default gravity
var stick_to_walls_when_hurt
# [I] Determines if the player returns to their default gravity when taking damage
var run_speed
# Contains the speed at which the player moves with each shell upgrade
var jump_power
# Contains the player's jump power with each shell upgrade. The second half of the array assumes High Jump
var gravity
# Contains the gravity scale with each shell upgrade
var terminal_velocity
# Contains the player's terminal velocity with each shell upgrade
var jump_floatiness
# Contains how floaty the player's jump is when the jump button is held with each shell upgrade + High Jump
var weapon_cooldowns
# Contains the cooldown in seconds of each weapon. The second half of the array assumes Rapid Fire
var apply_rapid_fire_multiplier:bool
# Determines if collecting Rapid Fire affects bullet velocity
var time_until_idle:float
# Determines how long the player must remain idle before playing an idle animation
#public List<Particle> idleParticles; // -------------------------- Contains every particle used in the player's idle animation so that they can be despawned easily
var hitbox_size_normal:Vector2
# The size of the player's hitbox
var hitbox_size_shell:Vector2
# The size of the player's hitbox while in their shell
var hitbox_offset_normal:Vector2
# The offset of the player's hitbox
var hitbox_offset_shell:Vector2
# The offset of the player's hitbox while in their shell
var unshell_adjust:float
# The amount the player's position is adjusted by when unshelling near a wall
var shell_turnaround_adjust:float
# The amount the player's position is adjusted when turning around in the air while shelled
var coyote_time:float
# How long after leaving the ground via falling the player is still able to jump for
var jump_buffer:float
# How long after pressing the jump button the player will continue to try to jump, in case of an early press
var grav_shock_charge_time:float
# How long it takes for Gravity Shock to fire off after charging
var grav_shock_charge_mult:float
# A fractional multiplier applied to Gravity Shock's charge time when Rapid Fire has been acquired
var grav_shock_speed:float
# How fast Gravity Shock travels
var grav_shock_steering:float
# How fast Gravity Shock can be steered perpendicular to its fire direction
var damage_multiplier:float
# A fractional multiplier applied to any damage taken to increase/decrease characters' defense
var health_gain_from_parry:int
# How much health you recover from a Perfect Parry
#endregion


var sprite:Sprite2D
var body:CharacterBody2D
var box:CollisionShape2D


func _ready():
	pass


func _process(delta):
	pass
