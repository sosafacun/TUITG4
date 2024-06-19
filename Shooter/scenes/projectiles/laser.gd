extends Area2D

@export var speed: int
var direction: Vector2

func _ready():
	$LaserTimeout.start()

func _process(delta):
	position += direction * speed * delta
	emit_particles_and_light()

func emit_particles_and_light():
	$LaserParticles/LaserParticles.emitting = true
	$LaserParticles/LaserLight.emit_light()
	$LaserParticles/LaserLightTimeOut.start()

func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free()

func _on_timer_timeout():
	queue_free()
