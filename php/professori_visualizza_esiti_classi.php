<?php

  // FUNCTIONS
  function print_select_classi() {
    require "connessione_db.php";

    $query = "SELECT * FROM classi";

    $risultato = mysqli_query($link, $query);

    while ($riga = mysqli_fetch_assoc($risultato)) {
      echo "<option value=" . $riga["Numero"] . "-" . $riga["Sezione"] . "-" . $riga["Anno"] . ">" . $riga["Numero"] . $riga["Sezione"] . " - " . $riga["Anno"] . "</option>";
    }
  }

  function disegna_tabella($ris) {
    require "connessione_db.php";

    while ($riga = mysqli_fetch_assoc($ris)) {
      echo "<div class=\"row p-2 m-0 border-white border-bottom border-1\">";
      echo "<div class=\"col\">" . $riga["Nome"] . "</div>";
      echo "<div class=\"col\">" . $riga["Cognome"] . "</div>";
      echo "<div class=\"col\">" . $riga["Comune"] . "</div>";
      echo "<div class=\"col\">" . $riga["Promosso"] . "</div>";
      echo "<div class=\"col\">" . $riga["Media_Finale"] . "</div>";
      echo "<div class=\"col\">" . $riga["Matricola_Studente"] . "</div>";
      echo "</div>";
    }
  }

  // MAIN
  require "connessione_db.php";

  $values = explode("-", $_REQUEST["classe"]);
  $numero = $values[0];
  $sezione = $values[1];
  $anno = $values[2];

  $query = "SELECT Nome, Cognome, Comune, Promosso, Media_Finale, Matricola_Studente FROM studenti_classi
    JOIN studenti on studenti_classi.Matricola_Studente = studenti.Matricola_Studenti
    WHERE Numero=" . $numero . " AND Sezione=\"" . $sezione . "\" AND Anno=" . $anno;

  $risultato = mysqli_query($link, $query);


  require "../professori_visualizza_esiti_classi.html";

?>
