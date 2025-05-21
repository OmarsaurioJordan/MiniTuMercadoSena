<?php
include "Global.php";
include "DB.php";
moveOut();

// cargar la informacion de todos los productos
$res = doQuery("SELECT id, nombre, is_imagen, FROM productos WHERE id_propietario=?", [$correo]);
if ($res[0]) {
    if (count($res[1]) != 0) {
        $_SESSION['id'] = $res[1][0]['id'];
        $_SESSION['nombre'] = $res[1][0]['nombre'];
        $_SESSION['avatar'] = $res[1][0]['avatar'];
    }
}
else {
    // notificar error cargando
}
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <?php encabezado(); ?>
    </head>
    <body>
        <main class="superior">
            <?php tituloLogin(); ?>
            
            <div class="contenedor" style="padding: 1rem;">
                <h2>Productos del Usuario</h2>
                <a class="boton" href="CrearProducto.php">Crear Producto</a>
            </div>

            <div class="contenedor" style="padding: 10px;">

            </div>
        </main>
        <?php notaalpie(); ?>
    </body>
    <script src="Global.js" defer></script>
</html>
