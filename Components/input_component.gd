class_name InputComponent extends Node

#region Variáveis Específicas do Componente
@export_category("Configurations")

# Variáveis normais
var input_direction : Vector2 = Vector2.ZERO;
#endregion

func _input(_event: InputEvent) -> void:
	# Iremos capturar o Vetor dos Inputs de movimento e colocá-lo na Variável Vetorial
	input_direction = sign(Input.get_vector("left", "right", "up", "down"));

#region Funções específicas do Componente
func get_input_direction() -> Vector2:
	return input_direction;

#endregion
