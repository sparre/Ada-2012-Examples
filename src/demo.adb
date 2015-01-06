with Ada.Text_IO;

with Mercurial;

procedure Demo is
begin
   Ada.Text_IO.Put_Line ("Revision: " & Mercurial.Revision);
end Demo;
