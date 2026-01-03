class_name SpawnComponent extends Node
# Componente utilizado para spawnar coisas no ambiente

@export_category("Configurations")
@export var instance : PackedScene; # Instância que será spawnada

func spawn(node_position : Vector2, node_parent : Node2D) -> Node2D: # Função que dará conta de spawnar o Node
	var new_node : Node2D = instance.instantiate();
	node_parent.add_child(new_node);
	new_node.global_position = node_position;
	return new_node
