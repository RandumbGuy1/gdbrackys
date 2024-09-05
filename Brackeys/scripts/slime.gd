extends Node2D


const SPEED = 60
@onready var rayR = $RayCastRight
@onready var rayL = $RayCastLeft
@onready var rayDR = $RayCastDownRight
@onready var rayDL = $RayCastDownLeft
@onready var sprite = $AnimatedSprite2D
var direction = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += direction * SPEED * delta
	
	if rayR.is_colliding():
		direction = -1
		sprite.flip_h = true
	elif rayL.is_colliding():
		direction = 1
		sprite.flip_h = false
		
	if !rayDR.is_colliding():
		direction = -1
		sprite.flip_h = true
	elif !rayDL.is_colliding():
		direction = 1
		sprite.flip_h = false

