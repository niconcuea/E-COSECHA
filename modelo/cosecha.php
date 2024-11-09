<?php
class Cosecha {
    private $Cosecha;
    private $db;    
    private $datos;    
    //HOLA
    //yapo
    public function __construct() {
        $this->Cosecha = array();
        $this->db = new PDO('mysql:host=localhost;dbname=e-cosecha', "root", "");
    }

    public function insertar($tabla, $data) {
        $consulta = "INSERT INTO " . $tabla . " (año, activa, detalle) VALUES (:año, :activa, :detalle)";
        try {
            $stmt = $this->db->prepare($consulta);
            $stmt->bindParam(':año', $data['año']);
            $stmt->bindParam(':activa', $data['activa']);
            $stmt->bindParam(':detalle', $data['detalle']);
            return $stmt->execute();
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage() . "<br>";
            return false;
        }
    }

    public function mostrar($tabla, $condicion) {
        $consul = "SELECT * FROM " . $tabla . " WHERE " . $condicion . ";";
        $resu = $this->db->query($consul);        
        while ($filas = $resu->fetchAll(PDO::FETCH_ASSOC)) {
            $this->datos[] = $filas;
        }
        return $this->datos;
    } 

    public function actualizar($tabla, $data, $condicion) {       
        $consulta = "UPDATE " . $tabla . " SET " . $data . " WHERE " . $condicion;
        try {
            return $this->db->query($consulta);
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return false;
        }
    }

    public function eliminar($tabla, $condicion) {
        $eli = "DELETE FROM " . $tabla . " WHERE " . $condicion;
        try {
            return $this->db->query($eli);
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return false;
        }
    }

    public function hayCosechas() {
        $consulta = "SELECT COUNT(*) as total FROM cosecha";
        $resultado = $this->db->query($consulta);
        $fila = $resultado->fetch(PDO::FETCH_ASSOC);
        return $fila['total'] > 0;
    }
    
}
