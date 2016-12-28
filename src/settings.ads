with Ada.Containers.Indefinite_Vectors;

package Settings is
   ------------------------------------------------------------------
   --  You may want to put this block in a separate package:
   package String_Vectors is
     new Ada.Containers.Indefinite_Vectors (Index_Type   => Positive,
                                            Element_Type => String);
   pragma Warnings (Off); --  We want to rename "&" as "+"!
   function "+" (Left, Right : String) return String_Vectors.Vector
     renames String_Vectors."&";
   function "+" (Left  : String_Vectors.Vector;
                 Right : String) return String_Vectors.Vector
     renames String_Vectors."&";
   pragma Warnings (On);
   ------------------------------------------------------------------

   File_Names : constant String_Vectors.Vector :=
                  "/some/file/name" +
                  "/var/spool/mail/mine" +
                  "/etc/passwd";
end Settings;
