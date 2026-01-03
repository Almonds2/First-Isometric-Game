extends TileMapLayer


func _ready() -> void:
	#make the collosion automatic placed outside the used cells
	var filled_tiles_VAR := get_used_cells() 
	
	for filled_tile_TEMP : Vector2i in filled_tiles_VAR: #loop for every used cells 
		var surrounding_tiles_VAR := get_surrounding_cells(filled_tile_TEMP) 
		
		for neighbor_TEMP: Vector2i in surrounding_tiles_VAR: #loop for every neighbor used cells 
			if get_cell_source_id(neighbor_TEMP) == -1:
				set_cell(neighbor_TEMP, 0, Vector2.ZERO)
