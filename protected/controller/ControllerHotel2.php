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

        
        //indexModel::bd($this->conf)->controlAcceso(["1","2"]);
        $this->view->show("hotel2.html", $this->data, $this->accion);
    }
}
