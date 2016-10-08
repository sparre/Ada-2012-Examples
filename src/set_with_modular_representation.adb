package body Set_With_Modular_Representation is
   function "&" (Left  : in Instance;
                 Right : in Instance) return Numeric_Type is
   begin
      return Numeric (Left) or Numeric (Right);
   end "&";

   function "&" (Left  : in Numeric_Type;
                 Right : in Instance) return Numeric_Type is
   begin
      return Left or Numeric (Right);
   end "&";

   function "&" (Left  : in Element_Type;
                 Right : in Element_Type) return Numeric_Type is
   begin
      return Numeric (Left) or Numeric (Right);
   end "&";

   function "&" (Left  : in Numeric_Type;
                 Right : in Element_Type) return Numeric_Type is
   begin
      return Left or Numeric (Right);
   end "&";

   function Numeric (Item : in Element_Type) return Numeric_Type is
      Buffer : Instance := (others => False);
   begin
      Buffer (Item) := True;
      return Numeric (Buffer);
   end Numeric;
end Set_With_Modular_Representation;
