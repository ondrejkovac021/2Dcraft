extends TileMap

export var max_x = 256
export var max_y = 128
var mouse_pos : Vector2 = Vector2.ZERO
var noise : OpenSimplexNoise = OpenSimplexNoise.new()
var block_selected = 15

var snap_size_x  = 64
var snap_size_y = 64

func _ready() -> void:

	randomize()
	
	noise.seed = randi()
	noise.octaves = 0
	noise.period = 5
	noise.persistence = 0.588
	noise.lacunarity = 2.43
	
	generate_level()
	
	
func generate_level():
	for x in max_x:
		for y in max_y:
			var tile_id = generate_id(noise.get_noise_2d(x,y))
			if(tile_id != -1):
				set_cell(x,y,tile_id)

func generate_id(noise_level : float):
	if(noise_level <= 0):
		return -1
	elif(noise_level >= 0.11 and noise_level <= 0.112):
		return 11
	elif(noise_level < 0.2):
		return 3
	elif(noise_level >= 0.37 and noise_level <= 0.39):
		return 9
	elif(noise_level >= 0.48 and noise_level <= 0.49):
		return 8
	else:
		return 2

func _physics_process(_delta: float) -> void:
	update_position_snapped()
	
func update_position_snapped():
	mouse_pos =  Vector2(int(get_global_mouse_position().x / snap_size_x),
						 int((get_global_mouse_position().y - 32) / snap_size_y))
						
	$Cursor.global_position = mouse_pos * snap_size_x
	
	if Input.is_action_pressed("mouse_left"):
			set_cell(mouse_pos.x,mouse_pos.y,-1)
	if Input.is_action_pressed("mouse_right"):
			set_cell(mouse_pos.x,mouse_pos.y,block_selected)
	if Input.is_action_pressed("btn_1"):
		block_selected = 15
	if Input.is_action_pressed("btn_2"):
		block_selected = 3
	if Input.is_action_pressed("btn_3"):
		block_selected = 17
