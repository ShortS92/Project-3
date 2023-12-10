extends CharacterBody3D

@export var ERCannon: Node3D
@export var ELCannon: Node3D
const speed = 15.0
var bulletScene = preload("res://enemy_bullet.tscn")
var canShootFromFirstCannon = true
var player = null

func _process(delta):
	if player != null:
		var direction = (player.global_transform.origin - global_transform.origin).normalized()
		shoot().shootAt(direction)
		move_and_slide()

func shoot():
	if canShootFromFirstCannon:
			var kapow = bulletScene.instantiate()
			kapow.position = ERCannon.global_position
			var direction = -self.global_transform.basis.z
			kapow.shoot(direction)
			get_tree().root.add_child(kapow)
	else:
		var kapow = bulletScene.instantiate()
		kapow.position = ELCannon.global_position
		var direction = -self.global_transform.basis.z
		kapow.shoot(direction)
		get_tree().root.add_child(kapow)
	canShootFromFirstCannon = !canShootFromFirstCannon


func _on_ray_cast_3d_child_entered_tree(node):
	if node.name == "Player":
		player = 1
		shoot()
	pass # Replace with function body.
