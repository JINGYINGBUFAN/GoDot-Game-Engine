extends RigidBody2D

var previous_speed = 0.0
var change_count = 0
var last_change_time = 0.0  # Tracks the last time the color was changed

func _process(delta):
	var current_speed = linear_velocity.length()

	if previous_speed > current_speed and linear_velocity.y < 0.1:
		var current_time = Time.get_ticks_msec() / 1000.0  # Get time in seconds

	previous_speed = current_speed
