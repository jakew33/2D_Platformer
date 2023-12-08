extends Node2D

var waypoints = []
var target: Node2D
var pathfinding_next_position: Vector2

@onready var ray_cast_2d = $RayCast2D

func _physics_process(delta):
	pass

func can_see_target(from):
	ray_cast_2d.global_position = from
	ray_cast_2d.target_position = target.global_position - from
	ray_cast_2d.force_raycast_update()
	return not ray_cast_2d.is_colliding()
