# smile-editor (Super Metroid Integrated Level Editor (Rebuild))

This is an update of the code and a feature re-write to enhance usability.

**Disclaimer:  This is tool that operates on the original Super Metroid game. It
               is NOT intended - nor MAY it be used - to produce or redistribute
               the original Super Metroid game IN ANY WAY. It is intended as a
               tool for educational purposes; and is - itself - NOT INTENDED FOR
               PUBLIC SALE.**
              
# SM Editor Project Goals:

  - CAD capabilities similar to the SMILE editor v2.5 with better ease-of-use and
    an updated pallate of usual items that is available to GREATLY simplify design
    processes.
    
  - Decoupled editor file:  SMILE v2.5 uses an integrated header + extraneous files 
    for storing data used in the editing process. This will be removed and GREATLY 
    enhanced to store preferences and data banks throughout the design process as a
    single database.
    
  - Integrated music editor:  (TBD) This could be worked on with other tools; but 
    should be integrated nicely with the editor to allow MIDI sound editing and 
    music production.
    
  - CRC Checks:  To ensure compatability CRC checks should be used to verify original
    ROM game data. These will ALSO ensure PRODUCT compatability with the original game.
    
  - Simplified Headers:  IPS headers (TBD) will be removed or ignored where necessary. 
    The goal being - to remove the constraint of IPS headers and to build the new editor
    database; and the ROM as the product of the SM Editor. The ORIGINAL ROM CRC will still
    need to be verified from the game MINUS the header.
    
  - Plugins, Addons, etc...  Like the IPS headers, much of the additional content will
    depend on it's complexity; but the use of plugins should NOT be required. So, these
    will vary depending on their original design. Hopefully, most of the original constraints,
    addons, etc.. should be integrated into a SINGLE editor - to avoid overcomplicating
    the project space.

               
               
