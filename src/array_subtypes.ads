package Array_Subtypes is
   subtype Digit_Character is Character range '0' .. '9';
   subtype Digit_String is String
     with Dynamic_Predicate
            => (for all C of Digit_String => C in Digit_Character
                  --  or else raise Constraint_Error
                  --  Bug box in GNAT GPL 2014 and GNAT-4.9
               );
end Array_Subtypes;
