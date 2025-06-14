<?php
// Udatate Data Put
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,PUT");
header("Access-Control-Max-Age: 3600"); 
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("api_connect.php");

// รับค่าจาก PUT (รับค่า JSON)
$data = json_decode(file_get_contents("php://input"));

// ตรวจสอบ !empty
if(!empty($data->COM_TOKEN) && (!empty($data->DETAILS_1) || !empty($data->DETAILS_2) || !empty($data->DETAILS_3))
){
        // ป้องกัน SQL Injection
        $com_token = mysqli_real_escape_string($objConnect, $data->COM_TOKEN);
        $detail_1 = mysqli_real_escape_string($objConnect, $data->DETAILS_1);
        $detail_2 = mysqli_real_escape_string($objConnect, $data->DETAILS_2);
        $detail_3 = mysqli_real_escape_string($objConnect, $data->DETAILS_3);

//Update Data
$sql = "UPDATE com_repair SET DETAILS_1 = '$detail_1', DETAILS_2 = '$detail_2',DETAILS_3 = '$detail_3' WHERE COM_TOKEN = '$com_token'";
        if($objConnect->query($sql) === TRUE){
                echo json_encode(array("message"=> 'อัปเดตเรียบร้อยแล้ว.'));
        }else{
                echo json_encode(array("message"=> 'อัปเดตไม่สำเร็จ.'));
        }
}else{
        echo json_encode(array("message"=> 'input ไม่ถูกต้องอัปเดตไม่สำเร็จ.'));     
}
?>