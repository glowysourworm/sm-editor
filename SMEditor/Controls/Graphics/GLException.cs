using System;

namespace SMEditor.Controls.Graphics
{
    internal class GLException : Exception
    {
        public GLException(string message) : base(message)
        {
        }

        public GLException(string message, params object[] args) : base(string.Format(message, args))
        {
        }

        public GLException(string message, Exception innerException, params object[] args) : base(string.Format(message, args), innerException)
        {
        }
    }
}
