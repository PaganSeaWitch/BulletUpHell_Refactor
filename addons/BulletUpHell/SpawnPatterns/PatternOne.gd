@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons8.png")
class_name PatternOne
extends NavigationPolygon

enum LATENCE {STAY, MOVE, SPIN, FOLLOW, TARGET}
enum MOMENTUM{NONE, TRANS_LINEAR,TRANS_SINE,TRANS_QUINT,TRANS_QUART,TRANS_QUAD,TRANS_EXPO,TRANS_ELASTIC,TRANS_CUBIC, \
				TRANS_CIRC,TRANS_BOUNCE,TRANS_BACK}
var has_random : bool = false

@export var bullet : String = ""
@export_range(0, 999999) var nbr : int = 1
@export_range(-3.1416, 3.1416) var pattern_angle : float = 0
@export_range(0, 999) var iterations : int = 1
@export var follows_parent : bool = false
@export_subgroup("Forced Angle", "forced")
@export_range(-3.1416, 3.1416) var forced_angle : float = 0.0
@export var forced_target : Node2D
@export var forced_lookat_mouse : bool = false
@export var forced_pattern_lookat : bool = false


@export_subgroup("Cooldowns", "cooldown")
@export var cooldown_stasis : bool = false
@export_range(0, 9999) var cooldown_spawn : float = 0.017
@export_range(0, 9999) var cooldown_shoot : float = 0
@export_range(0, 9999) var cooldown_next_spawn : float = 0
@export_range(0, 9999) var cooldown_next_shoot : float = 0

@export_subgroup("Wait", "wait")
@export var wait_latence : LATENCE = LATENCE.STAY
@export var wait_tween_momentum : MOMENTUM = MOMENTUM.NONE
@export_range(0, 9999) var wait_tween_length : float = 0
@export_range(0, 9999) var wait_tween_time : float = 0

@export_subgroup("Layers", "layer")
@export var layer_nbr : int = 1
@export_range(0, 9999) var layer_cooldown_spawn : float = 0
#export (float) var cooldownshoot = 0
@export_range(0, 9999) var layer_pos_offset : float = 0
@export_range(0, 9999) var layer_speed_offset : float = 0
@export_range(-3.1416, 3.1416) var layer_angle_offset : float = 0

@export_subgroup("Random", "r")
@export_range(0, 1) var r_randomisation_chances : float = 1
@export var r_bullet_choice : String
@export var r_bullet_nbr_choice : String
@export var r_bullet_nbr_variation : Vector3
@export var r_pattern_angle_choice : String
@export var r_pattern_angle_variation : Vector3
@export var r_infinite_iter_chances : float = 0
@export var r_iterations_choice : String
@export var r_iterations_variation : Vector3
@export var r_forced_angle_choice : String
@export_range(-3.1416, 3.1416) var r_forced_angle_variation : float
@export var r_forced_target_choice : Array
@export var r_stasis_chances : float = 0
@export var r_cooldown_spawn_choice : String
@export var r_cooldown_spawn_variation : Vector3
@export var r_cooldown_shoot_choice : String
@export var r_cooldown_shoot_variation : Vector3
@export var r_cooldown_n_spawn_choice : String
@export var r_cooldown_n_spawn_variation : Vector3
@export var r_cooldown_n_shoot_choice : String
@export var r_cooldown_n_shoot_variation : Vector3


func _init():
	resource_name = "PatternOne"

