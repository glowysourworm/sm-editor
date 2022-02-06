namespace SmileEditor.Model.Current
{
    // (Legacy) PLM type.Depending on which entry is selected in the PLM Selector (#2),
    //          the name and contents of this editing area will change between "Standard PLM",
    //          "Save Station PLM", "Scroll PLM", "Door PLM", "Expansion PLM", or "Upgrade PLM".

    /// <summary>
    /// Post Load Modification Type (see PLM class)
    /// </summary>
    internal enum PLMType
    {
        Standard,
        SaveStation,
        Scroll,
        Door,
        Expansion,
        Upgrade
    }

    /// <summary>
    /// These are the original areas to Super Metroid. This ordering should not be coupled to the
    /// ROM ordering - though it probably is laid out the same.
    /// </summary>
    internal enum MapArea : byte
    {
        Crateria = 0,
        Brinstar = 1,
        Norfair = 2,
        WreckedShip = 3,
        Maridia = 4,
        Tourian = 5,
        Ceres = 6,
        Debug = 7
    }

    /// <summary>
    /// This is the control number associated with a track for modifying the behavior of
    /// the music with regards to the game play.
    /// </summary>
    internal enum MusicControl : byte
    {
        NoChange = 0x0,
        SamusAppears = 0x1,
        AquireItem = 0x2,
        Elevator = 0x3,
        HallBeforeStatues = 0x4,
        NoChangeOrSongOne = 0x5,
        SongTwo = 0x6,
        Mute = 0x7
    }

    /// <summary>
    /// Original track numbers pulled from the ROM. NOTE*** These byte value correspond to
    /// ROM data; but are not necessary for reading the ROM. Those track numbers are pulled
    /// from the ROM format data.
    /// </summary>
    internal enum MusicTrack : byte
    {
        None = 0x0,
        TitleScreen = 0x3,
        EmptyCrateria = 0x6,
        SpacePirate = 0x9,
        SamusTheme = 0x0C,
        GreenBrinstar = 0x0F,
        RedBrinstar = 0x12,
        UpperNorfair = 0x15,
        LowerNorfair = 0x18,
        Maridia = 0x1B,
        Tourian = 0x1E,
        MotherBrain = 0x21,
        BossFightPrelude = 0x24,
        BossFight = 0x27,
        MinibossFight = 0x2A,
        Ceres = 0x2D,
        WreckedShip = 0x30,
        ZebesBoom = 0x33,
        Intro = 0x36,
        Death = 0x39,
        Credits = 0x3C,
        GameIntroVoice1 = 0x3F,
        GameIntroVoice2 = 0x42,
        LargeMetroid = 0x45,
        SamusThemeTBD = 0x48
    }
}
