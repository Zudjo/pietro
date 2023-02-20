<?php

  // Functions

  function print_select_classi() {
    require "connessione_db.php";

    $query = "SELECT * FROM classi";

    $risultato = mysqli_query($link, $query);

    while ($riga = mysqli_fetch_assoc($risultato)) {
      echo "<option value=" . $riga["Numero"] . "-" . $riga["Sezione"] . "-" . $riga["Anno"] . ">" . $riga["Numero"] . $riga["Sezione"] . " - " . $riga["Anno"] . "</option>";
    }
  }

  function print_select_studenti() {
    require "connessione_db.php";

    $query = "SELECT * FROM studenti";

    $risultato = mysqli_query($link, $query);

    while ($riga = mysqli_fetch_assoc($risultato)) {
      echo "<option value=" . $riga["Nome"] . "-" . $riga["Cognome"] . "-" . $riga["Matricola_Studenti"] . ">" . $riga["Nome"] . " " . $riga["Cognome"] . "</option>";
    }
  }

  // Main

  require "connessione_db.php";

  if (isset($_REQUEST["media_finale"]) && $_REQUEST["media_finale"] != "") {

    $values = explode("-", $_REQUEST["classe"]);
    $numero = $values[0];
    $sezione = $values[1];
    $anno = $values[2];

    $values = explode("-", $_REQUEST["studente"]);
    $matricola_studente = $values[2];

    $query = "UPDATE studenti_classi SET " .
      "Promosso = \"" . $_REQUEST["promozione"] .
      "\", Media_Finale = " . $_REQUEST["media_finale"] .
      " WHERE Matricola_Studente=" . $values[2] . " AND " .
      "Numero=" . $numero . " AND " .
      "Sezione=\"" . $sezione . "\" AND " .
      "Anno=" . $anno;

    $risultato = mysqli_query($link, $query);
  } else {
    $risultato = false;
  }

  require "../professori_assegna_esito.html";

?>
