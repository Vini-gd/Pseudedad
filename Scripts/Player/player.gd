class_name Player extends CharacterBody2D

# Componentes do player
@export_category("Components")
@export var move_component : MoveComponent;
@export var input_component : InputComponent;

# Objetos do Player
@export_category("Objetos")
@export var animation : AnimationPlayer;
@export var walk_timer : Timer;
@export var texture : Sprite2D;

# Variáveis normais
var direction : Vector2;

func _physics_process(delta: float) -> void:
	direction = input_component.get_input_direction();
	_movement_handler(delta);
	move_and_slide();

func _movement_handler(delta : float) -> void:
	# Dando conta do Movimento
	if direction == Vector2.ZERO: # Caso as teclas não estejam sendo pressionadas
		move_component.apply_friccion(delta);
		return
	
	if direction.x != 0.0:
		_handle_texture_flip();
	animation.play("Walk")
	animation.speed_scale = 0.0;
	if walk_timer.is_stopped():
		if animation.current_animation_position > 0:
			animation.seek(0);
		else:
			animation.seek(animation.current_animation_position + 0.1);
		walk_timer.start();
	
	move_component.apply_acceleration(delta, direction);

func _handle_texture_flip() -> void:
	# Fará o player dar Flip dependendo da direção
	texture.flip_h = direction.x < 0;
