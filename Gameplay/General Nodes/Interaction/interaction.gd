extends Area2D
class_name Interaction

signal Interacted()





func Interact() -> void:
	print ("Interacted with item")
	Interacted.emit() 
