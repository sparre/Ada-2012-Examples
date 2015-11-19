with
  Ada.Containers,
  Ada.Containers.Synchronized_Queue_Interfaces,
  Ada.Containers.Unbounded_Synchronized_Queues,
  Ada.Strings.Unbounded,
  Ada.Strings.Unbounded.Hash,
  Ada.Text_IO;

procedure Chained_Calls is
   use Ada.Strings.Unbounded;

   function "+" (Item : String) return Unbounded_String
     renames To_Unbounded_String;
   function "+" (Item : Unbounded_String) return String
     renames To_String;

   use Ada.Containers;

   package String_Queue_Interfaces is
      new Synchronized_Queue_Interfaces (Unbounded_String);
   package String_Queues is
      new Unbounded_Synchronized_Queues
            (Queue_Interfaces => String_Queue_Interfaces);

   package Hash_Queue_Interfaces is
      new Synchronized_Queue_Interfaces (Hash_Type);
   package Hash_Queues is
      new Unbounded_Synchronized_Queues
            (Queue_Interfaces => Hash_Queue_Interfaces);

   use Ada.Text_IO;

   --  Mapping the following to Ada:
   --
   --  Observable.just("Hello, world!")
   --      .map(s -> s + " -Dan")
   --      .map(s -> s.hashCode())
   --      .map(i -> Integer.toString(i))
   --      .subscribe(s -> System.out.println(s));

   Q1 : String_Queues.Queue;

   task Hello_World;
   task body Hello_World is
   begin
      Q1.Enqueue (+"Hello, world!");
   end Hello_World;

   Q2 : String_Queues.Queue;

   task Add_Source;
   task body Add_Source is
      Buffer : Unbounded_String;
   begin
      Q1.Dequeue (Buffer);
      Q2.Enqueue (Buffer & " -Dan");
   end Add_Source;

   Q3 : Hash_Queues.Queue;

   task Hash_String;
   task body Hash_String is
      Buffer : Unbounded_String;
   begin
      Q2.Dequeue (Buffer);
      Q3.Enqueue (Hash (Buffer));
   end Hash_String;

   Q4 : String_Queues.Queue;

   task Hash_As_String;
   task body Hash_As_String is
      Buffer : Hash_Type;
   begin
      Q3.Dequeue (Buffer);
      Q4.Enqueue (+Hash_Type'Image (Buffer));
   end Hash_As_String;

   task Output;
   task body Output is
      Buffer : Unbounded_String;
   begin
      Q4.Dequeue (Buffer);
      Put_Line (+Buffer);
   end Output;
begin
   null;
end Chained_Calls;
