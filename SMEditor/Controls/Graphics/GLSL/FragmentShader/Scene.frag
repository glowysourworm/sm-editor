#version 330 core

// Output of the shader is the RBGA formatted color for the fragment (pixel.. or rasterized unit fragment)
//
out vec4 outputColor;

in vec2 currentVertex;
in vec2 currentTex;

// Try and use a 2D sampler to work with the texture. The active texture should be the 0th texture.
uniform sampler2D sceneTexture;

void main()
{
    // NOTE:  This coordinate transfer is set up with just basic 2D normalized coordinates. The
    //        texture 2D coordinates are neglected because they can be easily calculated
    //

    outputColor = texture(sceneTexture, currentTex);
}