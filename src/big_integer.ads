package Big_Integer is

   Base : constant := 10;
   Size : constant := 3;

   type Extended_Digit is range 0 .. Base * Base;
   subtype Digit is Extended_Digit range 0 .. Base - 1;

   type Instance is array (0 .. Size - 1) of Digit;

   function "*" (Left, Right : in Instance) return Instance;

   function Image (Item : in Instance) return String;

end Big_Integer;
