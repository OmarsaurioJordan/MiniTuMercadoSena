<?php
include "Global.php";
include "DB.php";

$correo = trim(isset($_POST['correo']) ? $_POST['correo'] : "");
$password = trim(isset($_POST['password']) ? $_POST['password'] : "");
$password = password_hash($password, PASSWORD_DEFAULT);
$nombre = trim(isset($_POST['nombre']) ? $_POST['nombre'] : "");
$avatar = isset($_POST['avatar']) ? $_POST['avatar'] : "";

$res = doQuery("INSERT INTO usuarios (correo, password, nombre,
    avatar, descripcion, link) VALUES (?, ?, ?, ?, '', '')",
    [$correo, $password, $nombre, $avatar]);
if ($res[0]) {
    header("Location:index.php?msj=registrado");
}
else {
    header("Location:Registro.php?msj=existe_mail");
}
?>
