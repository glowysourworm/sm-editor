#version 330 core

// Output of the shader is the RBGA formatted color for the fragment (pixel.. or rasterized unit fragment)
//
out vec4 outputColor;

in vec2 currentVertex;
in vec2 currentTex;

// Try and use a 2D sampler to work with the texture. The active texture should be the 0th texture.
uniform sampler2D frameTexture;
uniform sampler2D sceneTexture;
uniform sampler2D componentTexture;

void main()
{
    // NOTE:  This coordinate transfer is set up with just basic 2D normalized coordinates. The
    //        texture 2D coordinates are neglected because they can be easily calculated
    //

    vec4 componentOutput = texture(componentTexture, currentTex);
    vec4 sceneOutput = texture(sceneTexture, currentTex);
    vec4 frameOutput = texture(frameTexture, currentTex);

    // Alpha Blend the two outputs (scene should be the "component" texture)
    //outputColor = mix(frameOutput, sceneOutput, 1 - frameOutput.w);

    outputColor = vec4(0,0,0,0);

    if (sceneOutput.w > 0)
        outputColor = sceneOutput;

    if (componentOutput.w > 0)
        outputColor = mix(outputColor, componentOutput, componentOutput.w);

    //outputColor = componentOutput;
}