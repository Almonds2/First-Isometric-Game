extends Node2D

@onready var tilemap_VAR = $TileMapLayer
@onready var ghost_block_VAR = $ghost_block
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_pos_VAR = get_global_mouse_position()
	var local = tilemap_VAR.to_local(mouse_pos_VAR)
	var cell = tilemap_VAR.local_to_map(local)
	var snap_local = tilemap_VAR.map_to_local(cell)
	
	if Input.is_action_pressed("MOUSE_LEFT_CLICK"):
		var local_pos = tilemap_VAR.to_local(ghost_block_VAR.global_position)
		var cell_tilemap = tilemap_VAR.local_to_map(local_pos)

		tilemap_VAR.set_cell(cell_tilemap, 1, Vector2i(0, 0))
		print("left")
	
	
	
