with Ada.Text_IO;

procedure Text_Input is

   type Page_Count is range 1 .. 10_000;

   package Page_Count_Text_IO is new Ada.Text_IO.Integer_IO (Page_Count);

   function Get_Line (Message : in String) return String;
   function Get_Line (Message : in String) return Page_Count;

   function Get_Line (Message : in String) return String is
   begin
      Ada.Text_IO.Put (Message);
      return Ada.Text_IO.Get_Line;
   end Get_Line;

   function Get_Line (Message : in String) return Page_Count is
   begin
      return Result : Page_Count do
         Ada.Text_IO.Put (Message);
         Page_Count_Text_IO.Get (Result);
         if Ada.Text_IO.Get_Line'Length > 0 then
            raise Constraint_Error
              with "Page count followed by extra characters.";
         end if;
      end return;
   end Get_Line;

   Author : constant String     := Get_Line ("Enter author: ");
   Title  : constant String     := Get_Line ("Enter title: ");
   Pages  : constant Page_Count := Get_Line ("Enter number of pages: ");
begin
   Ada.Text_IO.Put_Line ("Author:          " & Author);
   Ada.Text_IO.Put_Line ("Title:           " & Title);
   Ada.Text_IO.Put_Line ("Number of pages:" & Page_Count'Image (Pages));
end Text_Input;
