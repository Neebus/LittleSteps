extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	$AudioStreamPlayer2D.play()



func _on_audio_stream_player_2d_finished() -> void:
	SceneTransition.change_scene("res://Menus/Main Menu/credits.tscn")
