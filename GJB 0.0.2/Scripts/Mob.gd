extends RigidBody2D


func _ready():
		var mob_types = 0

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
