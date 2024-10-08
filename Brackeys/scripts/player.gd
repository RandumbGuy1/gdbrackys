extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const DASH_VELOCITY = 300.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
		
	if not is_on_floor():
		velocity.y += gravity * delta
		

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("left", "right")
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x > 0 and is_on_floor():
		sprite.animation = "run"
	elif velocity.x < 0 and is_on_floor():
		sprite.animation = "run"
	elif velocity.x == 0 and is_on_floor():
		sprite.animation = "idle"
	else:
		sprite.animation = "jump"
	
		
	move_and_slide()


