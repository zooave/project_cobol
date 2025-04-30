       identification division.
       program-id. solde.
       author "alix".

       data division.
         working-storage section.
       01  solde pic s9(4).

        procedure division.
            move +1698 to solde
            display "les solde son à : " solde
            stop run.
        end program solde.
