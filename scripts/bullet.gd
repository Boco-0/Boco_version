extends Node3D

const SPEED = 150

@onready var mesh = $MeshInstance3D
@onready var ray = $"Bullet Raycast"
@onready var hit_sound = $"Hit Sound"
# @onready var particles = $GPUParticles3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ray.enabled = true
	mesh.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.basis * Vector3(0, 0, -SPEED) * delta
	ray.force_raycast_update()
	if ray.is_colliding():
		if ray.get_collider().name == "secondplayer" or ray.get_collider().name == "firstplayer":
			hit_sound.play()
			ray.get_collider().hit(0.2)
		await get_tree().create_timer(1).timeout
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()
