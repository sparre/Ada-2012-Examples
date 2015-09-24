with Ada.Text_IO;

with The_Project.Mercurial;

procedure The_Project.Demo is
begin
   Ada.Text_IO.Put_Line ("Revision: " & Mercurial.Revision);
end The_Project.Demo;
