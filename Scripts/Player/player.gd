class_name Player extends CharacterBody2D

#region Componentes do Player
@export var move_component : MoveComponent;
@export var input_component : InputComponent;

func _physics_process(delta: float) -> void:
	_movement_handler(delta);
	move_and_slide();

func _movement_handler(delta : float) -> void:
	# Dando conta do Movimento
	var direction : Vector2 = input_component.get_input_direction();
	if direction == Vector2.ZERO: # Caso as teclas não estejam sendo pressionadas
		move_component.apply_friccion(delta);
		return
	move_component.apply_acceleration(delta, direction);
