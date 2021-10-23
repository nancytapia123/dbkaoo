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
 

//--> Muestra datos en tabla con ajax
function viewTableAjax($url,$sql,$table,$title,$db){

    $cursos = $db->prepare($sql);
    $cursos->execute();
    $cursos = $cursos->fetchAll(PDO::FETCH_OBJ);
  
 
  $dataJson = '{
    "data":[';

    foreach($cursos as $key => $value){
        $botones = "<button id='editAjax' type='button' class='btn btn-sm btn-info' onclick='BtnEditarAjax($value->id)' url=$url table=$table title_modal='$title' title='Editar'><i  class='glyph-icon icon-pencil'></i></button>";
        $botones.= "<button id='removeAjax' type='button' class='btn btn-sm btn-danger' onclick='BtnElimanarAjax($value->id)' table=$table url=$url  title='Eliminar'><i class='glyph-icon icon-trash'></i></button>";
        
        $dataJson .= '[';
        
        foreach($value as $key2 => $val2){
            $dataJson .= '"'.$val2.'",';         
        }

        $dataJson .= '"'.$botones.'"';   
        $dataJson .= '],';
    }

    $dataJson = substr($dataJson,0,-1);
    $dataJson .=']
    }'; 

    echo $dataJson; 
}

//--> Muestra los datos en la tabla
if(isset($tabla)){
    $url = "$pathSitioCMS/includes/ajax/colonia.php";
    $sql=" SELECT c.id,c.nombre,c.ciudad,m.nombre AS municipio,c.asentamiento,c.codigo_postal FROM colonia AS c INNER JOIN 
    municipio AS m ON m.id=c.municipio_id ";
    
    $titulo = "Colonias";
    viewTableAjax($url,$sql,$tabla,$titulo,$db);
}



?> 