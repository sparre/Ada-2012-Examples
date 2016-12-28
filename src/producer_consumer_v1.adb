with Ada.Containers.Synchronized_Queue_Interfaces;
with Ada.Containers.Unbounded_Synchronized_Queues;
with Ada.Text_IO;

procedure Producer_Consumer_V1 is
   type Work_Item is range 1 .. 100;

   package Work_Item_Queue_Interfaces is
     new Ada.Containers.Synchronized_Queue_Interfaces
           (Element_Type => Work_Item);

   package Work_Item_Queues is
     new Ada.Containers.Unbounded_Synchronized_Queues
           (Queue_Interfaces => Work_Item_Queue_Interfaces);

   Queue : Work_Item_Queues.Queue;

   task type Producer;
   task type Consumer;

   Producers : array (1 .. 1)  of Producer with Unreferenced;
   Consumers : array (1 .. 10) of Consumer with Unreferenced;

   task body Producer is
   begin
      for Item in Work_Item loop
         Queue.Enqueue (New_Item => Item);
      end loop;
   end Producer;

   task body Consumer is
      Item : Work_Item;
   begin
      loop
         Queue.Dequeue (Element => Item);
         Ada.Text_IO.Put_Line (Work_Item'Image (Item));
      end loop;
   end Consumer;

begin
   null;
end Producer_Consumer_V1;
