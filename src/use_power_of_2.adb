with Generic_Power_of_2;

procedure Use_Power_Of_2 is
   type a is mod 2 ** 19;
   type b is mod 2 ** 32;
   type c is mod 2 ** 17 + 1;

   package OK      is new Generic_Power_of_2 (a);
   package Also_OK is new Generic_Power_of_2 (b);
   package Not_OK  is new Generic_Power_of_2 (c);

   pragma Unreferenced (OK, Also_OK, Not_OK);
begin
   null;
end Use_Power_Of_2;
