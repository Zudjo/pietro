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

  // Main

  require "connessione_db.php";

  if (isset($_REQUEST["nome"]) && $_REQUEST["nome"] != "" &&
      isset($_REQUEST["cognome"]) && $_REQUEST["cognome"] != "" &&
      isset($_REQUEST["comune"]) && $_REQUEST["comune"] != "" &&
      isset($_REQUEST["matricola_studente"]) && $_REQUEST["matricola_studente"] != "") {

    $query = "INSERT INTO studenti VALUES " .
              "(\"" .
              $_REQUEST["matricola_studente"] .
              "\", \"" .
              $_REQUEST["nome"] .
              "\", \"" .
              $_REQUEST["cognome"] .
              "\", \"" .
              $_REQUEST["comune"] .
              "\")";

    $risultato = mysqli_query($link, $query);

    $values = explode("-", $_REQUEST["classe"]);

    $numero = $values[0];
    $sezione = $values[1];
    $anno = $values[2];

    $query = "INSERT INTO studenti_classi VALUES " .
              "(\"" .
              "NA" .
              "\", \"" .
              $_REQUEST["matricola_studente"] .
              "\", \"" .
              $numero .
              "\", \"" .
              $sezione .
              "\", \"" .
              $anno .
              "\", \"" .
              "0" .
              "\")";

    $risultato = mysqli_query($link, $query);

  } else {
    $risultato = false;
  }

  require "../professori_aggiungi_studenti.html";

?>
