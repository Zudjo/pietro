<?php

  // FUNCTIONS
  function disegna_tabella($ris) {
    require "connessione_db.php";

    while ($riga = mysqli_fetch_assoc($ris)) {
      echo "<div class=\"row p-2 m-0 border-white border-bottom border-1\">";
      echo "<div class=\"col\">" . $riga["Titolo"] . "</div>";
      echo "<div class=\"col\">" . $riga["Descrizione"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Inizio"] . "</div>";
      echo "<div class=\"col\">" . $riga["Data_Fine"] . "</div>";
      echo "<div class=\"col\">" . $riga["Totale_Ore"] . "</div>";
      echo "<div class=\"col\">" . $riga["Codice"] . "</div>";
      echo "<div class=\"col\">" . $riga["Matricola_Professore"] . "</div>";
      echo "</div>";
    }
  }

  function perTitolo($value) {
    require "connessione_db.php";

    $query = "SELECT * FROM corsi_interni WHERE Titolo LIKE \"%$value%\"";

    $risultato = mysqli_query($link, $query);

    disegna_tabella($risultato);
  }

  function perCodice($value) {
    require "connessione_db.php";

    $query = "SELECT * FROM corsi_interni WHERE Codice=\"$value\"";

    $risultato = mysqli_query($link, $query);

    disegna_tabella($risultato);
  }

  function perOre($valueDa, $valueA) {
    require "connessione_db.php";

    $query = "SELECT * FROM corsi_interni WHERE Totale_Ore BETWEEN $valueDa AND $valueA";

    $risultato = mysqli_query($link, $query);

    disegna_tabella($risultato);
  }

  // MAIN

  require "../professori_visualizza_corsi_interni.html";

?>
