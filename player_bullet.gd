extends RigidBody3D  # or Area3D

var speed = 100  # Adjust the speed as needed

func _ready():
	pass  # Add any initialization code here

func _process(delta):
	pass  # Add any per-frame processing code here

func shoot(direction):
	linear_velocity = direction * speed  # Apply the desired velocity to the projectile



func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	body.queue_free()
	queue_free()
	pass # Replace with function body.
