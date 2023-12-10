extends RigidBody3D  # or Area3D

var speed = 100  # Adjust the speed as needed

func _ready():
	pass  # Add any initialization code here

func _process(delta):
	pass  # Add any per-frame processing code here

func shoot(direction):
	linear_velocity = direction * speed  # Apply the desired velocity to the projectile

