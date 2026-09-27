#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec2 texsize = vec2(textureSize(tex, 0));
    vec2 uv = texcoord / texsize;
    
    vec4 color = texture(tex, uv);
    
    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    
    gray = 1.0 - gray;
    
    vec3 paper = vec3(1.0, 0.97, 0.90);
    
    vec4 final_color = vec4(vec3(gray) * paper, color.a);
    
    return default_post_processing(final_color * opacity);
}
