package body Classes.Child is

   function Age (Item : in Instance) return Human_Age is
   begin
      return Item.Age;
   end Age;

   procedure Set (Item : in out Instance;
                  Age  : in     Human_Age) is
   begin
      Item.Age := Age;
   end Set;

end Classes.Child;
