using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

using OpenTK.Graphics.OpenGL4;

using SMEditor.Controls.Graphics.Interface;
using SMEditor.Controls.Graphics.Primitive;

using SMEditor.Controls.Grpahics.Data;

namespace SMEditor.Controls.Graphics
{
    public class GLSLCache : IGLSLCache
    {
        // GLSL Resource Names
        const string FRAME_FRAG = "Frame.frag";
        const string FRAME_VERT = "Frame.vert";
        const string SCENE_FRAG = "Scene.frag";
        const string SCENE_VERT = "Scene.vert";

        static Dictionary<GLSLResource, ShaderData> _cache;

        static GLSLCache()
        {
            _cache = new Dictionary<GLSLResource, ShaderData>();
        }

        public static void Load()
        {
            var assembly = typeof(GLSLCache).Assembly;

            // Get resources from the character folder -> Parse out category names
            _cache = assembly.GetManifestResourceNames()

                             // Need better way to filter out resources
                             .Where(resourcePath => resourcePath.Contains("GLSL"))
                             .Select(resourcePath =>
                             {
                                 var pieces = resourcePath.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);

                                 if (pieces.Length < 2)
                                     throw new Exception("Resource file-name format differs from expected GLSLCache.cs");

                                 var resourceName = pieces[pieces.Length - 2] + "." + pieces[pieces.Length - 1];
                                 var resourceData = "";

                                 // Load the data for the GLSL resource
                                 using (var stream = new StreamReader(assembly.GetManifestResourceStream(resourcePath)))
                                 {
                                     resourceData = stream.ReadToEnd();
                                 }

                                 // Separate the resource names for the cache
                                 switch (resourceName)
                                 {
                                     case FRAME_FRAG:
                                         return new ShaderData(GLSLResource.FrameFragmentShader, ShaderType.FragmentShader, resourceData);
                                     case FRAME_VERT:
                                         return new ShaderData(GLSLResource.FrameVertexShader, ShaderType.VertexShader, resourceData);
                                     case SCENE_FRAG:
                                         return new ShaderData(GLSLResource.SceneFragmentShader, ShaderType.FragmentShader, resourceData);
                                     case SCENE_VERT:
                                         return new ShaderData(GLSLResource.SceneVertexShader, ShaderType.VertexShader, resourceData);
                                     default:
                                         throw new Exception("Unhandled GLSL resource name GLSLCache.cs");
                                 }
                             })
                             .ToDictionary(pair => pair.Resource, pair => pair);
        }

        public ShaderData Get(GLSLResource glslKey)
        {
            return _cache[glslKey];
        }
    }
}
