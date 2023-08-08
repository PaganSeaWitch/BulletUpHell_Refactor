@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons17.png")
extends PatternOne
class_name PatternCustomArea

var limit_rect : Rect2 = Rect2(99999,99999,-99999,-99999)
var polygon : PackedVector2Array
var pos : Array = []

@export var center_pos : Vector2
@export var tries_max : int = 5
@export var pooling : int = 10
@export var grid_spawning : Vector2 = Vector2(0,0)


@export_subgroup("Random", "r")
@export var r_grid_choice : String
@export var r_grid_x_variation : Vector3
@export var r_grid_y_variation : Vector3


func _init():
	resource_name = "PatternCustomArea"

