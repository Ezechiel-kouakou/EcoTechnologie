<?php
session_start();
session_destroy();
header('Location: ecotech_employe.html');
exit();
?>