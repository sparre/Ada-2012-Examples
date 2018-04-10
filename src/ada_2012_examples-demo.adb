with Ada.Text_IO;
with Interfaces;

with Ada_2012_Examples.Mercurial;
with Array_Subtypes;
with Big_Endian_Integer_Buffer;
with Mixed_Enumeration_And_Integer;
with Settings;
with Settings_V2;

pragma Unreferenced (Array_Subtypes);
pragma Unreferenced (Mixed_Enumeration_And_Integer);
pragma Unreferenced (Settings);
pragma Unreferenced (Settings_V2);

procedure Ada_2012_Examples.Demo is

   package A is
     new Big_Endian_Integer_Buffer (Discrete_Type => Interfaces.Unsigned_16);
   pragma Unreferenced (A);

begin
   Ada.Text_IO.Put_Line ("Revision: " & Mercurial.Revision);
end Ada_2012_Examples.Demo;
