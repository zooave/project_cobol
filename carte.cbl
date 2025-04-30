           IDENTIFICATION DIVISION.
           PROGRAM-ID. CarteDeCredit.
       
           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT CompteBancaire
                ASSIGN TO "compte-en-banque.dat"
                ORGANIZATION IS LINE SEQUENTIAL.
       
           DATA DIVISION.
           FILE SECTION.
           FD  CompteBancaire.
           01  Compte-Record.
               05  Numero-Compte       PIC X(10).
               05  Nom-Titulaire       PIC X(30).
               05  Solde               PIC 9(9)V99.
       
           WORKING-STORAGE SECTION.
           01  Carte-Details.
               05  Numero-Carte        PIC X(16) VALUE "1234567890123456".
               05  Limite-Credit       PIC 9(9)V99 VALUE 5000.00.
               05  Solde-Utilise       PIC 9(9)V99 VALUE 0.00.
       
           01  Transaction-Details.
               05  Montant-Transaction PIC 9(9)V99.
               05  Code-Transaction    PIC X(1).
       
           01  Flags.
               05  Fin-Programme       PIC X VALUE "N".
       
           PROCEDURE DIVISION.
           Debut-Programme.
               OPEN I-O CompteBancaire
               PERFORM JusquAFin
               CLOSE CompteBancaire
               STOP RUN.
       
           JusquAFin.
               PERFORM JusquA "Y" = Fin-Programme
                EVALUATE TRUE
                    WHEN Code-Transaction = "P"
                     PERFORM EffectuerPaiement
                    WHEN Code-Transaction = "C"
                     PERFORM ConsulterSolde
                    WHEN OTHER
                     DISPLAY "Code invalide."
                END-EVALUATE
                DISPLAY "Voulez-vous continuer ? (Y/N)"
                ACCEPT Fin-Programme
               END-PERFORM.
       
           EffectuerPaiement.
               DISPLAY "Entrez le montant du paiement :"
               ACCEPT Montant-Transaction
               IF Montant-Transaction + Solde-Utilise > Limite-Credit
                DISPLAY "Transaction refusée : limite de crédit dépassée."
               ELSE
                ADD Montant-Transaction TO Solde-Utilise
                DISPLAY "Paiement accepté. Nouveau solde utilisé : " Solde-Utilise
               END-IF.
       
           ConsulterSolde.
               DISPLAY "Entrez le numéro de compte :"
               ACCEPT Numero-Compte
               READ CompteBancaire
                INVALID KEY DISPLAY "Compte introuvable."
                NOT INVALID KEY
                    DISPLAY "Solde du compte : " Solde
               END-READ.