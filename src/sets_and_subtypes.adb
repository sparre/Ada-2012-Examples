with Ada.Text_IO;

procedure Sets_And_Subtypes is
   type Enumeration is (A, B, C, D, E);

   type Set is array (Enumeration) of Boolean with Pack;

   procedure Put (Item : in Set);
   procedure Put (Item : in Set) is
      use Ada.Text_IO;
   begin
      Put_Line ("{");

      for I in Item'Range loop
         if Item (I) then
            Put_Line ("  " & Enumeration'Image (I));
         end if;
      end loop;
      Put_Line ("}");
   end Put;

   subtype ABC is Enumeration range A .. C;
   subtype ABE is Enumeration with Static_Predicate => ABE in A | B | E;

   --  Mapping a subtype to a set:
   X : constant Set := (ABC => True, others => False);
   Y : constant Set := (ABE => True, others => False);

begin
   Put (X);
   Put (Y);

   --  Operations on sets:
   Put (X and Y);
   Put (X or Y);
end Sets_And_Subtypes;
