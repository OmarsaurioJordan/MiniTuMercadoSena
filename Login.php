<?php
include "Global.php";
include "DB.php";

$correo = trim(isset($_POST['correo']) ? $_POST['correo'] : "");
$password = trim(isset($_POST['password']) ? $_POST['password'] : "");

$res = doQuery("SELECT id, nombre, avatar, password FROM usuarios
    WHERE correo=?", [$correo]);
if ($res[0]) {
    if (count($res[1]) != 0) {
        if (password_verify($password, $res[1][0]['password'])) {
            $_SESSION['id'] = $res[1][0]['id'];
            $_SESSION['nombre'] = $res[1][0]['nombre'];
            $_SESSION['avatar'] = $res[1][0]['avatar'];
            header("Location:Catalogo.php");
        }
        else {
            // tambien podria ser mal_login
            header("Location:index.php?msj=mal_password");
        }
    }
    else {
        // tambien podria ser mal_login
        header("Location:index.php?msj=mal_mail");
    }
}
else {
    header("Location:index.php?msj=error_db");
}
?>
