extends Node2D

@onready var tilemap_VAR = $TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mouse_world = get_global_mouse_position()
	var local = tilemap_VAR.to_local(mouse_world)
	var cell = tilemap_VAR.local_to_map(local)
	var snap_local = tilemap_VAR.map_to_local(cell)

	global_position = tilemap_VAR.to_global(snap_local)
