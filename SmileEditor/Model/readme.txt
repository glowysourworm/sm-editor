Notes on the model
------------------

[2/1/2022] The Legacy model is copied carefully from the original source code (v2.5); and the value types are left
		   as is to preserve any static memory size.

		   The Current model is created for use by the editor; and should NOT be sized to deal with static memory
		   layout. Therefore, the static memory layout, banks, etc.. are taken into account while the current model
		   is being loaded from the ROM (or, the ROM + our data file format - which will be a single file database
		   structure TBD).

		   This design change will greatly simplify the model processing in the new editor. 

[2/6/2022] Model extensions will be marked as such "(Extension)" - so that these data can be stored outside the 
		   ROM as part of the working database for the open project. 