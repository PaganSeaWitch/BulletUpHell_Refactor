@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons15.png")
extends PackedDataContainer
class_name BulletProps

enum CURVE_TYPE {NONE,LOOP_FROM_START,ONCE_THEN_DIE,ONCE_THEN_STAY,LOOP_FROM_END}
enum GROUP_SELECT{NEAREST_ON_HOMING,NEAREST_ON_SPAWN, NEAREST_ON_SHOT,NEAREST_ON_ANYWHERE, RANDOM}
enum LIST_BEHAVIOUR{STOP, LOOP, REVERSE}
enum TARGET_TYPE{NODE_PATH, POSITION, SPECIAL_NODE, GROUP, SURFACE, LIST_POSITIONS, LIST_NODES, MOUSE_CURSOR}

@export var speed: float = 100
@export var scale : float = 1
@export_range(-3.1416, 3.1416) var angle : float= 0
@export var groups : Array = []
@export var death_after_time : float = 30
@export var death_outside_box : Rect2 = Rect2()
@export var death_from_collision : bool = true


@export_subgroup("Animations", "anim")
@export var anim_idle: String = "0"
@export var anim_spawn: String 
@export var anim_waiting: String 
@export var anim_shoot: String 
@export var anim_delete: String 
@export var anim_idle_collision: String = "0"
@export var anim_shoot_collision: String 
@export var anim_spawn_collision: String 
@export var anim_waiting_collision: String 
@export var anim_delete_collision: String 


@export_subgroup("Sound Effects", "sfx")
@export var sfx_idle: String 
@export var sfx_shoot: String 
@export var sfx_spawn: String 
@export var sfx_waiting: String
@export var sfx_delete: String 

## movement
@export_subgroup("Advanced Movement", "movement")
@export var movement_type : CURVE_TYPE = CURVE_TYPE.NONE
@export var movement_direction_equation : String = ""
var movement_angular_equation : String = ""

var curve : Curve2D = null
@export var movement_speed_multiplier : Curve = Curve.new()
@export_range(-1, 999999) var movement_speed_multi_iterations : int = 0
@export var movement_speed_multi_scale : float

## special props
var spec_bounces = 0
var spec_no_collision = false
var spec_modulate:Gradient
var spec_modulate_loop:float = 0.0
var spec_skew:float = 0.0
var spec_rotating_speed = 0.0
var spec_trail_length:float = 0.0
var spec_trail_width:float = 0.0
var spec_trail_modulate:Color = Color.WHITE
#var spec_angle_no_colliding:float = 0.0
#var spec_angle_no_coll_offset:float = 0.0

## triggers
@export_subgroup("Triggers", "trigger")
@export var trigger_container:String
@export var trigger_wait_for_shot : bool = true

## homing
@export_subgroup("Homing", "homing")
@export var homing_type: TARGET_TYPE = TARGET_TYPE.NODE_PATH:
	set(value):
		homing_type = value
		notify_property_list_changed()

# is shown when target type is NODE_PATH
var homing_target: Node2D = null
# is shown when target type is SPEICAL_NODE
var homing_special_target:String

# is shown when target type is GROUP
var homing_group:String
# is shown when target type is GROUP, SURFACE & MOUSE_CURSOR
var homing_select_in_group:int = GROUP_SELECT.NEAREST_ON_HOMING

# is shown when target type is SURFACE
var homing_surface:Array


var homing_list:Array
# is shown when target type is LIST_POSITIONS
var homing_list_pos:Array[Vector2]

# is shown when target type is LIST_NODES
var homing_list_nodes:Array[NodePath]

# is shown when target type is LIST_POSITIONS & LIST_NODES
var homing_list_ordered:bool = true
var homing_when_list_ends:int = LIST_BEHAVIOUR.STOP

# is shown when target type is POSITION
var homing_position:Vector2
@export_range(0, 999) var homing_steer : float = 0
@export_range(0, 9999) var homing_time_start : int = 0
@export_range(0, 9999) var homing_duration : int = 999
var homing_mouse:bool

## advanced scale
@export_subgroup("Advanced Scale", "scale")
@export_range(-1, 999999) var scale_multi_iterations : int = 0
@export var scale_multiplier: Curve = Curve.new()
@export var scale_multi_scale : float = 1

## random
@export_subgroup("Randomizer", "r")
@export_range(0, 1) var r_randomisation_chances: float= 1
# physics
@export var r_speed_multi_iter_variation:Vector3
@export var r_speed_multi_scale_variation:Vector3
@export var r_rotating_variation:Vector3
@export var r_steer_variation:Vector3
@export var r_homing_delay_variation:Vector3
@export var r_homing_dur_variation:Vector3
@export var r_scale_multi_iter_variation:Vector3
@export var r_scale_multi_scale_variation:Vector3
@export var r_trail_length_variation:Vector3
@export var r_trail_color_variation:Vector3
# setup
@export var r_speed_choice:String
@export var r_speed_variation:Vector3
@export var r_scale_variation:Vector3
@export var r_angle_variation:Vector3
@export var r_group_choice:Array
@export var r_scale_choice:String
@export var r_angle_choice:String
@export var r_dir_equation_choice:String
@export var r_curve_choice:Array
@export var r_speed_multi_curve_choice:Array
@export var r_homing_target_choice:Array
@export var r_special_target_choice:String
@export var r_group_target_choice:String
@export var r_pos_target_choice:String
@export var r_steer_choice:String
@export var r_homing_delay_choice:String
@export var r_homing_dur_choice:String
@export var r_scale_multi_curve_choice:Array
@export var r_bounce_choice:String
@export var r_death_after_choice:String
@export var r_death_after_variation:Vector3
@export var r_trigger_choice:String
@export var r_bounce_variation:Vector3
@export var r_death_outside_chances:float
@export var r_wait_for_shot_chances:float
# draw
# animations directly in
#todo
var r_beam_length_choice:String
var r_beam_length_variation:Vector3
var r_beam_bounce_choice:String
var r_beam_width_variation:Vector3
var r_no_coll_chances:float
var r_modulate_variation:Vector3


var node_homing:Node2D
var node_container:Node2D




func _get_property_list() -> Array:
	
	var PL_homing = [
		{
			name = "homing_target",
			type = TYPE_NODE_PATH,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_position",
			type = TYPE_VECTOR2,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_special_target",
			type = TYPE_STRING,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_group",
			type = TYPE_STRING,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_surface",
			type = TYPE_ARRAY,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_list_pos",
			type = TYPE_ARRAY,
			hint = PROPERTY_HINT_ARRAY_TYPE,
			hint_string = "Vector2",
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_list_nodes",
			type = TYPE_ARRAY,
			hint = PROPERTY_HINT_ARRAY_TYPE,
			hint_string = "NodePath",
			usage = PROPERTY_USAGE_DEFAULT
		}]
	var PL_homing_group = [{
			name = "homing_select_in_group",
			type = TYPE_INT,
			hint = PROPERTY_HINT_ENUM,
			hint_string = "NEAREST_ON_HOMING,NEAREST_ON_SPAWN, NEAREST_ON_SHOT,NEAREST_ON_ANYWHERE, RANDOM",
			usage = PROPERTY_USAGE_DEFAULT
		}]
	var PL_homing_list = [{
			name = "homing_list_ordered",
			type = TYPE_BOOL,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_when_list_ends",
			type = TYPE_INT,
			hint = PROPERTY_HINT_ENUM,
			hint_string = "STOP, LOOP,REVERSE",
			usage = PROPERTY_USAGE_DEFAULT
		}]
	
	if homing_type != 7: PL_homing = [PL_homing[homing_type]]
	else: PL_homing = []
	if homing_type in [TARGET_TYPE.GROUP, TARGET_TYPE.SURFACE, TARGET_TYPE.MOUSE_CURSOR]: PL_homing += PL_homing_group
	elif homing_type in [TARGET_TYPE.LIST_NODES,TARGET_TYPE.LIST_POSITIONS]: PL_homing += PL_homing_list

	var homing_group = [{
			name = "Homing",
			type = TYPE_NIL,
			hint_string = "homing_",
			usage = PROPERTY_USAGE_GROUP
		}]
	return homing_group + PL_homing
