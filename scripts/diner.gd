extends Node2D
enum desired_food {apple, pizza}

var current_food = desired_food.apple

func change_current_food() -> void:
	if (current_food == desired_food.apple):
		current_food = desired_food.pizza
		pass
	else: if( current_food == desired_food.pizza):
		current_food = desired_food.apple
		pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_body_entered(body: Food_Item) -> bool:
	if (body.get_food_type() == current_food):
		return true
		pass
	else: if (body.get_food_type() != current_food):
		return false
		pass
	return false
