# Godot Plugin Reloader
A plugin for the Godot Game Engine that allows reloading of all plugins without reloading the entire godot project.
## Reload Plugins Manually
The "Reload Plugins" button in the top right of the editor will reload all plugins except itself
<img width="1854" height="128" alt="Screenshot from 2026-03-19 23-16-05" src="https://github.com/user-attachments/assets/69806b3d-4c1a-4fcd-a467-76d85a370322" />
## Enabling Automatic Plugin Reloading on Save/File changes
Edit the plugin_reloader.gd file within the addon/plugin_reloader/ directory<br/><br/>
<img width="242" height="241" alt="Screenshot from 2026-03-19 23-21-15" src="https://github.com/user-attachments/assets/f6c6f818-5b2b-4e16-ad05-753d098cf0e5" /><br/><br/><br/>
Uncomment the two code blocks within the commented lines<br/><br/>
<img width="844" height="190" alt="Screenshot from 2026-03-19 23-23-49" src="https://github.com/user-attachments/assets/d69563af-2971-4e9c-a2e8-84ea3502aeac" />
<img width="844" height="303" alt="Screenshot from 2026-03-19 23-34-45" src="https://github.com/user-attachments/assets/211669d2-5dc3-46ce-b5b8-1f2d889ae210" /><br/><br/>
Now everytime ctrl+s is used, all plugins are reloaded
