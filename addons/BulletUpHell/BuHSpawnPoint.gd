@tool
extends Node2D

@export_category("Spawn point")
@export var auto_pattern_id:String = ""
@export var rotating_speed: float = 0.0
@export var active:bool = true
@export var shared_area_name :String = "0"

@export var pool_amount:int = 50

@export_subgroup("Autostart & Triggering")
@export var auto_start_on_cam:bool = true
@export var auto_start_after_time:float = 0.0
@export var auto_start_at_distance:float = 5
@export var auto_distance_from:Node2D = null

@export_subgroup("Advanced Triggering")
@export var trigger_container:TriggerContainer = null

var shared_area : Area2D
var trigger_counter = 0

var trigger_timeout:bool = false
var trigger_time:float = 0
var trig_collider
var trig_signal


var r_randomisation_chances:float
var r_active_chances:float
var r_shared_area_choice:String
var r_rotating_variation:Vector3
var r_pattern_choice:String
var r_start_time_choice:String
var r_start_time_variation:Vector3
@export var spawn_path: Curve2D

var can_respawn:bool = true



func _ready():
	if Engine.is_editor_hint(): return
	assert(!auto_pattern_id.is_empty(), "spawn point needs a auto pattern ID to work!")
	
	if !shared_area_name.is_empty():
		shared_area = Spawning.get_shared_area(shared_area_name)

	else: 
		push_error("Spawnpoint doesn't have any shared_area")
		
	
	
	if auto_start_on_cam:
		var instance = VisibleOnScreenNotifier2D.new()
		instance.connect("screen_entered",Callable(self,"on_screen").bind(true))
		instance.connect("screen_exited",Callable(self,"on_screen").bind(false))
	
	elif auto_distance_from != null: 
		set_physics_process(true)
		

	if active:
		if auto_start_after_time > float(0.0):
			await get_tree().create_timer(auto_start_after_time, false).timeout
		set_physics_process(active)
	
	if rotating_speed > 0: 
		set_physics_process(active)
	
	if active && pool_amount > 0:
		var props = Spawning.pattern(auto_pattern_id)["bullet"]
		Spawning.create_pool(props, shared_area_name, pool_amount, !Spawning.bullet(props).has("anim_idle_collision"))
		

#		set_physics_process(false)


var _delta:float
func _physics_process(delta):
	if Engine.is_editor_hint(): return
	_delta = delta
	rotate(rotating_speed)
	if trigger_container != null:
		check_trigger()
		return
	
	if auto_distance_from != null:
		if(global_position.distance_to(auto_distance_from.global_position) <= auto_start_at_distance):
			active = true
		else:
			active = false


	if can_respawn && active && !auto_pattern_id.is_empty():
		Spawning.spawn(self, auto_pattern_id, shared_area_name)
		can_respawn = false
		if !rotating_speed > 0: 
			set_physics_process(false)
		

func on_screen(is_on : bool) -> void:
	if is_on && auto_start_after_time > float(0.0):
		await get_tree().create_timer(auto_start_after_time).timeout
	active = is_on
	set_physics_process(active)


func trigger_signal(sig):
	trig_signal = sig
	check_trigger()


func trig_timeout(time:float=0) -> bool:
	trigger_time += _delta
	if trigger_time >= time:
		trigger_timeout = true
		trigger_time = 0
		return true
	return false
#	checkTrigger()


func check_trigger() -> bool:
	if !(active && !auto_pattern_id.is_empty() && trigger_container): 
		return false
	return trigger_container.check_trigger(self, self)



func call_action() -> void:
	Spawning.spawn(self, auto_pattern_id, shared_area_name)




