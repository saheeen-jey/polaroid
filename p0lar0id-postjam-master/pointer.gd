extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var is_mouse_in_view = false
onready var inventory = get_node("/root/Main/PlatformerController2D/inventory")
onready var objects = get_node("/root/Main/Objects")
const Mirror = preload("res://mirror.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	set_global_position(get_global_mouse_position())
	$MousePlayerRay.set_cast_to(
		get_node("/root/Main/PlatformerController2D/icon").get_global_position()-global_position
	)
	
	var mirror = null
	for child in objects.get_children():
		if child is Mirror:
			$MouseMirrorRay.set_cast_to(
				child.get_node("Center/PlayerRayCast").get_global_position()-global_position
			)
			mirror = child
			break
	
	is_mouse_in_view = false
	if !$MousePlayerRay.is_colliding():
		is_mouse_in_view = true
	elif (mirror && !mirror.get_node("Center/PlayerRayCast").is_colliding() &&
			!$MouseMirrorRay.is_colliding()):
		if (($LeftRay.is_colliding() && $RightRay.is_colliding()) ||
			($UpRay.is_colliding() && $DownRay.is_colliding())):
			is_mouse_in_view = true
		
	if is_mouse_in_view:
		$GoodSprite.visible = true
		$BadSprite.visible = false
	else:
		$GoodSprite.visible = false
		$BadSprite.visible = true
