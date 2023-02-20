<?php
  require "connessione_db.php";

  if (isset($_REQUEST["numero"]) && $_REQUEST["numero"] != "" &&
      isset($_REQUEST["sezione"]) && $_REQUEST["sezione"] != "" &&
      isset($_REQUEST["anno"]) && $_REQUEST["anno"] != "") {

    $query = "INSERT INTO classi VALUES ". "(" . $_REQUEST["numero"] . ", \"" . $_REQUEST["sezione"] . "\", " . $_REQUEST["anno"] . ")";

    $risultato = mysqli_query($link, $query);
  } else {
    $risultato = false;
  }

  require "../professori_crea_nuova_classe.html";

?>
