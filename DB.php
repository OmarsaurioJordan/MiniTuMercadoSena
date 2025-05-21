<?php
$db_host = "localhost";
$db_user = "root";
$db_password = "";
$db_name = "tu_mercado_sena";
$cnx = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_password);
$cnx -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

function doQuery($sql="", $values=[]) {
    // doQuery("SELECT id FROM gente WHERE nombre=? AND edad=?", [$nombre, $edad]);
    // return [exito, data[]]
    global $cnx;
    $stmt = $cnx -> prepare($sql);
    try {
        if ($stmt -> execute($values)) {
            $tipo = strtoupper(strtok(trim($sql), " "));
            return [true, $tipo == "SELECT" ?
                $stmt -> fetchAll(PDO::FETCH_ASSOC) : []];
        }
        else {
            return [false, []];
        }
    }
    catch (PDOException $e) {
        return [false, []];
    }
}

function getTipos($tablaname, $valorActual=-1) {
    global $cnx;
    $optns = "<option value=-1>...</option>";
    $res = doQuery("SELECT id, nombre FROM $tablaname");
    if (!$res[0]) {
        return $optns;
    }
    foreach ($res[1] as $row) {
        $optns .= "<option value=" .$row['id'];
        if ($row['id'] == $valorActual) {
            $optns .= " selected>";
        }
        else {
            $optns .= ">";
        }
        $optns .= $row['nombre']. "</option>";
    }
    return $optns;
}
?>
