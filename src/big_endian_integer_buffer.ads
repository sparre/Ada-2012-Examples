with Interfaces;

generic
   type Discrete_Type is (<>);  -- CANDIDATE
package Big_Endian_Integer_Buffer is
   pragma Assert (Discrete_Type'Size in 16 | 32 | 64);

   function Get return Discrete_Type;
   procedure Set (Value : Discrete_Type);

   Size_In_Bytes : constant Positive := Discrete_Type'Size / 8;

   type Buffer_Type is array (1 .. Size_In_Bytes) of Interfaces.Unsigned_8
     with Component_Size => 8;

   pragma Assert (Discrete_Type'Size = Buffer_Type'Size);

   Buffer : aliased Buffer_Type := (others => 0);
end Big_Endian_Integer_Buffer;
