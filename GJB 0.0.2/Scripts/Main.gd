extends Node


func _ready():
	$SmileyFace.position.x = $StartPos.position.x
	$SmileyFace.position.y = $StartPos.position.y

func _process(_delta):
	$Inventory.position.x = $SmileyFace.position.x
	$Inventory.position.y = $SmileyFace.position.y
	
	$HUB.position.x = ($SmileyFace.position.x - 1100)
	$HUB.position.y = ($SmileyFace.position.y + 600)
