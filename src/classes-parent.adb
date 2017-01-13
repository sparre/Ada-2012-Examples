package body Classes.Parent is

   function Name (Item : in Instance) return String is
   begin
      return Ada.Strings.Unbounded.To_String (Item.Name);
   end Name;

   procedure Set (Item : in out Instance;
                  Name : in     String) is
   begin
      Item.Name := Ada.Strings.Unbounded.To_Unbounded_String (Name);
   end Set;

end Classes.Parent;
