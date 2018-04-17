with
  Ada.Containers.Indefinite_Ordered_Maps,
  Ada.Text_IO;

procedure Container_Indexing is
   package Integer_String_Maps is
     new Ada.Containers.Indefinite_Ordered_Maps
           (Key_Type     => Integer,
            Element_Type => String);
   use Ada.Text_IO;

   Map : Integer_String_Maps.Map;
begin
   Map.Insert (Key      => 1,
               New_Item => "one");
   Map.Insert (Key      => 2,
               New_Item => "two");
   Map.Insert (Key      => 3,
               New_Item => "three");

   Put_Line ("for ... of ... loop:");
   for E of Map loop
      Put_Line ("- " & E);
   end loop;

   Put_Line ("for ... in ... loop:");
   for I in Map.Iterate loop
      Put_Line ("- " & Map (I));
   end loop;
end Container_Indexing;
