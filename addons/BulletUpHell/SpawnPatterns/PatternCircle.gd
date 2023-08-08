@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons6.png")
extends PatternOne
class_name PatternCircle

#pos
@export var radius = 0
@export var angle_total = PI*2
@export var angle_decal = 0
@export var symmetric : bool = false
@export var center : int = 0
var symmetry_type = 0

@export_subgroup("Random", "r")
@export var r_radius_choice : String
@export var r_radius_variation : Vector3
@export var r_angle_total_choice : String
@export var r_angle_total_variation : Vector3
@export var r_angle_decal_choice : String
@export var r_angle_decal_variation : Vector3
@export var r_symmetry_chances : float = 0


func _init():
	resource_name = "PatternCircle"
