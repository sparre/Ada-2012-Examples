with Ada.Locales;
with Ada.Text_IO;

procedure Lang is
   use Ada.Locales;
   use Ada.Text_IO;
begin
   Put_Line (Country (1) & Country (2));
   Put_Line (Language (1) & Language (2) & Language (3));
end Lang;
