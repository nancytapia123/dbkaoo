<?php

include 'configAjax.php';
foreach ($_REQUEST as $key => $value) {
    //echo $key . "--".$value."<br>"; 
    $$key =  Security($value);
}

foreach ($_COOKIE as $key => $value) {
    // echo $key . "--".$value."\n\n"; 
    $$key =  Security($value);
}
 

//--> Inserta un nuevo registro
if(isset($action) && $action=="registrar"){
    
    $sql="INSERT INTO hotel (id, cuih, hotel, num_habitaciones) VALUES (null,'$hotel','$cuih','$num_habitaciones')";
    
    $cursoss = $db->prepare($sql);
    $cursoss->execute();
    $id = $db->lastInsertId();
    setcookie('idHotel', $id, time() + (86400 * 30), '/', $_SERVER["SERVER_NAME"]);

    if($id>0){
        echo true;
    }else{
        echo false;
    }
    
}

if(isset($cp)){
    $sql="SELECT c.id AS id_colonia,c.nombre AS colonia,m.id AS id_municipio, m.nombre AS municipio,e.id AS id_estado, e.nombre AS estado,p.id AS id_pais, p.nombre AS pais FROM colonia AS c
    INNER JOIN municipio AS m ON c.municipio_id=m.id
    INNER JOIN estado AS e ON m.estado_id=e.id
    INNER JOIN pais AS p ON e.pais_id=p.id
    WHERE c.codigo_postal=$cp";
    
     $cursoss = $db->prepare($sql);  
     $cursoss->execute();
     $cursoss = $cursoss->fetchAll(PDO::FETCH_OBJ);
    // var_dump($cursos);
   
     echo json_encode($cursoss);

}

?> 