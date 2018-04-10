with Ada.Strings.Unbounded;

package body Big_Integer is

   function "*" (Left, Right : in Instance) return Instance is
      Carry : Extended_Digit := 0;
      Sum   : Extended_Digit;
   begin
      return Product : Instance := (others => 0) do
         for I in Left'Range loop
            for J in Right'Range loop
               if I + J in Product'Range then
                  Sum := Left (I) * Right (J) + Carry + Product (I + J);

                  Product (I + J) := Sum mod Base;
                  Carry           := Sum / Base;
               else
                  Sum := Left (I) * Right (J) + Carry;

                  if Sum = 0 then
                     Carry := 0;
                  else
                     raise Constraint_Error with "Big integer overflow.";
                  end if;
               end if;
            end loop;

            if Carry /= 0 then
               raise Constraint_Error with "Big integer overflow.";
            end if;
         end loop;
      end return;
   end "*";

   function Image (Item : in Instance) return String is
      Buffer : Ada.Strings.Unbounded.Unbounded_String;
   begin
      for E of reverse Item loop
         Ada.Strings.Unbounded.Append (Buffer, Digit'Image (E));
      end loop;

      return Ada.Strings.Unbounded.To_String (Buffer);
   end Image;

end Big_Integer;
