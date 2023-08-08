@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons16.png")
extends PatternOne
class_name PatternCustomPoints

enum SYM_TYPE{CLOSED_SHAPE,LINE}
enum ANGLE_TYPE{FROM_TANGEANT,FROM_CENTER,CUSTOM}

var shape : Curve2D
var pos : Array = []

@export var calculate_angles : int = ANGLE_TYPE.FROM_TANGEANT
@export var angles : Array = []
@export var center_pos : Vector2
@export var reversed_angle : bool = false


@export var symmetric : bool = false
@export var center : int = 0
@export var symmetry_type = SYM_TYPE.CLOSED_SHAPE


@export_subgroup("Random", "r")
@export var r_reversed_chances : float = 0
@export var r_angles_choice : Array = []
@export var r_symmetry_chances : float = 0


func _init():
	resource_name = "PatternCustomPoints"

