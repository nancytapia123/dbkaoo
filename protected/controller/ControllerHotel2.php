<?php

class ControllerHotel2 extends Controller
{
    function __construct($view, $conf, $var, $acc)
    {
        parent::__construct($view, $conf, $var, $acc);
    }
    public function main()
    {

        $sql="SELECT * FROM hotel";
        $this->data["hoteles"]=indexModel::bd($this->conf)->getSQL($sql);

        $this->data["actividad"]=indexModel::bd($this->conf)->getSQL("SELECT * FROM actividad");
        $this->data["puesto"]=indexModel::bd($this->conf)->getSQL("SELECT * FROM puesto");
        $this->data["ota"]=indexModel::bd($this->conf)->getSQL("SELECT * FROM ota");
        $this->data["status_ota"]=indexModel::bd($this->conf)->getSQL("SELECT * FROM status_ota");
        $sql="SELECT id, hotel FROM hotel WHERE id=".$_COOKIE["idHotel"];
        $this->data["hotel"]=indexModel::bd($this->conf)->getSQL($sql)[0];
      
        
        //indexModel::bd($this->conf)->controlAcceso(["1","2"]);
        $this->view->show("hotel2.html", $this->data, $this->accion);
    }
}
