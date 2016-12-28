with Ada.Strings.Unbounded;

package Settings_V2 is
   function "+" (Item : in String)
     return Ada.Strings.Unbounded.Unbounded_String
     renames Ada.Strings.Unbounded.To_Unbounded_String;

   type String_Array is array (Positive range <>)
     of Ada.Strings.Unbounded.Unbounded_String;

   File_Names : constant String_Array :=
                  (+"/some/file/name",
                   +"/var/spool/mail/mine",
                   +"/etc/passwd");
end Settings_V2;
