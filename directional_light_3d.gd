extends DirectionalLight3D

var reflection_probe_is_on:bool = false;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees.x += 1 * int($"../Control/LineEdit".text) * delta;
	


func _on_low_button_down() -> void:
	$"../WorldEnvironment".environment = load("res://graphics/low/environment.tres");


func _on_mid_button_down() -> void:
	$"../WorldEnvironment".environment = load("res://graphics/mid/Environment.tres");


func _on_hight_button_down() -> void:
	$"../WorldEnvironment".environment = load("res://graphics/high/environment.tres");


func _on_ref_button_down() -> void:
	if (reflection_probe_is_on):
		$"../ReflectionProbe".hide();
		$"../ReflectionProbe".update_mode = ReflectionProbe.UPDATE_ONCE;
		reflection_probe_is_on = false;
		$"../Control/ref".text = "Reflection Probe: Off";
	else: 
		$"../ReflectionProbe".show();
		$"../ReflectionProbe".update_mode = ReflectionProbe.UPDATE_ALWAYS;
		reflection_probe_is_on = true;
		$"../Control/ref".text = "Reflection Probe: On";
