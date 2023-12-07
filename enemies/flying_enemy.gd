extends CharacterBody2D


@export var acceleration = 100
@export var max_speed = 40

func _physics_process(delta):

	move_and_slide()
