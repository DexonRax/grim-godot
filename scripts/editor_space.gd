extends Control

@onready var Grim: Control = $".."
@onready var code_edit: CodeEdit = $SplitContainer/SplitContainer/SplitContainer/CodeEdit
@onready var file_tree: Tree = $SplitContainer/SplitContainer/Panel/FileTree
@onready var files_tab: ItemList = $SplitContainer/SplitContainer/SplitContainer/FilesTab

func _on_file_tree_cell_selected() -> void:
	if file_tree.get_selected() != file_tree.get_root():
		var path = file_tree.get_root().get_text(0) + "/" + file_tree.get_selected().get_text(0)
		print(path)
		Grim.load_file(path)
		Grim.add_file_to_tab(path)

func _on_files_tab_item_clicked(index: int, _at_position: Vector2, _mouse_button_index: int) -> void:
	var path = file_tree.get_root().get_text(0) + "/" + files_tab.get_item_text(index)
	print(path)
	Grim.load_file(path)
