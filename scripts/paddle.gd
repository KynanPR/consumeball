extends Node2D

@export_category("Flipper Physics")

@export var is_left_flipper: bool = true
@export var stroke_angle_deg: float = 45.0
@export var up_speed: float = 40.0
@export var down_speed: float = 25.0

@onready var flipper: RigidBody2D = $FlipperBody
@onready var pivot: Marker2D = $Marker2D

var restAngle: float
var targetAngle: float
var input_action: String

func _ready() -> void:
	#Store Starting Angle
	restAngle = flipper.rotation
	
	#Determine Direction
	var max_offset = deg_to_rad(stroke_angle_deg)
	if is_left_flipper:
		targetAngle = restAngle - max_offset
		input_action = "flipper_left"
	else:
		targetAngle = restAngle + max_offset
		input_action = "flipper_right"
		
func _physics_process(delta: float) -> void:
	var is_pressed = Input.is_action_pressed(input_action)
	var current_angle = flipper.rotation
	
	if is_pressed:
		if (is_left_flipper and current_angle > targetAngle) or (not is_left_flipper and current_angle < targetAngle):
			flipper.angular_velocity = -up_speed if is_left_flipper else up_speed
		else:
			flipper.rotation = targetAngle
			flipper.angular_velocity = 0.0
	else:
		flipper.rotation = restAngle
		flipper.angular_velocity = 0.0
	
	
