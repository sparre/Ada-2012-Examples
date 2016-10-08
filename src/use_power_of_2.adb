with Ada.Assertions;

with Generic_Power_of_2;

procedure Use_Power_Of_2 is
   type a is mod 2 ** 19;
   type b is mod 2 ** 32;
   type c is mod 2 ** 17 + 1;

   package OK      is new Generic_Power_of_2 (a);
   package Also_OK is new Generic_Power_of_2 (b);

   pragma Unreferenced (OK, Also_OK);
begin
   declare
      package Not_OK  is new Generic_Power_of_2 (c);
      pragma Unreferenced (Not_OK);
   begin
      raise Program_Error
        with "Instantiation with non-power of two succeeded.";
   end;
exception
   when Ada.Assertions.Assertion_Error =>
      null;
end Use_Power_Of_2;
