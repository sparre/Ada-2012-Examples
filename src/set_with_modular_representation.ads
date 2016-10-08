private
with Ada.Unchecked_Conversion;

generic
   type Element_Type is (<>);
   type Numeric_Type is mod <>;
package Set_With_Modular_Representation is
   type Instance is array (Element_Type) of Boolean with Pack;

   Empty_Set : constant Numeric_Type := 0;
   Ø         : Numeric_Type renames Empty_Set;

   function "&" (Left  : in Instance;
                 Right : in Instance) return Numeric_Type;
   function "&" (Left  : in Numeric_Type;
                 Right : in Instance) return Numeric_Type;

   function "&" (Left  : in Element_Type;
                 Right : in Element_Type) return Numeric_Type;
   function "&" (Left  : in Numeric_Type;
                 Right : in Element_Type) return Numeric_Type;
private
   pragma Assert (Numeric_Type'Modulus = 2 ** Instance'Size);
   pragma Assert (Numeric_Type'Size = Instance'Size);

   function Numeric is
     new Ada.Unchecked_Conversion (Source => Instance,
                                   Target => Numeric_Type);
   function Numeric (Item : in Element_Type) return Numeric_Type;
end Set_With_Modular_Representation;
