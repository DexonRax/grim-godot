extends Control

@onready var Grim: Control = $".."
@onready var code_edit: CodeEdit = $CodeEdit
@onready var file_tree: Tree = $Panel/FileTree

func _on_file_tree_cell_selected() -> void:
	var path = file_tree.get_root().get_text(0) + "/" + file_tree.get_selected().get_text(0)
	print(path)
	Grim.load_file(path)
