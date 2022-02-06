using SMEditor.Model.Current.Common;

namespace SMEditor.Model.Current.Music
{
    /// <summary>
    /// 
    /// </summary>
    internal class Track : ModelBase
    {
        /// <summary>
        /// Pointer back to the original track data
        /// </summary>
        internal ROMPointer TrackPointer { get; private set; }

        /// <summary>
        /// Track identifier for the music
        /// </summary>
        internal MusicTrack OriginalMusicTrack { get; private set; }

        /// <summary>
        /// TODO
        /// </summary>
        internal MusicControl MusicControl { get; set; }

        internal Track()
        {
            this.TrackPointer = ROMPointer.Empty;
        }
    }
}
