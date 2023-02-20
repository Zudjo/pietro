<?php

  // FUNCTIONS

  function disegna_tabella($ris) {
    require "connessione_db.php";

    while ($riga = mysqli_fetch_assoc($ris)) {
      echo "<div class=\"row p-2 m-0 border-white border-bottom border-1\">";
      echo "<div class=\"col\">" . $riga["Numero"] . "</div>";
      echo "<div class=\"col\">" . $riga["Sezione"] . "</div>";
      echo "<div class=\"col\">" . $riga["Anno"] . "</div>";
      echo "<div class=\"col\">" . $riga["Promosso"] . "</div>";
      echo "<div class=\"col\">" . $riga["Media_Finale"] . "</div>";
      echo "</div>";
    }
  }

  // MAIN

  require "../studenti_visualizza_esiti.html";

?>
