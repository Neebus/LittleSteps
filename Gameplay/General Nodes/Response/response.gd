extends Area2D
class_name Response

@export var action_type: String = "sit"

func _ready(): 
	area_entered.connect( AreaEntered )
	
	
	
func AreaEntered( a : Area2D ) -> void:
	if a is Response: 
		a.Interaction()
	pass
