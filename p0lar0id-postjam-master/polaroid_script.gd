extends KinematicBody2D

var velocity = Vector2(1, 0)
var speed = 1000
var polaroidPos
var item

onready var inventory = get_node("/root/Main/PlatformerController2D/inventory")
onready var Box = preload("res://PhysicsBox.tscn")
onready var Mirror = preload("res://mirror.tscn")

func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
	rotation_degrees += 30
	if collision_info != null: #or Input.is_action_just_pressed("shoot") and player.double_click == true:
		polaroidPos = position
		print(polaroidPos)
		spawn()
		queue_free()
		
func spawn():
	print(get_tree())
	if (item == 1):
		var box = Box.instance()
		get_node("/root/Main/Objects").add_child(box)
		box.position = polaroidPos
	
	if (item == 2):
		var mirror = Mirror.instance()
		get_node("/root/Main/Objects").add_child(mirror)
		mirror.position = polaroidPos
		
	
	

