extends Area2D

@export var speed: int
var direction: Vector2

func _process(delta):
	position += direction * speed * delta

func emit_particles_and_light():
	$LaserParticles/LaserParticles.emitting = true
	$LaserParticles/LaserLight.emit_light()
	$LaserParticles/LaserLightTimeOut.start()
