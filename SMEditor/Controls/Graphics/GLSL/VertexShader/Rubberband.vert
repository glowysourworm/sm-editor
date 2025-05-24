#version 330 core

// The layout keyword shows where - in terms of array "stride index" - the
// attribute is positioned.
//
layout (location = 0) in vec2 vertex;

// Define a data type to be output by the shader to the next stages
//
out vec2 currentVertex;

void main()
{
    // NOTE:  This coordinate transfer is set up with just basic 2D normalized coordinates. The
    //        texture 2D coordinates are neglected because they can be easily calculated in the 
    //        fragment shader
    //

    // Pretty sure the point of this is to set gl_Position; and to provide output data to the
    // next pipeline stages.
    //

    gl_Position = vec4(vertex.x, vertex.y, 0, 1.0);

    // Struct data should be copied over for use by the fragment shader
    //
    currentVertex = vertex;
}