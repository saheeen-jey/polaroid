extends Box
class_name PhysicsBox

onready var inventory = get_node("/root/Main/PlatformerController2D/inventory")

var gravity = 512
var velocity_of_cube = Vector2.ZERO
var MAX_FALL_SPEED = 1024
func _ready():
	print(position)
func _physics_process(delta):
	velocity_of_cube.y += gravity * delta
	velocity_of_cube.y = min(velocity_of_cube.y, MAX_FALL_SPEED)
	move_and_slide(velocity_of_cube)
		
func push(velocity: Vector2) -> void:
	move_and_slide(velocity)
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT and event.pressed:
		if(get_node("/root/Main/pointer").is_mouse_in_view):
			inventory.item_in_inv = 1
			inventory.visible = true
			inventory.can_shoot = true
			queue_free()
