
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


/* Funciones para la tabla empleado */
function viewTableEmpleado($url,$sql,$table,$title,$db){
    
    $cursos = $db->prepare($sql);
    $cursos->execute();
    $cursos = $cursos->fetchAll(PDO::FETCH_OBJ);
 
 
  $dataJson = '{
    "data":[';

    foreach($cursos as $key => $value){
        $botones = "<button id='editAjaxEmpleado' type='button' class='btn btn-sm btn-info' onclick='BtnEditarEmpleado($value->id)' url=$url table=$table title_modal='$title' title='Editar'><i  class='glyph-icon icon-pencil'></i></button>";
        $botones.= "<button id='removeAjaxEmpleado' type='button' class='btn btn-sm btn-danger' onclick='BtnElimanarEmpleado($value->id)' table=$table url=$url  title='Eliminar'><i class='glyph-icon icon-trash'></i></button>";
        
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

if(isset($tablaE)){
    $url = "$pathSitioCMS/includes/ajax/empleado.php";
    $sql="SELECT e.id,ho.hotel,e.empleado,e.correo,e.telefono,e.celular,e.acceso_aihms,e.maneja_ota, p.puesto,a.actividad FROM empleado AS e
    INNER JOIN hotel  AS ho ON e.hotel_id=ho.id
    INNER JOIN puesto  AS p ON e.puesto_id=p.id
    INNER JOIN actividad  AS a ON e.actividad_id=a.id";
    
    $titulo = "empleados";

    viewTableEmpleado($url,$sql,$tablaE,$titulo,$db);

} 

//--> Inserta un nuevo registro
if(isset($action) && $action=="registrarEmpleado"){
    $sql="INSERT INTO empleado( hotel_id, empleado, correo, telefono, celular, acceso_aihms, maneja_ota, actividad_id, puesto_id)
     VALUES ('$hotel_id','$empleado','$correo','$telefono','$celular','$acceso_aihms','$maneja_ota','$actividad_id','$puesto_id')";
    $cursoss = $db->prepare($sql);
  
    if($cursoss->execute()){
        echo true;
    }else{
        echo false;
    }
    
}

//--> Retorna los datos del registro a editar

if(isset($action) && $action=="EditarEmpleado"){
    $sql="SELECT * FROM $tableEmple WHERE id= $id";
    
    $cursos = $db->prepare($sql);
    
    $cursos->execute();
    $cursos = $cursos->fetchAll(PDO::FETCH_OBJ);

    echo json_encode($cursos,true);

}
//--> Actualiza el registro
if(isset($idEditarEm)){

   $sql=" UPDATE empleado SET hotel_id=$hotel_id,empleado='$empleado',
    correo='$correo',telefono='$telefono',celular='$celular',acceso_aihms='$acceso_aihms',
    maneja_ota='$maneja_ota',actividad_id='$actividad_id',puesto_id='$puesto_id' WHERE id = $idEditarEm";

    $cursos = $db->prepare($sql);
    $cursos->execute();
    if($cursos->execute()){
        echo true;
    }else{
        echo false;
    }
}

//-> Elimina un curso
if(isset($action) && $action=="deleteEmpl"){
    $sql="DELETE FROM $tableEmpleDe WHERE id = $idElimi";

    $cursos = $db->prepare($sql);
    if( $cursos->execute()){
        echo true;
    }else{
        echo false;
    }
}