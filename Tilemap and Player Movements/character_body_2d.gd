## Code to walk with animation including Horizontal flipping of animation.

extends CharacterBody2D

@export var speed = 200
@export var jump_speed = -200
@export var gravity = 300

func _physics_process(delta):
	# Add gravity every frame
	velocity.y += gravity * delta

	# Input affects x axis only
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	# Flip the sprite based on the horizontal direction
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction < 0:
		$AnimatedSprite2D.flip_h = true
   
	# Play the appropriate animation
	if direction != 0:
		$AnimatedSprite2D.play("default") # Assuming you have a "run" animation
	else:
		$AnimatedSprite2D.play("idle") # Assuming you have an "idle" animation

	move_and_slide()

	# Only allow jumping when on the ground
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
