--  created by Macks 0.3.0; do not edit!
--  With manual additions.

pragma Warnings (Off);
pragma Style_Checks (Off);

package body Generic_SI_Units is

   overriding
   function ">=" (Left, Right : Length) return Boolean is
   begin
      return Float_Type (Left) >= Float_Type (Right);
   end ">=";

   ---------
   -- "*" --
   ---------

   function "*"
     (Left  : in Float_Type;
      Right : in Length)
     return Length
   is
   begin
      return Length (Float_Type (Left) * Float_Type (Right));
   end "*";

   ---------
   -- "*" --
   ---------

   function "*"
     (Left  : in Length;
      Right : in Float_Type)
     return Length
   is
   begin
      return Length (Float_Type (Left) * Float_Type (Right));
   end "*";

   ---------
   -- "/" --
   ---------

   function "/"
     (Left  : in Length;
      Right : in Float_Type)
     return Length
   is
   begin
      return Length (Float_Type (Left) / Float_Type (Right));
   end "/";

   ---------
   -- "/" --
   ---------

   function "/"
     (Left  : in Length;
      Right : in Length)
     return Float_Type
   is
   begin
      return Float_Type (Float_Type (Left) / Float_Type (Right));
   end "/";

end Generic_SI_Units;

pragma Warnings (On);
