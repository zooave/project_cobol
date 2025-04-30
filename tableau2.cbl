       identification division.
         program-id. tableau2.
            author. "alix".

           data division.

           working-storage section.
           01 tableau.
               05 filler pic 9(2) value 1 indexed by ws-index .
               05 filler pic 9(2) value 2.
               05 filler pic 9(2) value 3.
               05 filler pic 9(2) value 4.
               05 filler pic 9(2) value 5.
               05 filler pic 9(2) value 6.
               05 filler pic 9(2) value 7.
               05 filler pic 9(2) value 8.
               05 filler pic 9(2) value 9.
               05 filler pic 9(2) value 10.
               05 filler pic 9(2) value 11.
               05 filler pic 9(2) value 12.
               05 filler pic 9(2) value 13.
               05 filler pic 9(2) value 14.
               05 filler pic 9(2) value 15.
               05 filler pic 9(2) value 16.
               05 filler pic 9(2) value 17.
               05 filler pic 9(2) value 18.
               05 filler pic 9(2) value 19.
               05 filler pic 9(2) value 20.

           procedure division.
               
           01 note redefines tableau.
             set ws-index pic 9(2) value 1.

