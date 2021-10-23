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


 if(isset($tabla)){
    $url = "$pathSitioCMS/includes/ajax/tipo_habitacion.php";
    $sql="SELECT h.id,h.habitacion,ho.hotel,h.vista,h.detalle,h.vendible FROM habitacion AS h  
          INNER JOIN hotel  AS ho ON h.hotel_id=ho.id";
    $titulo = "habitacion";

    viewTableAjax($url,$sql,$tabla,$titulo,$db);

} 
//--> Inserta un nuevo registro
if(isset($action) && $action=="registrar"){
    $sql="INSERT INTO habitacion (tipo_habitacion_id, habitacion, hotel_id, vista, detalle, vendible) VALUES ('$tipo_habitacion_id','$habitacion','$hotel_id','$vista','$detalle','$vendible')";
    $cursoss = $db->prepare($sql);
  
    if($cursoss->execute()){
        echo true;
    }else{
        echo false;
    }
    
}
//-> Elimina un curso
if(isset($action) && $action=="delete"){
    $sql="DELETE FROM $table WHERE id = $id";
    $cursos = $db->prepare($sql);
    if( $cursos->execute()){
        echo true;
    }else{
        echo false;
    }
}
//--> Retorna los datos del registro a editar

if(isset($action) && $action=="edit"){
    $sql="SELECT * FROM $table WHERE id= $id";
    
    $cursos = $db->prepare($sql);
    
    $cursos->execute();
    $cursos = $cursos->fetchAll(PDO::FETCH_OBJ);

    echo json_encode($cursos,true);

}
//--> Actualiza el registro
if(isset($idEditar)){

    
    $sql="UPDATE habitacion SET habitacion='$habitacion',
    hotel_id=$hotel_id,tipo_habitacion_id='$tipo_habitacion_id',vista='$vista',
    detalle='$detalle',vendible='$vendible' WHERE id = $idEditar";
     
    $cursos = $db->prepare($sql);
    $cursos->execute();
    if($cursos->execute()){
        echo true;
    }else{
        echo false;
    }
}


//-> Elimina un curso
if(isset($action) && $action=="delete"){
    $sql="DELETE FROM $table WHERE id = $id";
    $cursos = $db->prepare($sql);
    if( $cursos->execute()){
        echo true;
    }else{
        echo false;
    }
}
 if(isset($id_hotel)){
    $sql="SELECT htp.*,tp.tipo_habitacion FROM hotel_has_tipo_habitacion AS htp 
    INNER JOIN tipo_habitacion AS tp ON htp.tipo_habitacion_id=tp.id
     WHERE hotel_id=$id_hotel";      
    $tipo_habitacion = $db->prepare($sql);
    $tipo_habitacion->execute();
    $tipo = $tipo_habitacion->fetchAll(PDO::FETCH_OBJ);
    $option=null;
    foreach ($tipo as $key => $value) {  
        
     $option.="<option value='$value->id'>$value->tipo_habitacion</option>";
     
  }
  echo  $option;
} 



