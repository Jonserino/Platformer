extends KinematicBody2D

var direction = Vector2.RIGHT # (1, 0) *- 1 = (-1, 0)
var velocity = Vector2.ZERO

onready var ledgeCheckRight = $LedgeCheckRight
onready var ledgeCheckLeft = $LedgeCheckLeft
onready var sprite = $AnimatedSprite

func _physics_process(delta):
	var found_wall = is_on_wall()
	var found_ledge = not ledgeCheckRight.is_colliding() or not ledgeCheckLeft.is_colliding()
	
	if found_wall or found_ledge:
		direction *= -1
	
	sprite.flip_h = direction.x > 0
	if not sprite.flip_h:
		sprite.offset.x = 1
	else:
		sprite.offset.x = 0
	
	velocity = direction * 25
	move_and_slide(velocity, Vector2.UP)
