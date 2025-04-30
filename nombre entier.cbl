       identification division.
       program-id. NOMBRE-ENTIER.
       author. "alix".

       data division.
       working-storage section.
       
       01  n pic 9(3) value zero.
       01  ent PIC 9(3) VALUE zero.
       01  reste PIC 9(3) VALUE zero.
       01  resultat PIC 9(3) VALUE ZERO. 

      
       procedure division.
           PERFORM RECEUILLIR-NOMBRE.
           PERFORM TRAITEMENT-PRINCIPALE.
           perform AFFICHER-RESULTAT.
           STOP RUN.

           RECEUILLIR-NOMBRE.
               DISPLAY "Entrez un nombre ENTIER NATUREL  : ".
               ACCEPT n.
           
           TRAITEMENT-PRINCIPALE.
           MOVE 2 TO ent.
              PERFORM UNTIL ent >= N
                DIVIDE n BY ent GIVING resultat remainder reste
                   IF reste = 0 THEN 
                       DISPLAY "LE NOMBRE N'EST PAS UN NOMBRE ENTIER "
                       STOP RUN 
                   END-IF
                add 1 TO ent
              END-PERFORM.


           AFFICHER-RESULTAT.
                 IF n = ent THEN 
                    DISPLAY "LE NOMBRE EST UN NOMBRE ENTIER "
                 ELSE
                    DISPLAY "LE NOMBRE N''EST PAS UN NOMBRE ENTIER "
                 END-IF.
             STOP RUN.
           
        
