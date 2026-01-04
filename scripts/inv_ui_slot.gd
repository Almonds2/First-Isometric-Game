extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var button = $Button
var item_name_VAR: String

@onready var Game_script: Game = get_tree().current_scene

var is_placement_mode: bool

func _ready() -> void:
	pass

func update(item: InvItem):	
	if !item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = item.texture
		item_name_VAR = item.name
	
func _process(_delta: float) -> void:
	is_placement_mode = Game_script.is_placement_mode
	
	print(is_placement_mode)
	
	if button.button_pressed and Input.is_action_just_pressed("MOUSE_LEFT_CLICK"):
		if is_placement_mode:
			Game_script.is_place_func(false)
		elif is_placement_mode == false:
			Game_script.is_place_func(true)
			if item_name_VAR == "convenyor":
				print("convenyor")
	
			

		
		
