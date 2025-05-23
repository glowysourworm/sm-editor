﻿
using System;
using System.Collections.Generic;

using OpenTK.Graphics.OpenGL4;
using OpenTK.Mathematics;

using SMEditor.Controls.Graphics.Primitive;

namespace SMEditor.Controls.Grpahics.Data
{
    public class ShaderData
    {
        public string Source { get; private set; }
        public ShaderType Type { get; private set; }
        public GLSLResource Resource { get; private set; }

        public IEnumerable<VertexAttributeData> VertexAttributes { get; private set; }
        public IEnumerable<UniformData<int>> Uniforms1i { get; private set; }
        public IEnumerable<UniformData<float>> Uniforms1 { get; private set; }
        public IEnumerable<UniformData<Vector2>> Uniforms2 { get; private set; }
        public IEnumerable<UniformData<Vector4>> Uniforms4 { get; private set; }

        public ShaderData(GLSLResource resource, ShaderType shaderType, string source)
        {
            this.Source = source;
            this.Type = shaderType;
            this.Resource = resource;

            this.Uniforms1i = Array.Empty<UniformData<int>>();
            this.Uniforms1 = Array.Empty<UniformData<float>>();
            this.Uniforms2 = Array.Empty<UniformData<Vector2>>();
            this.Uniforms4 = Array.Empty<UniformData<Vector4>>();
            this.VertexAttributes = Array.Empty<VertexAttributeData>();

            Initialize();
        }

        private void Initialize()
        {
            // Sets up vertex array attributes for this specific shader program
            //
            switch (this.Resource)
            {
                // FRAGMENT SHADERS
                case GLSLResource.FrameFragmentShader:
                    this.Uniforms1i = new UniformData<int>[] {
                        new UniformData<int>("frameTexture", ActiveUniformType.Sampler2D, 0),        // CONSTANTS!!! THESE MUST MATCH Texture Unit indices!!!
                        new UniformData<int>("sceneTexture", ActiveUniformType.Sampler2D, 1),        // CONSTANTS!!! THESE MUST MATCH Texture Unit indices!!!
                        new UniformData<int>("componentTexture", ActiveUniformType.Sampler2D, 2)     // CONSTANTS!!! THESE MUST MATCH Texture Unit indices!!!
                    };
                    break;
                case GLSLResource.SceneFragmentShader:
                    this.Uniforms1i = new UniformData<int>[] {
                        new UniformData<int>("sceneTexture", ActiveUniformType.Sampler2D, 1)        // CONSTANTS!!! THESE MUST MATCH Texture Unit indices!!!
                    };
                    break;
                case GLSLResource.RubberbandFragmentShader:
                    this.Uniforms4 = new UniformData<Vector4>[] {
                        new UniformData<Vector4>("rubberbandColor", ActiveUniformType.Sampler2D, new Vector4(1,1,1,1)) // Rubberband Color (white)
                    };
                    break;

                // VERTEX SHADERS
                case GLSLResource.FrameVertexShader:
                case GLSLResource.SceneVertexShader:
                    this.VertexAttributes = new VertexAttributeData[2] { new VertexAttributeData(0, "vertex", ActiveUniformType.FloatVec2),
                                                                         new VertexAttributeData(1, "texcoord", ActiveUniformType.FloatVec2)};
                    break;
                case GLSLResource.RubberbandVertexShader:
                    this.VertexAttributes = new VertexAttributeData[1] { new VertexAttributeData(0, "vertex", ActiveUniformType.FloatVec2) };
                    break;
                default:
                    throw new System.Exception("Unhandled GLSLResource type:  ShaderData.cs");
            }
        }
    }
}
