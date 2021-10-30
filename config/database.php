<?php
class Database{
  
    // specify your own database credentials
    private $host = "localhost";//"hostingmysql324.amen.fr";
    private $db_name = "lasaintebible_db";
    private $username = "saintebibleuser";
    private $password = "l@SA1nt3Eibl3";
    public $conn;
  
    // get the database connection
    public function getConnection(){
  
        $this->conn = null;
  
        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
  
        return $this->conn;
    }
}
?>