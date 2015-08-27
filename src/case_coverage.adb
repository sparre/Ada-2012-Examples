with Ada.Command_Line,
     Ada.Text_IO;

procedure Case_Coverage is
   type Months is (Jan, Feb, Mar, Apr, May, Jun,
                   Jul, Aug, Sep, Oct, Nov, Dec);
   subtype Summer is Months
     with Static_Predicate => Summer in Nov .. Dec | Jan .. Apr;
   subtype Winter is Months range May .. Oct;

   Input : constant Months := Months'Value (Ada.Command_Line.Argument (1));
begin
   case Input is
      when Summer =>
         Ada.Text_IO.Put_Line ("Summer!");
      when Winter =>
         Ada.Text_IO.Put      ("Winter");

         case Winter'(Input) is
            when May =>
               Ada.Text_IO.Put_Line (", but spring in Denmark.");
            when Jun .. Aug =>
               Ada.Text_IO.Put_Line (", but summer in Denmark.");
            when Sep | Oct =>
               Ada.Text_IO.Put_Line (", and autumn in Denmark.");
         end case;
   end case;
end Case_Coverage;
