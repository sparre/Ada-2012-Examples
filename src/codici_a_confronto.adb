with
  Ada.Command_Line,
  Ada.Strings.Fixed,
  Ada.Text_IO;

procedure Codici_A_Confronto is
   use Ada.Command_Line, Ada.Strings.Fixed, Ada.Text_IO;

   Width, Height : Positive;
begin
   if Argument_Count = 2 then
      Width  := Positive'Value (Argument (1));
      Height := Positive'Value (Argument (2));

      for Line in 1 .. Height loop
         Put_Line (Width * '*');
      end loop;
   else
      Put_Line (File => Standard_Error,
                Item => "Exactly two arguments required: Width and height.");
      Set_Exit_Status (Failure);
   end if;
exception
   when Constraint_Error =>
      Put_Line (File => Standard_Error,
                Item => "Width and height should both be positive integers.");
      Set_Exit_Status (Failure);
end Codici_A_Confronto;
