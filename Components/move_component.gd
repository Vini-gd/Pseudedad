class_name MoveComponent extends Node
# Componente de movimento que será utilizado no player e nos inimigos

#region Variáveis de Exportação
@export_category("Component Specs")
@export var actor : CharacterBody2D; # É preciso especificar o character
@export var speed : float = 100.0; # Velocidade máxima do Character
@export var acceleration : float = 700.0; # Aceleração do Character
@export var friccion : float = 1000.0; # Fricção/Desaceleração
@export var velocity : Vector2 = Vector2.ZERO; # Velocidade do componente
#endregion

# Variáveis do Componente

#region Funções específicas do Componente
func apply_acceleration(delta : float, direction : Vector2, accel : float = acceleration, sp : float = speed):
	# Essa função aplicará uma aceleração ao personagem. 
	# A aceleração padrão é a especificada na variável de exportação, mas pode ser customizada, tal qual a 
	# Velocidade.
	velocity = velocity.move_toward(direction * sp, delta * accel);

func apply_friccion(delta : float, fric : float = friccion) -> void:
	# Semelhante ao apply acceleration, mas iremos reduzir a velocidade a 0
	velocity = velocity.move_toward(Vector2.ZERO, delta * fric);

func set_velocity() -> void:
	actor.velocity = velocity;

#endregion
