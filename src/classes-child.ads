with Classes.Parent;

package Classes.Child is
   subtype Parent is Classes.Parent.Instance;
   type Instance is new Parent with private;
   subtype Class is Instance'Class;
   type Reference is access all Instance;

   type Years is range -60_000_000_000 .. +60_000_000_000;
   subtype Human_Age is Years range 0 .. 150;

   procedure Set (Item : in out Instance;
                  Age  : in     Human_Age);
   function Age (Item : in Instance) return Human_Age;
private
   type Instance is new Parent with
      record
         Age : Human_Age;
      end record;
end Classes.Child;
