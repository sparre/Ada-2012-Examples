procedure Disallow is
   pragma Warnings (Off); --  Just demonstrating how to hide an operation.

   type Length is digits 10;

   overriding
   function "*" (Left, Right : Length) return Length is abstract;

   A, B, C : Length := 2.0;
begin
   C := A + B;
   --  C := A * B; --  Not allowed.
end Disallow;
