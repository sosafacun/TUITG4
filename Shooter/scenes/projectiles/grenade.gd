extends RigidBody2D

const speed = 750
@export var damage: float = 30

@onready var entities:
	get:
		for entity in get_tree().get_nodes_in_group('entity'):
			entity.connect("explode", _on_effective_blast_radius_body_entered)

@onready var containers:
	get:
		for container in get_tree().get_nodes_in_group('entity'):
			container.connect("explode", _on_effective_blast_radius_body_entered)

func explode():
	$Explosion/GrenadeExplosionAnimation.play("explosion_animation")

func _on_effective_blast_radius_body_entered(body):
	if 'hit' in body:
		body.hit(damage)
