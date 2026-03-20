@tool
extends EditorPlugin


const PLUGIN_NAME := "Plugin Helper"
var button

func _enter_tree() -> void:
	#var editor_filesystem = EditorInterface.get_resource_filesystem()
	#if editor_filesystem:
		#editor_filesystem.filesystem_changed.connect(Callable(self, "_on_reload_plugins_pressed"))
	
	button = Button.new()
	button.text = "Reload Plugins"
	button.pressed.connect(Callable(self, "_on_reload_plugins_pressed"))
	add_control_to_container(CONTAINER_TOOLBAR, button)


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	button.pressed.disconnect(Callable(self, "_on_reload_plugins_pressed"))
	remove_control_from_container(CONTAINER_TOOLBAR, button)
	if button:
		button.queue_free()
	
	#var editor_filesystem = EditorInterface.get_resource_filesystem()
	#if editor_filesystem:
		#editor_filesystem.filesystem_changed.disconnect(Callable(self, "_on_reload_plugins_pressed"))

func _on_reload_plugins_pressed():
	var plugin_list  = ProjectSettings.get_setting("editor_plugins/enabled")
	if not plugin_list:
		print("no active plugins")
		return
	print("Reloading Plugins...")
	for plugin in plugin_list:
		var config = ConfigFile.new()
		var err = config.load(plugin)
		if err != OK:
			return
		
		var name = config.get_value("plugin", "name")
		if name == "Plugin Reloader":
			continue
		
		_reload_plugin(name, plugin)

func _reload_plugin(name, plugin):
	#print("Reloading Plugin: ", name)
	EditorInterface.set_plugin_enabled(plugin, false) #unload plugin
	EditorInterface.set_plugin_enabled(plugin, true) #reload it
