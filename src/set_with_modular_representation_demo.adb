with Ada.Command_Line;
with Ada.Text_IO;

with Set_With_Modular_Representation;

procedure Set_With_Modular_Representation_Demo is
   type Outcomes is (Paper, Rock, Scissors, Suicide, None);
   subtype Choices is Outcomes range Paper .. Scissors;

   type Numeric_Choices is mod 2 ** 3;
   package Choice_Set is
     new Set_With_Modular_Representation (Element_Type => Choices,
                                          Numeric_Type => Numeric_Choices);
   use Choice_Set;

   Mapping : array (Numeric_Choices) of Outcomes := (others => None);
begin
   Set_Up_Mapping :
   begin
      --  Single challenger victories
      Mapping (Ø     & Rock)     := Rock;
      Mapping (Ø     & Paper)    := Paper;
      Mapping (Ø     & Scissors) := Scissors;

      --  Double challenger victories
      Mapping (Rock  & Paper)    := Paper;
      Mapping (Rock  & Scissors) := Rock;
      Mapping (Paper & Scissors) := Scissors;
   end Set_Up_Mapping;

   Test :
   declare
      package Outcome_Text_IO is
        new Ada.Text_IO.Enumeration_IO (Outcomes);
      use Ada.Command_Line, Ada.Text_IO, Outcome_Text_IO;

      Chosen : Numeric_Choices := Ø;
   begin
      for Index in 1 .. Argument_Count loop
         Chosen := Chosen & Choices'Value (Argument (Index));
      end loop;

      Put ("Outcome: ");
      Put (Mapping (Chosen));
      New_Line;
   end Test;
end Set_With_Modular_Representation_Demo;
