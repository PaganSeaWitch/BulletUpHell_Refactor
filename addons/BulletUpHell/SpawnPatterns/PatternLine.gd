@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons7.png")
extends PatternOne
class_name PatternLine


@export var offset : Vector2 = Vector2()
@export var center : int = 1
@export var symmetric : bool = true
var symmetry_type : int = 1

@export_subgroup("Random", "r")
@export var r_offset_choice : String
@export var r_offset_x_variation : Vector3
@export var r_offset_y_variation : Vector3
@export var r_center_choice : String
@export var r_symmetry_chances : float = 0


func _init():
	resource_name = "PatternLine"
