extends Sprite

func _ready():
	texture = load("res://2Dcraft/Stone brick.png")

func _physics_process(_delta):
	if Input.is_action_pressed("btn_1"):
		texture = load("res://2Dcraft/Stone brick.png")
	if Input.is_action_pressed("btn_2"):
		texture = load("res://2Dcraft/2Dcraft - Zem/Dirt.png")
	if Input.is_action_pressed("btn_3"):
		texture = load("res://2Dcraft/Woodplank.png")
