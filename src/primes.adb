with Ada.Containers.Vectors,
     Ada.Integer_Text_IO,
     Ada.Text_IO;

procedure Primes is
   package Integer_Sets is
     new Ada.Containers.Vectors (Element_Type => Positive,
                                 Index_Type   => Positive);
   use Integer_Sets;
   use type Ada.Containers.Count_Type;

   Result : Vector;
   Last   : Positive;
   Prime  : Boolean;
begin
   Last := 3;
   Result.Append (Last);

   Find_Primes :
   loop
      Last := Last + 2;
      Prime := True;

      Check_Divisible :
      for Divisor of Result loop
         exit Check_Divisible when Divisor * Divisor > Last;

         if Last mod Divisor = 0 then
            Prime := False;
            exit Check_Divisible;
         end if;
      end loop Check_Divisible;

      if Prime then
         Result.Append (Last);

         if Result.Length mod 100_000 = 0 then
            Ada.Integer_Text_IO.Put (Last);
            Ada.Text_IO.New_Line;
         end if;

         exit Find_Primes when Last > 9_999_999;
      end if;
   end loop Find_Primes;

   Ada.Text_IO.Put ("Total: ");
   Ada.Integer_Text_IO.Put (Natural (Result.Length) + 1); --  2 is a prime
   Ada.Text_IO.Put_Line (" primes");
end Primes;
