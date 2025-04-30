       identification division.
       program-id. tableau.
       author "alix".

       data division. 
       working-storage section.
         01  tableau.
              05 filler pic x(6) value "amelie".
              05 filler pic x(8) value "francais".
              05 filler pic 9(2) value 15.
              05 filler pic x(8) value "histoire".
              05 filler pic 9(2) value 18.
              05 filler pic x(8) value "math".
              05 filler pic 9(2) value 20.
              05 filler pic x(6) value "Theo".
              05 filler pic x(8) value "francais".
              05 filler pic 9(2) value 12.
              05 filler pic x(8) value "histoire".
              05 filler pic 9(2) value 14.
              05 filler pic x(8) value "math".
              05 filler pic 9(2) value 16.
        
         01 ws-tableau-étudiant redefines tableau.
           05 info-étudiant occurs 2 times.
               10 ws-prenom pic x(6).
               10 ws-matiere occurs 3 times.
                  15 ws-matiere-nom pic x(8).
                  15 ws-matiere-note pic 9(2).
       01  i pic 99 value 0.
       01  j pic 99 value 0.
           procedure division.

           perform  varying i from 1 by 1 until i > 2
               display "-------------------------------"
               display "prenom : " ws-prenom(i)
                perform  varying j from 1 by 1 until j > 3
                     display "matiere : " ws-matiere-nom(i,j)
                     display "note : " ws-matiere-note(i,j)
                end-perform
           end-perform.
           display "-------------------------------".
             
          stop run.      
