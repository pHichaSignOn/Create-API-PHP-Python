<?php
date_default_timezone_set("Asia/Bangkok");
$objConnect = mysqli_connect("localhost","root","","com_repair");
$objConnect->query("SET NAMES 'utf8' COLLATE 'utf8_unicode_ci'"); 
if (mysqli_connect_errno()){
        echo "เชื่อมต่อฐานข้อมูลไม่สำเร็จ: " . mysqli_connect_errno();
}else{
        // echo "เชื่อมต่อฐานข้อมูลเรียบร้อยแล้ว";
}
?>
