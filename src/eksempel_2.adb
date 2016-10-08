package body Eksempel_2 is

   function Production_Date (Item : in Goods_Data_Type) return DDMMYY_Date is
      pragma Unreferenced (Item);
   begin
      return "DDMMYY";
   end Production_Date;

   procedure Set_Production_Date (Item  : in out Goods_Data_Type;
                                  Value : in     DDMMYY_Date) is
      pragma Unreferenced (Value);
   begin
      Item.Production_Date := Ada.Calendar.Clock;
   end Set_Production_Date;

end Eksempel_2;
