package Array_Subtypes is
   subtype Digit_Character is Character range '0' .. '9';
   subtype Digit_String is String
     with Dynamic_Predicate => (for all C of Digit_String
                                  => C in Digit_Character);
end Array_Subtypes;
