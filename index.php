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
            
            <form class="contenedor" action="Login.php" method="post">
                <h2>Ingreso de Usuario</h2>
                <label for="correo">correo electrónico</label>
                <input type="email" id="correo" name="correo" required>
                <label for="password">contraseña</label>
                <input type="password" id="password" name="password" required>
                <button class="boton" type="submit">Entrar</button>
            </form>
            
            <div class="contenedor">
                <a class="boton" href="Registro.php">Registrarse</a>
            </div>
        </main>
        <?php notaalpie(); ?>
    </body>
    <script src="Global.js" defer></script>
</html>
