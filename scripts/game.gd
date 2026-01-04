extends Node2D

class_name Game

@onready var tilemap_VAR = $TileMapLayer
@onready var ghost_block_VAR = $ghost_block

var is_placement_mode: bool
var is_inventory_mode: bool

var convenyor_tileset_VAR := 1
var convenyor_tileloc_VAR := Vector2i(0, 0)

func _ready() -> void:
	add_to_group("game")
	is_placement_mode = false
	is_inventory_mode = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("inventory") and is_inventory_mode == false:
		is_inventory_mode = true
		is_placement_mode = false
	elif Input.is_action_just_pressed("inventory") and is_inventory_mode == true:
		is_inventory_mode = false
	
	var mouse_pos_VAR = get_global_mouse_position()
	var local = tilemap_VAR.to_local(mouse_pos_VAR)
	var cell = tilemap_VAR.local_to_map(local)
	var snap_local = tilemap_VAR.map_to_local(cell)
	
	if Input.is_action_pressed("MOUSE_LEFT_CLICK") and is_placement_mode == true:
		var local_pos = tilemap_VAR.to_local(ghost_block_VAR.global_position)
		var cell_tilemap = tilemap_VAR.local_to_map(local_pos)
				
		tilemap_VAR.set_cell(cell_tilemap, 1, Vector2i(0, 0), TileSetAtlasSource.TRANSFORM_FLIP_H)
	
func is_place_func(bool_VAR: bool):
	is_placement_mode = bool_VAR

func is_inv_func(bool_VAR: bool):
	is_inventory_mode = bool_VAR
	
	
	
