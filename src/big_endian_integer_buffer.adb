with Ada.Unchecked_Conversion;

package body Big_Endian_Integer_Buffer is
   function To_Buffer is
     new Ada.Unchecked_Conversion (Source => Discrete_Type,
                                   Target => Buffer_Type);
   function To_Discrete is
     new Ada.Unchecked_Conversion (Source => Buffer_Type,
                                   Target => Discrete_Type);

   function Get return Discrete_Type is
   begin
      return To_Discrete (Buffer);
   end Get;

   procedure Set (Value : Discrete_Type) is
   begin
      Buffer := To_Buffer (Value);
   end Set;
end Big_Endian_Integer_Buffer;
