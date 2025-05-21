<?php
session_start();
$piesito = "Omar & Erick - ADSO24 - SENA - 2025";
$hostLink = "https://www.omwekiatl.xyz/tu_mercado_sena";
$hostMail = "ojorcio@omwekiatl.xyz";
$myMail = "ojorcio@gmail.com";

$avatar = [
    '😆','😊','🙃','😉','😍','😘','😋','🤪',
    '😖','🙁','😏','🥺','😭','😡','😳','🥵',
    '😶','😬','🙄','😴','😮','🥴','😈','👽','💀','🤡'
];

$msj = showMsj(isset($_GET['msj']) ? $_GET['msj'] : "");
echo "<input type='hidden' id='msj' value='$msj'>";

function showMsj($msj, $extra="") {
    switch ($msj) {
        case "mail_ok":
            return "✅ Se ha envíado un e-mail con la clave de acceso!!!";
        case "mail_test":
            return "✅ Test: sin e-mail, $extra";
        case "registrado":
            return "✅ Se ha registrado con éxito!!!";
        case "error_mail":
            return "⛔ Falla interna enviando e-mail, reinténtalo!!!";
        case "error_db":
            return "⛔ Falla interna en la DB, reinténtalo!!!";
        case "mal_mail":
            return "⛔ Debes escribir un e-mail válido!!!";
        case "mal_password":
            return "⛔ La clave de acceso es incorrecta!!!";
        case "mal_login":
            return "⛔ El e-mail o la clave son incorrectos!!!";
        case "existe_mail":
            return "⛔ Posiblemente el e-mail esté ya en el sistema!!!";
        case "void":
            return "⛔ No se obtuvieron datos!!!";
    }
    return "";
}

function getAvatar($ind_avatar) {
    global $avatar;
    if ($ind_avatar >= 0 && $ind_avatar < count(($avatar))) {
        return $avatar[$ind_avatar];
    }
    return "👤";
}

function encabezado() {
    echo "<meta charset='utf-8'>";
    echo "<meta name='viewport' content='width=device-width, initial-scale=1.0'>";
    echo "<link rel='stylesheet' href='styles.css'>";
    echo "<title>Tu Mercado Sena</title>";
}

function notaalpie() {
    global $piesito;
    echo "<footer class='piesito'>";
    echo "<hr>";
    echo "<p class='subtitulo'>$piesito</p>";
    echo "</footer>";
}

function getAvatarHtml() {
    global $avatar;
    $res = "";
    for ($i = 0; $i < count($avatar); $i++) {
        $res .= "<option class='avatar' value=$i>" .$avatar[$i]. "</option>";
    }
    return $res;
}

function moveIn() {
    if (isset($_SESSION['id'])) {
        header("Location:Catalogo.php");
    }
}

function moveOut() {
    if (!isset($_SESSION['id'])) {
        header("Location:index.php");
    }
}

function titulOut() {
    ?><div class="horizontal_separado">
        <img src="icono.png" alt="logotipo" width="96" height="96">
        <h1> Tu Mercado Sena</h1>
    </div>
    <p class="subtitulo">Aquí podeís comprar / vender tus cachibaches tío/a</p>
    <?php
}

function tituloLogin() {
    ?><div class="horizontal_separado">
        <img src="icono.png" alt="logotipo" width="96" height="96">
        <div style="flex-grow: 10;"></div>
        <div style="width: 96px; visibility: hidden;"></div>
        <div class="vertical_separado cont_fondo">
            <div class="horizontal_separado">
                <label class="avatar">
                    <?php echo getAvatar($_SESSION['avatar']); ?>
                </label>
                <h4><?php echo $_SESSION['nombre']; ?></h4>
            </div>
            <a class="boton" style="font-size: 16px;" href="Salir.php">Logout</a>
        </div>
    </div><?php
}

function setProductoFicha($id, $is_imagen, $titulo, $descripcion, $categoria,
        $subcategoria, $uso, $precio, $disponibles) {
    ?><div class="cont_fondo">
        <div class="vertical">
            <div class="horizontal">
                <?php
                if ($is_imagen) {
                    ?><img src="img_productos/img_<?php echo $id; ?>.jpg"
                        alt="foto producto" width="200" height="200"><?php
                }
                else {
                    ?><img src="img_productos/nothing.jpg"
                        alt="foto producto" width="200" height="200"><?php
                }
                ?>
                <div class="vertical">
                    <p class="subp"><?php echo $titulo; ?></p>
                    <ul>
                        <li><?php echo $categoria; ?></li>
                        <li><?php echo $subcategoria; ?></li>
                        <li><?php echo $uso; ?></li>
                        <li>$ <?php echo $precio; ?></li>
                        <li>- <?php echo $disponibles; ?> +</li>
                    </ul>
                    <a class="boton" style="font-size: 16px;"
                        href="EditarProducto.php?ind=<?php echo $id; ?>">Editar</a>
                </div>
            </div>
            <p><?php echo $descripcion; ?></p>
        </div>
    </div><?php
}
?>
