<?php
include "Global.php";
moveIn();
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <?php encabezado(); ?>
    </head>
    <body>
        <main class="superior">
            <?php titulOut(); ?>
            
            <form class="contenedor" action="ReRegistro.php" method="post">
                <h2>Registro de Usuario</h2>
                <input type="email" name="correo" placeholder="correo electrónico" required>
                <input type="password" name="password" placeholder="constraseña" required>
                <input type="text" name="nombre" placeholder="escriba su nombre" required>
                <select class="avatar" name="avatar">
                    <?php echo getAvatarHtml(); ?>
                </select>
                <button class="boton" type="submit">Enviar</button>
            </form>
            
            <div class="contenedor">
                <a class="boton" href="index.php">Login</a>
            </div>
        </main>
        <?php notaalpie(); ?>
    </body>
    <script src="Global.js" defer></script>
</html>
