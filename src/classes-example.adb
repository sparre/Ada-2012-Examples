with Ada.Text_IO;

with Classes.Parent;
with Classes.Child;

procedure Classes.Example is

   function Random return Parent.Class;

   function Random return Parent.Class is
      Result : Child.Instance;
   begin
      Result.Set (Name => "Lea");
      Result.Set (Age  => 6);
      return Result;
   end Random;

begin
   declare
      use Ada.Text_IO;

      Item : constant Parent.Class := Random;
   begin
      if Item in Child.Class then
         declare
            View : Child.Instance renames Child.Instance (Item);
         begin
            Put_Line (View.Name & " is " & Child.Years'Image (View.Age) &
                        " years old.");
         end;
      else
         Put_Line ("We don't know the age of " & Item.Name & ".");
      end if;
   end;
end Classes.Example;
