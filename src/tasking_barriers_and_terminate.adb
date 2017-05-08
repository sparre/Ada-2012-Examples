with Ada.Text_IO;

procedure Tasking_Barriers_And_Terminate is

   task Running is
      entry Open;
      entry Close;
      entry A (T : String);
      entry B (T : String);
   end Running;

   task body Running is
      Is_Open : Boolean := True;
   begin
      loop
         select
            accept Open;
            Is_Open := True;
         or
            accept Close;
            Is_Open := False;
         or
            when Is_Open =>
            accept A (T : String) do
               Ada.Text_IO.Put_Line ("A: """ & T & """");
            end A;
         or
            when Is_Open =>
            accept B (T : String) do
               Ada.Text_IO.Put_Line ("B: """ & T & """");
            end B;
         or
            terminate;
         end select;
      end loop;
   end Running;

begin
   Running.A ("Hello");
   Running.Close;
   delay 10.0;
   Running.Open;
   Running.B ("World");
end Tasking_Barriers_And_Terminate;
