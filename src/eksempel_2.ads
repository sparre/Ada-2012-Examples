with Ada.Calendar;

package Eksempel_2 is
   type Goods_Data_Type is tagged
      record
         Noget           : Integer;
         Production_Date : Ada.Calendar.Time;
      end record;

   subtype DDMMYY_Date is String (1 .. 6);

   function Production_Date (Item : in Goods_Data_Type) return DDMMYY_Date;
   procedure Set_Production_Date (Item  : in out Goods_Data_Type;
                                  Value : in     DDMMYY_Date);

end Eksempel_2;
