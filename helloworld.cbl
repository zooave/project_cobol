       identification division.
       program-id. HelloWorld.
       author. "alix".

       data division.
       working-storage section.
       01  WS-nom pic x(12).
       

       procedure division.
           display "Bienvenue".
           display "quel est votre nom ?".
           accept ws-nom 
           display "et bien salut à toi " ws-nom
              display "et bienvenue dans le monde du COBOL".
           
           
           
           stop run.
       end program HelloWorld.
       
       
