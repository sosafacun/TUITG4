extends RigidBody2D

const speed = 750

func explode():
	$Explosion/GrenadeExplosionAnimation.play("explosion_animation")
