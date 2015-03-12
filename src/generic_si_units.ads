--  created by Macks 0.3.0; do not edit!

generic
   type Float_Type is digits <>;
package Generic_SI_Units is

   type Length is private;
   Meter : constant Length;
   m : constant Length;
   cm : constant Length;
   km : constant Length;

   function ">=" (Left, Right : Length) return Boolean;

   function "*"
     (Left  : in Float_Type;
      Right : in Length)
     return Length;

   function "*"
     (Left  : in Length;
      Right : in Float_Type)
     return Length;

   function "/"
     (Left  : in Length;
      Right : in Float_Type)
     return Length;

   function "/"
     (Left  : in Length;
      Right : in Length)
     return Float_Type;

private

   type Length is new Float_Type;
   Meter : constant Length :=  1.00000E+00;
   m     : constant Length :=  1.00000E+00;
   cm    : constant Length :=  1.00000E-02;
   km    : constant Length :=  1.00000E+03;
   pragma Inline ("*", "/");

end Generic_SI_Units;
