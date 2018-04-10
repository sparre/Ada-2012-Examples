with Ada.Text_IO;

with Big_Integer;

procedure Use_Big_Integers is
   use all type Big_Integer.Instance;

   procedure Multiply (A, B : in     Big_Integer.Instance);

   procedure Multiply (A, B : in     Big_Integer.Instance) is
      use Ada.Text_IO;
   begin
      Put (Image (A));
      Put (" * ");
      Put (Image (B));
      Put (" = ");
      Put (Image (A * B));
      New_Line;
   exception
      when Constraint_Error =>
         Put_Line ("Constraint_Error");
   end Multiply;

begin
   Multiply (A => (0 => 1, others => 0),
             B => (others => Big_Integer.Digit'Last));

   Multiply (A => (0 => Big_Integer.Digit'Last, others => 0),
             B => (0 => Big_Integer.Digit'Last, others => 0));

   Multiply (A => (0 => 2, others => 0),
             B => (others => Big_Integer.Digit'Last));

   Multiply (A => (2 => 0, 1 => 1, 0 => 2),
             B => (2 => 0, 1 => 4, 0 => 5));

   Multiply (A => (2 => 0, 1 => 2, 0 => 2),
             B => (2 => 0, 1 => 4, 0 => 5));

   Multiply (A => (2 => 0, 1 => 2, 0 => 3),
             B => (2 => 0, 1 => 4, 0 => 5));
end Use_Big_Integers;
