with Ada.Integer_Text_IO;

with Example_1;

procedure Test_Example_1 is
   use Example_1;

   Incoming : constant Line_Telegram := "43 X56789012 Y56789012 10000";
   Quantity : Natural;
begin
   Quantity := Natural'Value (To_Telegram (Incoming).Quantity);
   Ada.Integer_Text_IO.Put (Quantity, Width => 6);
end Test_Example_1;
