extends RigidBody2D

const speed = 750

func explode():
	$Explosion/GrenadeExplosionAnimation.play("explosion_animation")


func _on_effective_blast_radius_body_entered(body):
	if (body != $"."):
		print('grenade hit')
