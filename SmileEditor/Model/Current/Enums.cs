namespace SmileEditor.Model.Current
{
    // (Legacy) PLM type.Depending on which entry is selected in the PLM Selector (#2),
    //          the name and contents of this editing area will change between "Standard PLM",
    //          "Save Station PLM", "Scroll PLM", "Door PLM", "Expansion PLM", or "Upgrade PLM".

    /// <summary>
    /// Post Load Modification Type (see PLM class)
    /// </summary>
    public enum PLMType
    {
        Standard,
        SaveStation,
        Scroll,
        Door,
        Expansion,
        Upgrade
    }
}
