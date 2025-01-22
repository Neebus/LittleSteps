extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	$AudioStreamPlayer2D.play()



func _on_audio_stream_player_2d_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/PlayerSelection.tscn")
