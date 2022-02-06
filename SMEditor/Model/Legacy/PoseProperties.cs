namespace SMEditor.Model.Legacy
{
    internal class PoseProperties
    {
        internal byte SamDir { get; set; }
        internal byte MoveType { get; set; }
        internal byte NewPose { get; set; }
        internal byte ShotDir { get; set; }
        internal byte VerDisplace { get; set; }
        internal byte unused1 { get; set; }
        internal byte VerRadius { get; set; }
        internal byte unused2 { get; set; }

        internal PoseProperties() { }
    }
}
