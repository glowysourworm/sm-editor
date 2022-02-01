using CommonUtility.Wpf.ViewModel;

namespace SmileEditor.Model.Current
{
    /// <summary>
    /// Post Load Modification definition. These are for special room events tied to blocks on the 
    /// screen.
    /// </summary>
    internal class PLM : NotifyViewModel
    {
        PLMType _type;
        byte _x;
        byte _y;

        internal PLMType Type
        {
            get { return _type; }
            set { this.RaiseAndSetIfChanged(ref _type, value); }
        }
        internal byte X
        {
            get { return _x; }
            set { this.RaiseAndSetIfChanged(ref _x, value); }
        }
        internal byte Y
        {
            get { return _y; }
            set { this.RaiseAndSetIfChanged(ref _y, value); }
        }

        internal PLM() 
        {
            this.Type = PLMType.Standard;
        }
    }
}
