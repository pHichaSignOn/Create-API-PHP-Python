<?php
// Single Data Id
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET");
header("Access-Control-Max-Age: 3600"); 
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("api_connect.php");

// ตรวจสอบว่ามีค่า id
if(isset($_GET['id'])){
 
        // รับค่าจาก GET id
        $comr_id = mysqli_real_escape_string($objConnect, $_GET['id']);
        $sql = "SELECT * FROM com_repair WHERE COMR_ID = '$comr_id' ORDER BY COMR_ID ASC";
        $result = $objConnect->query($sql);

        if($result){
                $nn = 0;
                while($row = $result->fetch_assoc()){
                        $nn++;
                        $json_data[] = array(
                                "NUMBER" => $nn,
                                "COM_TOKEN" => $row['COM_TOKEN'],
                                "DETAILS_1" => $row['DETAILS_1'],
                                "DETAILS_2" => $row['DETAILS_2'],
                                "DETAILS_3" => $row['DETAILS_3'],
                        );
                }
        }else{
                print("No Data");
        }
        // แปลง array เป็นรูปแบบ json string 
        if(isset($json_data)){
                $json = json_encode($json_data);
                echo $json;
        }else{
                $json = "No JSON";
                echo $json;
        }
}

?>