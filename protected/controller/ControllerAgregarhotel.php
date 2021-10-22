<?php
class ControllerAgregarhotel extends Controller
{
    function __construct($view, $conf, $var, $acc)
    {
        parent::__construct($view, $conf, $var, $acc);
    }
    public function main()
    {

        $sql="SELECT * FROM tipo_hotel";
        $this->data["tipo_hotel"]=indexModel::bd($this->conf)->getSQL($sql);
        $sql2="SELECT * FROM sitio_interes";
        $this->data["sitio_interes"]=indexModel::bd($this->conf)->getSQL($sql2);
      
        //indexModel::bd($this->conf)->controlAcceso(["1","2"]);
        $this->view->show("agregarHotel.html", $this->data, $this->accion);
    }
}
