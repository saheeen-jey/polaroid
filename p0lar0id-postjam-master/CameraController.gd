extends Camera2D
#https://www.youtube.com/watch?v=dFd9fINGJRo&ab_channel=LucyLavend
var zoom_min = Vector2(.2,.2)
var zoom_max = Vector2(4,4)
var zoom_speed = Vector2(.2,.2)
var des_zoom = zoom

func _process(delta):
	zoom = lerp(zoom,des_zoom,.2)


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				if des_zoom > zoom_min:
					des_zoom -= zoom_speed
			if event.button_index == BUTTON_WHEEL_DOWN:
				if des_zoom < zoom_max:
					des_zoom += zoom_speed
