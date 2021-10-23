<?php

include 'configAjax.php';
if(isset($_GET["tabla"])){
    $query=" SELECT m.id,m.nombre,m.estado_id,m.nombre AS municipio, es.nombre AS estado_nombre FROM municipio AS m 
    INNER JOIN estado AS es ON m.estado_id=es.id ORDER BY m.nombre ASC ";

  
       $municipios = $db->prepare($query);
       $municipios->execute();
       $muni = $municipios->fetchAll(PDO::FETCH_OBJ);
      
       $datosJson = '{
        "data":[';

        foreach($muni as $key => $value){
          $datosJson .= '[
          "'.($key+1).'",
          "'.$value->estado_nombre.'",
  
          "'.$value->municipio.'"
            ],';
        }
    $datosJson = substr($datosJson, 0, -1);
    $datosJson .= ']
    }';
    echo $datosJson;
       
   }

