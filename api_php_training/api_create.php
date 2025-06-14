<?php
// Create Data POST

// DEl Data DELETE
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,POST");
header("Access-Control-Max-Age: 3600"); 
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("api_connect.php");

// รับค่าจาก DELETE (รับค่า JSON)
$data = json_decode(file_get_contents("php://input"));

// ตรวจสอบ !empty
if(
        !empty($data->COM_TOKEN) && 
        !empty($data->COMR_TOKEN) && 
        !empty($data->DETAILS_1) && 
        !empty($data->DETAILS_2) &&
        !empty($data->DETAILS_3)){

        // ป้องกัน SQL Injection
        $com_token = mysqli_real_escape_string($objConnect, $data->COM_TOKEN);
        $comr_token = mysqli_real_escape_string($objConnect, $data->COMR_TOKEN);
        $detail_1 = mysqli_real_escape_string($objConnect, $data->DETAILS_1);
        $detail_2 = mysqli_real_escape_string($objConnect, $data->DETAILS_2);
        $detail_3 = mysqli_real_escape_string($objConnect, $data->DETAILS_3);
        $date_detail_1 = mysqli_real_escape_string($objConnect, $data->DATE_DETAILS_1);
        $date_detail_2 = mysqli_real_escape_string($objConnect, $data->DATE_DETAILS_2);
        $date_detail_3 = mysqli_real_escape_string($objConnect, $data->DATE_DETAILS_3);
        $status_comr = mysqli_real_escape_string($objConnect, $data->STATUS_COMR);

        // SQL สำหรับ Insert ข้อมูล
        $sql = "INSERT INTO com_repair (COMR_TOKEN,COM_TOKEN,DETAILS_1,DETAILS_2,DETAILS_3,DATE_DETAILS_1,DATE_DETAILS_2,DATE_DETAILS_3,STATUS_COMR)
                VALUES ('$comr_token','$com_token','$detail_1','$detail_2','$detail_3','$date_detail_1','$date_detail_2','$date_detail_3','$status_comr')";
        if($objConnect->query($sql) === TRUE){
                echo json_encode(array("message"=> "สร้างข้อมูลสำเร๊จ"));
        }else{
                echo json_encode(array("message"=> "สร้างข้อมูลไม่สำเร๊จ"));
        }
}      
?>