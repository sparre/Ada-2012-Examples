package Mixed_Enumeration_And_Integer is
   type Integer_Values is range 1 .. 10;
   type Enumeration_Values is (Jack, Queen, King, Ace);

   type Object is private;

   function "+" (Item : Integer_Values) return Object;
   function "+" (Item : Enumeration_Values) return Object;

   function "+" (Item : Object) return Integer_Values;
   function "+" (Item : Object) return Enumeration_Values;

   function "=" (Left  : Integer_Values;
                 Right : Object) return Boolean;
   function "=" (Left  : Enumeration_Values;
                 Right : Object) return Boolean;

private
   type States is (Uninitialized, Integer, Enumeration);

   type Object (State : States := Uninitialized) is
      record
         case State is
            when Uninitialized => null;
            when Integer       => I : Integer_Values;
            when Enumeration   => E : Enumeration_Values;
         end case;
      end record;
end Mixed_Enumeration_And_Integer;
