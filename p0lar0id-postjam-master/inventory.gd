extends Sprite

var can_shoot = false
export var item_in_inv = 0

func _ready():
	visible = false

func _physics_process(delta):
	#if Input.is_action_just_pressed("click"):
	#	visible = true
	#	can_shoot = true
	if Input.is_action_just_pressed("shoot"):
		visible = false
		can_shoot = false
	
	

