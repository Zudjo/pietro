<?php

  // Functions

  function disegna_tabella($risultato) {
    while ($riga = mysqli_fetch_assoc($risultato)) {
      echo "<div class=\"row p-2 m-0 border-white border-bottom border-1\">";
      echo "<div class=\"col\">" . $riga["Titolo"] . "</div>";
      echo "<div class=\"col\">" . $riga["Descrizione"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Inizio"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Fine"] . "</div>";
      echo "<div class=\"col\">" . $riga["Totale_Ore"] . "</div>";
      echo "<div class=\"col\">" . $riga["Codice"] . "</div>";
      echo "<div class=\"col\"> <a href=\"studenti_visualizza_corsi_interni.php?codice=" . $riga["Codice"] . "&matricola_studente=" . $_REQUEST["matricola_studente"] . "\" class=\"align-self-center w-75\"><input type=\"button\" class=\"btn btn-outline-light my-3 py-3 w-100\" name=\"\" value=\"Iscriviti\"></a> </div>";
      echo "</div>";
    }
  }

  function iscriviti($matricola, $codice) {
    require "connessione_db.php";

    $query = "INSERT INTO studenti_corsi_interni VALUES ($matricola, $codice)";

    $risultato = mysqli_query($link, $query);

  }

  // Main

  require "connessione_db.php";

  $query = "SELECT * FROM corsi_interni";

  $risultato = mysqli_query($link, $query);

  require "../studenti_visualizza_corsi_interni.html";

  if (isset($_REQUEST["codice"])) {
    iscriviti($_REQUEST["matricola_studente"], $_REQUEST["codice"]);
  }
?>
