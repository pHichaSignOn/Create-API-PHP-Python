<?php
// DEl Data DELETE
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,DELETE");
header("Access-Control-Max-Age: 3600"); 
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("api_connect.php");

// รับค่าจาก DELETE (รับค่า JSON)
$data = json_decode(file_get_contents("php://input"));

// ตรวจสอบ !empty
if(!empty($data->COM_TOKEN)){
        // ป้องกัน SQL Injection
                $com_token = mysqli_real_escape_string($objConnect, $data->COM_TOKEN);
        // ตรวจสอบ COM_TOKEN มีจริงมั้ย
                $sql_check = "SELECT COM_TOKEN FROM com_repair WHERE COM_TOKEN = '$com_token'";
                $result = $objConnect->query($sql_check);
                        if($result->num_rows > 0){
                        //Delete Data
                                $sql = "DELETE FROM com_repair WHERE COM_TOKEN = '$com_token'";
                                if($objConnect->query($sql) === TRUE){
                                        echo json_encode(array("message"=> 'ลบข้อมูลเรียบร้อยแล้ว.'));
                                }else{
                                        echo json_encode(array("message"=> 'ลบข้อมูลไม่สำเร็จ.'));
                                }
                        }else{
                                echo json_encode(array("message"=> 'ลบข้อมูลไม่สำเร็จ ไม่พบ TOKEN นี้.'));
                        }

}else{
        echo json_encode(array("message"=> 'input ไม่ถูกต้องลบข้อมูลไม่สำเร็จ.'));     
}
?>