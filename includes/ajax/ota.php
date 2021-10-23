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


/* Funciones para la tabla ota */
function viewTableOta($url,$sql,$table,$title,$db){
    
    $cursos = $db->prepare($sql);
    $cursos->execute();
    $cursos = $cursos->fetchAll(PDO::FETCH_OBJ);
 
 
  $dataJson = '{
    "data":[';

    foreach($cursos as $key => $value){
        $botones = "<button id='editAjaxOta' type='button' class='btn btn-sm btn-info' onclick='BtnEditarOta($value->id)' url=$url table=$table title_modal='$title' title='Editar'><i  class='glyph-icon icon-pencil'></i></button>";
        $botones.= "<button id='removeAjaxOta' type='button' class='btn btn-sm btn-danger' onclick='BtnEliminarOta($value->id)' table=$table url=$url  title='Eliminar'><i class='glyph-icon icon-trash'></i></button>";
        
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

if(isset($tablaOtta)){
    $url = "$pathSitioCMS/includes/ajax/ota.php";
    $sql="SELECT o.id,ot.ota,p.status_ota,ho.hotel,o.link_publicacion,o.mail_asociado,o.fecha_ultimo_pago,o.monto_adeudo,o.comision
    FROM hotel_has_ota AS o
    INNER JOIN hotel  AS ho ON o.hotel_id=ho.id
    INNER JOIN status_ota  AS p ON o.status_ota_id=p.id
    INNER JOIN ota  AS ot ON o.ota_nombre_id=ot.id";
    
    $titulo = "tabla ota";

    viewTableOta($url,$sql,$tablaOtta,$titulo,$db);

} 


//--> Inserta un nuevo registro
if(isset($action) && $action=="registrarOta"){
   $fecha= date("Y-m-d", strtotime($fecha_ultimo_pago) );
   if($monto_adeudo=='' && $comision==''){
     $monto_adeudo=0;
     $comision=0;
   }
    $sql="INSERT INTO hotel_has_ota( hotel_id, status_ota_id, link_publicacion, comentarios, usuario, clave, mail_asociado, fecha_ultimo_pago, tiene_adeudo, monto_adeudo, comision, ota_nombre_id)
     VALUES ('$hotel_id','$status_ota_id','$link_publicacion','$comentarios','$usuario','$clave','$mail_asociado','$fecha','$tiene_adudo','$monto_adeudo','$comision','$ota_nombre_id')";
     
    $cursoss = $db->prepare($sql);
  
    if($cursoss->execute()){
        echo true;
    }else{
        echo false;
    }
    
}

//--> Retorna los datos del registro a editar

if(isset($action) && $action=="EditarOta"){
    $sql="SELECT * FROM $tableOta WHERE id= $id";
    
    $cursos = $db->prepare($sql);
    
    $cursos->execute();
    $cursos = $cursos->fetchAll(PDO::FETCH_OBJ);

    echo json_encode($cursos,true);

}

//--> Actualiza el registro
if(isset($idEditarOta)){

    $fecha= date("Y-m-d", strtotime($fecha_ultimo_pago));
   $sql="UPDATE hotel_has_ota SET hotel_id = '$hotel_id', status_ota_id = '$status_ota_id', link_publicacion = '$link_publicacion', 
    comentarios = '$comentarios', usuario = '$usuario',clave = '$clave', mail_asociado = '$mail_asociado', fecha_ultimo_pago = '$fecha', 
    tiene_adeudo = '$tiene_adudo', monto_adeudo = '$monto_adeudo', comision = '$comision', ota_nombre_id = '$ota_nombre_id'
     WHERE hotel_has_ota.id = $idEditarOta"; 

     $cursos = $db->prepare($sql);
     $cursos->execute();
     if($cursos->execute()){
         echo true;
     }else{
         echo false;
     }
}
 
 //-> Elimina un ota
 if(isset($action) && $action=="deleteOta"){
     $sql="DELETE FROM $tableOta WHERE id = $idEliO";
 
     $cursos = $db->prepare($sql);
     if( $cursos->execute()){
         echo true;
     }else{
         echo false;
     }
 }