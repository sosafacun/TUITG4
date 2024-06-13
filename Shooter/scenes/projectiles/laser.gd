extends Area2D

@export var speed: int
var direction: Vector2

func _process(delta):
	pass
	position += direction * speed * delta
