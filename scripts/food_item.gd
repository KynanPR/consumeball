class_name Food_Item extends RigidBody2D

enum Food_Type {
	apple,
	pizza
}

@onready var m_sprite: Sprite2D = $sprite

var m_foodType: Food_Type
var m_isActive: bool
var m_spawn_location: Vector2 = Vector2(0,0)
var m_needs_spawning: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomise_food_type()

func spawn(spawn_location: Vector2) -> void:
	randomise_food_type()
	set_spawn_location(spawn_location)
	m_needs_spawning = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _integrate_forces(state):
	if m_needs_spawning:
		state.transform = Transform2D(0.0, m_spawn_location)
		m_needs_spawning = false

func get_food_type() -> Food_Type:
	return m_foodType

func set_food_type(new_food_type: Food_Type) -> Food_Type:
	m_foodType = new_food_type
	_update_text_region()
	print(Food_Type.find_key(m_foodType))
	return m_foodType

func randomise_food_type() -> Food_Type:
	var possible_types = Food_Type.values()
	var new_type: Food_Type = possible_types[randi_range(0, possible_types.size() - 1)]
	return set_food_type(new_type)

func set_spawn_location(new_loctaion: Vector2) -> Vector2:
	m_spawn_location = new_loctaion
	return m_spawn_location


func _update_text_region() -> void:
	var tex_atlas_region: Rect2 = m_sprite.region_rect
	# Bump the region over by the width of the sprites on the atlas
	tex_atlas_region.position.x = m_foodType * 16 # Hardcoded sprite size
	m_sprite.region_rect = tex_atlas_region
