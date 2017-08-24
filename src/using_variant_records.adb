with Variant_Records;

procedure Using_Variant_Records is
   use Variant_Records;

   A : Data_Array (Word_Size =>  8, Length => 16);
   B : Data_Array (Word_Size => 64, Length =>  2);

begin
   for I in A.Data_8'Range loop
      A.Data_8 (I) := 2 * Data_8_Bit (I) + 4;
   end loop;

   for I in B.Data_64'Range loop
      B.Data_64 (I) := Data_64_Bit (8 ** I) + 4;
   end loop;

   declare
      D : Data_Array := B;
   begin
      for E of D.Data_64 loop
         E := E * 8;
      end loop;
   end;

end Using_Variant_Records;
