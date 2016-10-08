package body Mixed_Enumeration_And_Integer is

   function "+" (Item : Integer_Values) return Object is
   begin
      return (State => Integer, I => Item);
   end "+";

   function "+" (Item : Enumeration_Values) return Object is
   begin
      return (State => Enumeration, E => Item);
   end "+";

   function "+" (Item : Object) return Integer_Values is
   begin
      return Item.I;
   end "+";

   function "+" (Item : Object) return Enumeration_Values is
   begin
      return Item.E;
   end "+";

   function "=" (Left  : Integer_Values;
                 Right : Object) return Boolean is
   begin
      return Right.State = Integer and then Left = Right.I;
   end "=";

   function "=" (Left  : Enumeration_Values;
                 Right : Object) return Boolean is
   begin
      return Right.State =  Enumeration and then Left = Right.E;
   end "=";

end Mixed_Enumeration_And_Integer;
