<?php

  // FUNCTIONS

  function disegna_tabella_interni($ris) {
    require "connessione_db.php";

    while ($riga = mysqli_fetch_assoc($ris)) {
      echo "<div class=\"row p-2 m-0 border-white border-bottom border-1\">";
      echo "<div class=\"col\">" . $riga["Titolo"] . "</div>";
      echo "<div class=\"col\">" . $riga["Descrizione"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Inizio"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Fine"] . "</div>";
      echo "<div class=\"col\">" . $riga["Totale_Ore"] . "</div>";
      echo "<div class=\"col\">" . $riga["Codice"] . "</div>";
      echo "<div class=\"col\"></div>";
      echo "<div class=\"col\"></div>";
      echo "</div>";
    }
  }

  function disegna_tabella_esterni($ris) {
    require "connessione_db.php";

    while ($riga = mysqli_fetch_assoc($ris)) {
      echo "<div class=\"row p-2 m-0 border-white border-bottom border-1\">";
      echo "<div class=\"col\">" . $riga["Titolo"] . "</div>";
      echo "<div class=\"col\">" . $riga["Descrizione"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Inizio"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Fine"] . "</div>";
      echo "<div class=\"col\">" . $riga["Totale_Ore"] . "</div>";
      echo "<div class=\"col\">" . $riga["Codice"] . "</div>";
      echo "<div class=\"col\">" . $riga["Documentazione"] . "</div>";
      echo "<div class=\"col\">" . $riga["Ente"] . "</div>";
      echo "</div>";
    }
  }

  // MAIN

  require "../studenti_visualizza_corsi_frequentando.html";

?>
