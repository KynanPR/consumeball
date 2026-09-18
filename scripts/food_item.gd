class_name Food_Item extends RigidBody2D

enum Food_Type {
	apple,
	pizza
}

@onready var m_sprite: Sprite2D = $sprite

var m_foodType: Food_Type

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomise_food_type()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:


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


func _update_text_region() -> void:
	var tex_atlas_region: Rect2 = m_sprite.region_rect
	# Bump the region over by the width of the sprites on the atlas
	tex_atlas_region.position.x = (m_foodType + 1) * 16 # Hardcoded sprite size
	m_sprite.region_rect = tex_atlas_region
