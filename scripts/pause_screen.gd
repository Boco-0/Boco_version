extends Control

@export var stream: AudioStream

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play("RESET")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	

func Esc():
	if Input.is_action_just_pressed("pause") and !get_tree().paused and get_tree().current_scene.name == "World": 
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused and get_tree().current_scene.name == "World":
		resume()

func _on_resume_pressed() -> void:
	AudioManager.play_sound(stream)
	resume()


func _on_exit_pressed() -> void:
	AudioManager.play_sound(stream)
	resume()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	
	

func _process(_delta):
	Esc()
	


	


func _on_slide_timer_timeout() -> void:
	pass # Replace with function body.
