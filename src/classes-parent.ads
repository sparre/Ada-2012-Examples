private with Ada.Strings.Unbounded;

package Classes.Parent is
   type Instance is tagged private;
   subtype Class is Instance'Class;
   type Reference is access all Instance;

   procedure Set (Item : in out Instance;
                  Name : in     String);
   function Name (Item : in Instance) return String;
private
   type Instance is tagged
      record
         Name : Ada.Strings.Unbounded.Unbounded_String;
      end record;
end Classes.Parent;
