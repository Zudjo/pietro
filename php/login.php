<?php
  // Controllo credenziali per login
  login(ucfirst(strtolower($_REQUEST["utente_nome"])), $_REQUEST["utente_password"], $_REQUEST["utente_tipo"]);

  // Funzioni
  function login($utente_nome, $utente_password, $utente_tipo) {
    require "connessione_db.php";

    $query = "SELECT Nome, Matricola_$utente_tipo FROM $utente_tipo WHERE Nome='$utente_nome' AND Matricola_$utente_tipo='$utente_password'";

    $risultato = mysqli_query($link, $query);

    // Credenziali corrette
    if (mysqli_num_rows($risultato)) {
      $riga = mysqli_fetch_assoc($risultato);
      if ($riga["Nome"] == $utente_nome && $riga["Matricola_$utente_tipo"] == $utente_password) {
        header("Location: $utente_tipo.php?utente_nome=$utente_nome&Matricola_$utente_tipo=$utente_password");
        die();
      }
    }

    // Credenziali errate
    header("Location: ../login_fallito.html");
  }
?>
