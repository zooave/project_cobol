       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMPTE-EN-BANQUE.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       DATA DIVISION.
       FILE SECTION.
       
       WORKING-STORAGE SECTION.
       01 WS-BALANCE          PIC 9(9)V99 VALUE 0.
       01 WS-AMOUNT           PIC 9(9)V99 VALUE 0.
       01 WS-CHOICE           PIC 9 VALUE 0.
       
       PROCEDURE DIVISION.
      *> cobol-lint CL002 main-procedure
       MAIN-PROCEDURE.
           DISPLAY "=== Compte en Banque ===".
           PERFORM UNTIL WS-CHOICE = 4
            DISPLAY "1. Voir le solde"
            DISPLAY "2. Déposer de l'argent"
            DISPLAY "3. Retirer de l'argent"
            DISPLAY "4. Quitter"
            DISPLAY "Entrez votre choix : " WITH NO ADVANCING
            ACCEPT WS-CHOICE
       
            EVALUATE WS-CHOICE
                WHEN 1
                 PERFORM AFFICHER-SOLDE
                WHEN 2
                 PERFORM DEPOSER-ARGENT
                WHEN 3
                 PERFORM RETIRER-ARGENT
                WHEN 4
                 DISPLAY "Merci d'avoir utilisé notre service."
                WHEN OTHER
                 DISPLAY "Choix invalide, veuillez réessayer."
            END-EVALUATE
           END-PERFORM.
       
           STOP RUN.
       
       AFFICHER-SOLDE.
           DISPLAY "Votre solde actuel est : " WS-BALANCE.
       
       DEPOSER-ARGENT.
           DISPLAY "Entrez le montant à déposer : " WITH NO ADVANCING
           ACCEPT WS-AMOUNT
           ADD WS-AMOUNT TO WS-BALANCE
           DISPLAY "Dépôt effectué. Nouveau solde : " WS-BALANCE.
       
       RETIRER-ARGENT.
           DISPLAY "Entrez le montant à retirer : " WITH NO ADVANCING
           ACCEPT WS-AMOUNT
           IF WS-AMOUNT > WS-BALANCE THEN
            DISPLAY "Fonds insuffisants. Retrait annulé."
           ELSE
            SUBTRACT WS-AMOUNT FROM WS-BALANCE
            DISPLAY "Retrait effectué. Nouveau solde : " WS-BALANCE
           END-IF.
