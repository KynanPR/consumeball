class_name Food_Controller extends Node2D

@onready var food_tempate: PackedScene = preload("res://scenes/food_item.tscn")

const m_max_food_items: int = 5
var m_active_food_items: Array[Food_Item]
@onready var m_spawn_timer: Timer = $Timer
var m_spawn_interval: float = 1.0
@export var m_spawn_location: Vector2 = Vector2(500, 250)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# for i in range(m_max_food_items):
	# 	spawn_food()
	_reset_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# try and spawn a food item
	spawn_food()

func spawn_food():
	# Check we are able to spawn a new food item
	if (
		m_active_food_items.size() >= m_max_food_items
	):
		return false
	if (m_spawn_timer.time_left != 0): return false
	
	var new_food_item: Food_Item = food_tempate.instantiate()
	m_active_food_items.push_back(new_food_item)
	self.add_child(m_active_food_items[-1])
	m_active_food_items[-1].spawn(m_spawn_location)
	_reset_timer()

	


func _on_despawn_area_body_entered(body: Node2D) -> void:
	# ignore if not food item
	if body is not Food_Item: return

	print("Destryoing food item")
	m_active_food_items.remove_at(m_active_food_items.find(body))
	body.queue_free()

func _reset_timer() -> void:
	print("resetting timer")
	m_spawn_timer.one_shot = true
	#m_spawn_timer.wait_time = m_spawn_interval

	m_spawn_timer.start()
