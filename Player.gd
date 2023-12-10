extends CharacterBody3D

@export var RCannon: Node3D
@export var LCannon: Node3D
const SPEED = 15.0
var bulletScene = preload("res://player_bullet.tscn")
var canShootFromFirstCannon = true

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		var sensitivity = 0.01
		rotate_y(-event.relative.x * sensitivity)

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if canShootFromFirstCannon:
			var kapow = bulletScene.instantiate()
			kapow.position = RCannon.global_position
			var direction = -self.global_transform.basis.z
			kapow.shoot(direction)
			get_tree().root.add_child(kapow)
		else:
			var kapow = bulletScene.instantiate()
			kapow.position = LCannon.global_position
			var direction = -self.global_transform.basis.z
			kapow.shoot(direction)
			get_tree().root.add_child(kapow)
		canShootFromFirstCannon = !canShootFromFirstCannon
		
	if Input.is_action_just_pressed("Pause"):
		get_tree().change_scene_to_file("res://PauseMenu.tscn")
