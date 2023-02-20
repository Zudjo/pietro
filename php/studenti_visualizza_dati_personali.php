<?php

  // FUNCTIONS
  function disegna_tabella($ris) {
    require "connessione_db.php";

    while ($riga = mysqli_fetch_assoc($ris)) {
      echo "<div class=\"row p-2 m-0 border-white border-bottom border-1\">";
      echo "<div class=\"col\">" . $riga["Nome"] . "</div>";
      echo "<div class=\"col\">" . $riga["Cognome"] . "</div>";
      echo "<div class=\"col\">" . $riga["Comune"] . "</div>";
      echo "<div class=\"col\">" . $riga["Matricola_Studenti"] . "</div>";
      echo "</div>";
    }
  }

  // MAIN
  require "connessione_db.php";
  $nome = $_REQUEST["utente_nome"];
  $query = "SELECT * FROM studenti WHERE Nome=\"$nome\"";
  $risultato = mysqli_query($link, $query);

  require "../studenti_visualizza_dati_personali.html";

?>
