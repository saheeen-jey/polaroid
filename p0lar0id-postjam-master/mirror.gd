extends Node2D

onready var inventory = get_node("/root/Main/PlatformerController2D/inventory")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	set_rotation(get_rotation()+0.01)
	var raycast = $Center/PlayerRayCast
	var light = $Center/Light2D
	var normal = $Center/Normal.get_cast_to()
	raycast.set_cast_to(to_local(get_node("/root/Main/PlatformerController2D/icon").get_global_position())-raycast.position)
	if !raycast.is_colliding():
		light.enabled = true
		var upperray = $UpperEdge/RayCast2D
		upperray.set_cast_to(to_local(get_node("/root/Main/PlatformerController2D/icon").get_global_position())-upperray.position)
		$UpperEdge/LightOccluder2D.set_rotation(upperray.cast_to.bounce(normal.normalized()).angle()+3*PI/2)
		
		var lowerray = $LowerEdge/RayCast2D
		lowerray.set_cast_to(to_local(get_node("/root/Main/PlatformerController2D/icon").get_global_position())-lowerray.position)
		$LowerEdge/LightOccluder2D.set_rotation(lowerray.cast_to.bounce(normal.normalized()).angle()+3*PI/2)
	else:
		light.enabled = false
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT and event.pressed:
		if(get_node("/root/Main/pointer").is_mouse_in_view):
			inventory.item_in_inv = 2
			inventory.visible = true
			inventory.can_shoot = true
			queue_free()
