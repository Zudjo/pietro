<?php
  require "connessione_db.php";

  if (isset($_REQUEST["titolo"]) && $_REQUEST["titolo"] != "" &&
      isset($_REQUEST["descrizione"]) && $_REQUEST["descrizione"] != "" &&
      isset($_REQUEST["data_inizio"]) && $_REQUEST["data_inizio"] != "" &&
      isset($_REQUEST["data_fine"]) && $_REQUEST["data_fine"] != "" &&
      isset($_REQUEST["totale_ore"]) && $_REQUEST["totale_ore"] != "" &&
      isset($_REQUEST["documentazione"]) && $_REQUEST["documentazione"] != "" &&
      isset($_REQUEST["ente"]) && $_REQUEST["ente"] != "" &&
      isset($_REQUEST["codice"]) && $_REQUEST["codice"] != "" &&
      isset($_REQUEST["matricola_professore"]) && $_REQUEST["matricola_professore"] != "") {

    $query = "INSERT INTO corsi_esterni VALUES " .
              "(\"" .
              $_REQUEST["descrizione"] .
              "\", \"" .
              $_REQUEST["data_inizio"] .
              "\", \"" .
              $_REQUEST["data_fine"] .
              "\", \"" .
              $_REQUEST["totale_ore"] .
              "\", \"" .
              $_REQUEST["ente"] .
              "\", \"" .
              $_REQUEST["documentazione"] .
              "\", \"" .
              $_REQUEST["titolo"] .
              "\", \"" .
              $_REQUEST["codice"] .
              "\", \"" .
              $_REQUEST["matricola_professore"] .
              "\"" .
              ")";

    $risultato = mysqli_query($link, $query);
  } else {
    $risultato = false;
  }
  require "../professori_crea_nuovo_corso_esterno.html";

?>
