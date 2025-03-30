extends TileMap

export var max_x = 256
export var max_y = 128


var snap_size_x  = 64
var snap_size_y = 64

func _ready() -> void:
	generate_level()


func generate_level():
	for x in max_x:
		for y in max_y:
			set_cell(x,y,18)
