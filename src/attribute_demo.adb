with Ada.Calendar;
with Ada.Text_IO;

with Eksempel_2;

procedure Attribute_Demo is
   use type Ada.Calendar.Time;
   use Eksempel_2;

   Data : Eksempel_2.Goods_Data_Type;
begin
   Data.Set_Production_Date ("311299");
   if Data.Production_Date + 1.0 < Ada.Calendar.Clock then
      Ada.Text_IO.Put_Line ("Strange");
   else
      Ada.Text_IO.Put_Line (Production_Date (Data));
   end if;
end Attribute_Demo;
