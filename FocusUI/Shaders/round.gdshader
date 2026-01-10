shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.5;
uniform float inner_radius : hint_range(0.0, 1.0) = 0.35;
uniform float outer_radius : hint_range(0.0, 1.0) = 0.45;
uniform float edge_softness : hint_range(0.0, 0.1) = 0.005;

// keep these as plain vec4 uniforms (no : hint_color)
uniform vec4 color_fill = vec4(0.9, 0.5, 0.1, 1.0);
uniform vec4 color_bg   = vec4(0.2, 0.2, 0.2, 1.0);

// start angle in turns (0.0..1.0), 0 = -PI (left) due to atan mapping below
uniform float start_angle : hint_range(0.0, 1.0) = 0.0;

// small softness for the radial progress edge
uniform float progress_softness : hint_range(0.0, 0.05) = 0.0;

void fragment() {
    // map UV from 0..1 to -1..1 (centered)
    vec2 uv = UV * 2.0 - 1.0;
    float dist = length(uv);

    // angle normalized to 0..1
    float angle = (atan(uv.y, uv.x) + PI) / (2.0 * PI);

    // rotate start angle and wrap
    angle = fract(angle - start_angle);

    // soft ring mask (1 inside ring, 0 outside)
    float inner_mask = smoothstep(inner_radius - edge_softness, inner_radius + edge_softness, dist);
    float outer_mask = 1.0 - smoothstep(outer_radius - edge_softness, outer_radius + edge_softness, dist);
    float ring_mask = inner_mask * outer_mask; // ~1 inside, ~0 outside

    // If outside the ring make fully transparent
    if (ring_mask < 0.001) {
        COLOR = vec4(0.0);
    } else {
        // filled fraction using optional softness on the sweep edge
        float filled;
        if (progress_softness > 0.0) {
            // soft edge around the progress boundary
            float low = max(0.0, progress - progress_softness);
            float high = min(1.0, progress + progress_softness);
            filled = 1.0 - smoothstep(low, high, angle);
        } else {
            filled = step(angle, progress);
        }

        // mix fill/bg color and apply ring mask as alpha
        vec4 out_col = mix(color_bg, color_fill, filled);
        out_col.a *= ring_mask;

        COLOR = out_col;
    }
}
