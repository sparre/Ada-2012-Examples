with Ada.Unchecked_Conversion;

package Example_1 is
   package Inventory_Types is
      subtype Load_ID         is String (1 .. 10);
      subtype Part_ID         is String (1 .. 10);
      subtype Number_6_Digits is String (1 .. 6);
   end Inventory_Types;

   subtype Inbound_Order_Line is String (1 .. 2)
     with Dynamic_Predicate => Inbound_Order_Line = "43";

   type Telegram is
      record
         Transaction_ID : Inbound_Order_Line;
         Unique_ID      : Inventory_Types.Load_ID;
         Article        : Inventory_Types.Part_ID;
         Quantity       : Inventory_Types.Number_6_Digits;
      end record
        with Pack;
   subtype Line_Telegram is String (1 .. 28);

   pragma Assert (Line_Telegram'Size = Telegram'Size);

   function To_Telegram is
      new Ada.Unchecked_Conversion (Source => Line_Telegram,
                                    Target => Telegram);

end Example_1;
