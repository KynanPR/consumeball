class_name Food_Item extends RigidBody2D

enum Food_Type {
	apple,
	pizza
}

var m_foodType: Food_Type

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	m_foodType = Food_Type.apple
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_food_type() -> Food_Type:
	return m_foodType
