//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float highlight;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = vec4(gl_FragColor.r + highlight, gl_FragColor.g + highlight, gl_FragColor.b + highlight, gl_FragColor.a);
}
