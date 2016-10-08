with Ada.Assertions;

with Generic_SI_Units;

procedure Subtypes_of_Dimensioned_Types is
   type Scalar is digits 10;

   package Units is new Generic_SI_Units (Scalar);
   use Units;

   subtype Distance is Length
     with Dynamic_Predicate => Distance >= 0.0 * m;

   A : constant Length   := (-2.05) * m;
   B : Distance;

   pragma Unreferenced (B);
begin
   B := A;
   raise Program_Error
     with "Assignment of negative length to a distance succeeded.";
exception
   when Ada.Assertions.Assertion_Error =>
      null;
end Subtypes_of_Dimensioned_Types;
