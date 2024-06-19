shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;
uniform vec4 silhouette_color: source_color = vec4(0.0, 0.0, 0.0, 0.5);

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	vec4 input_color = texture(TEXTURE, UV);
	if (all(lessThan(abs(input_color - screen_color), vec4(0.01)))) {
		COLOR = input_color;
	} else {
		COLOR = vec4(silhouette_color.rgb, silhouette_color.a * input_color.a);
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
