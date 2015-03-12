generic
   type t is mod <>;
package Generic_Power_of_2 is
   pragma Assert ((for some N in 1 .. 63 => t'Modulus = 2 ** N),
                  "Only powers of 2 allowed for t'Modulus.");
end Generic_Power_of_2;
