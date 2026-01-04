extends Control

@onready var inv: Inv = preload("res://inventory/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func _ready() -> void:
	close_func()
	update_slot_func()
	
func update_slot_func(): 
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close_func()
		else:
			open_func()
		
	
func open_func():
	visible = true
	is_open = true	
	
func close_func():
	visible = false
	is_open = false	
