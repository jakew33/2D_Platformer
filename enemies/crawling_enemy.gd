extends Node2D

enum DIRECTION {LEFT = -1, RIGHT = 1}


@export var crawling_direction = DIRECTION.RIGHT

var max_speed = 150

@onready var floor_cast = $FloorCast
@onready var wall_cast = $WallCast

func _physics_process(delta):
	if wall_cast.is_colliding():
		global_position = wall_cast.get_collision_point()
		var wall_normal = wall_cast.get_collison_normal()
		rotation = wall_normal.rotated(deg_to_rad(90)).angle()
	else:
		floor_cast.rotation_degrees = -max_speed * crawling_direction * delta
		if floor_cast.is_colliding():
			global_position = floor_cast.get_collision_point()
			var floor_normal = floor_cast.get_collision_normal()
			rotation = floor_normal.rotated(deg_to_rad(90)).angle()
		else:
			rotation_degrees += crawling_direction * 2
