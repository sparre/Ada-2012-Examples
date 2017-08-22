package Variant_Records is

   type Word_Sizes is range 8 .. 64
     with Static_Predicate => Word_Sizes in 8 | 16 | 32 | 64;

   type Data_8_Bit  is mod 2 **  8 with Size =>  8;
   type Data_16_Bit is mod 2 ** 16 with Size => 16;
   type Data_32_Bit is mod 2 ** 32 with Size => 32;
   type Data_64_Bit is mod 2 ** 64 with Size => 64;

   type Array_8_Bit  is array (Positive range <>) of Data_8_Bit;
   type Array_16_Bit is array (Positive range <>) of Data_16_Bit;
   type Array_32_Bit is array (Positive range <>) of Data_32_Bit;
   type Array_64_Bit is array (Positive range <>) of Data_64_Bit;

   type Data_Array (Word_Size : Word_Sizes;
                    Length    : Natural) is
      record
         case Word_Size is
            when  8 => Data_8  : Array_8_Bit  (1 .. Length);
            when 16 => Data_16 : Array_16_Bit (1 .. Length);
            when 32 => Data_32 : Array_32_Bit (1 .. Length);
            when 64 => Data_64 : Array_64_Bit (1 .. Length);
         end case;
      end record;

end Variant_Records;
