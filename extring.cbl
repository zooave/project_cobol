       identification division.
       program-id. extring.

       data division.
       
       working-storage section.
       01 salutation pic x(20).
       01 zone1 pic x(20) value "Bonjour".
       01 zone2 pic x(20) value "tout le monde".
       01 pointeur pic 9(2). 

       procedure division.

       move 1 to pointeur.

       string zone1 space zone2
           delimited by size
           into salutation
           with pointer pointeur
       end-string

       display salutation
       stop run. 