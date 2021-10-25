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
if(isset($action) && $action=="registrarContrato"){
    $fecha=date("Y-m-d", strtotime($fecha_firma) );
    $sql=" INSERT INTO contrato (hotel_id,usuario_id,modelo_id,termino_contrato,penalizacion,tipo_contrato_id,costo_fijo,
                              distribucion_free,flat_take_rate,fecha_firma,link_carpeta)
             VALUES ('$hotel_id','$usuario_id','$modelo_id','$termino_contrato','$penalizacion','$tipo_contrato_id','$costo_fijo','$distribucion_free','$flat_take_rate','$fecha','$link_carpeta')";

        $cursoss = $db->prepare($sql);
   
     if($cursoss->execute()){
         echo true;
     }else{
         echo false;
     }
     
 }