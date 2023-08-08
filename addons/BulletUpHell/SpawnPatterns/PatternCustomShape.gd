@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons9.png")
extends PatternOne
class_name PatternCustomShape

var shape : Curve2D
var angles : Array = []
var pos : Array = []

@export var closed_shape = false
@export var center_pos : Vector2
@export var symmetric : bool = false
@export var center : int = 0
var symmetry_type = 1

@export_subgroup("Random", "r")
var r_radius_choice : String
var r_radius_variation: Vector3
var r_angle_total_choice : String
var r_angle_total_variation : Vector3
var r_angle_decal_choice : String
var r_angle_decal_variation : Vector3
@export_range(0, 1) var r_symmetry_chances : float = 0


func _init():
	resource_name = "PatternCustomShape"
