<?php
  // Credenziali connessione
  $server = "localhost";
  $utente_db_nome = "root";
  $utente_db_password = "";
  $db = "scuola";

  // Crea connessione
  $link = mysqli_connect($server, $utente_db_nome, $utente_db_password, $db);

  // Controlla connessione
  if (!$link) {
    die("Connessione fallita: " . mysqli_connect_error());
  }
?>
