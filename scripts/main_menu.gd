extends Control

@onready var Grim: Control = $".."

func _on_open_file_button_pressed() -> void:
	$OpenFileDialog.popup()
	
func _on_open_file_dialog_file_selected(path: String) -> void:
	print("File selected: %s" % path)
	Grim.change_to_editor(path, true)

func _on_open_file_dialog_dir_selected(dir: String) -> void:
	print("Dir selected: %s" % dir)
	Grim.change_to_editor(dir, false)
