<?php
include "Global.php";
include "DB.php";
moveOut();

// cargar la informacion de todos los productos
$productos = doQuery("SELECT p.id AS id, p.nombre AS nombre, p.is_imagen AS is_imagen,
    p.descripcion AS descripcion, p.precio AS precio, p.disponibles AS disponibles,
    c.nombre AS categoria, sc.nombre AS subcategoria, us.nombre As uso
    FROM productos AS p
    INNER JOIN subcategorias AS sc ON p.id_subcategoria=sc.id
    INNER JOIN categorias AS c ON c.id=sc.id_categoria
    INNER JOIN usos AS us ON p.id_uso=us.id
    WHERE p.id_propietario=? AND p.id_est_producto < 3
    ORDER BY p.fecha_registro DESC",
    [$_SESSION['id']]);
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

            <div class="invisible_cont" style="padding: 10px;">
                <?php
                if ($productos[0]) {
                    if (count($productos[1]) == 0) {
                        echo "<h4>No hay productos asociados...</h4>";
                    }
                    else {
                        foreach ($productos[1] as $p) {
                            setProductoFicha(
                                $p['id'], $p['is_imagen'], $p['nombre'],
                                $p['descripcion'], $p['categoria'], $p['subcategoria'],
                                $p['uso'], $p['precio'], $p['disponibles']
                            );
                        }
                    }
                }
                else {
                    echo "<h4>". showMsj("error_busqueda_db"). "</h4>";
                }
                ?>
            </div>
        </main>
        <?php notaalpie(); ?>
    </body>
    <script src="Global.js" defer></script>
</html>
