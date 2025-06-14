<?php
// All Data POST
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,POST");
header("Access-Control-Max-Age: 3600"); 
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("api_connect.php");

$sql = "SELECT COM_TOKEN,DETAILS_1,DETAILS_2,DETAILS_3 FROM com_repair ORDER BY COMR_ID ASC";
$result = $objConnect->query($sql);
if($result){
        $nn = '0';
        while($row = $result->fetch_assoc()){
                $nn = $nn + '1';
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
        $json = json_encode($json_data);  //แปลงข้อมูล Array เป็น JSON 
        echo $json;      
}  
?>