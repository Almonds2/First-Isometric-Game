extends Camera2D

func _process(_delta: float) -> void:
	
	var zoom_speed_VAR = Vector2(0.2,0.2)
	var max_zoom_VAR = Vector2(2.5,2.5)
	var min_zoom_VAR = Vector2(11.0,11.0)
	
	if Input.is_action_just_released("MOUSE_BUTTON_WHEEL_UP") and zoom <= min_zoom_VAR:
		zoom += zoom_speed_VAR
	
	if Input.is_action_just_released("MOUSE_BUTTON_WHEEL_DOWN") and zoom >= max_zoom_VAR:
		zoom -= zoom_speed_VAR
	
		
