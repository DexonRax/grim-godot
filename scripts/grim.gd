extends Control

@onready var main_menu: Control = $MainMenu
@onready var editor_space: Control = $EditorSpace

func _ready() -> void:
	change_to_menu()

func change_to_menu():
	editor_space.hide()
	main_menu.show()
	
func change_to_editor(path: String, single_file: bool):
	editor_space.show()
	main_menu.hide()
	if single_file:
		load_file(path)
	else:
		load_tree(path)
	
func load_file(path: String) -> void:
	var f = FileAccess.open(path, FileAccess.READ)
	editor_space.code_edit.text = f.get_as_text()
	f.close()

func load_tree(dir: String):
	editor_space.file_tree.clear()
	var files = DirAccess.open(dir).get_files()
	var root = editor_space.file_tree.create_item()
	root.set_text(0, dir)
	for file in files:
		var child = editor_space.file_tree.create_item(root)
		child.set_text(0, file)
