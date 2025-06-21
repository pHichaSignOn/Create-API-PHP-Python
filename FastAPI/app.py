# โค้ดนี้คือ ตัวอย่างระบบ CRUD (Create, Read, Update, Delete)
# สำหรับตาราง device ใน MySQL โดยใช้ FastAPI (Python Framework) เชื่อมต่อฐานข้อมูลผ่าน mysql-connector-python

from fastapi import FastAPI  # Framework FastAPI สำหรับสร้าง API
import mysql.connector  # ใช้เชื่อม MySQL
from pydantic import BaseModel  # ใช้สำหรับตรวจสอบ และรับข้อมูล JSON
from dotenv import load_dotenv  # โหลดไฟล์ .env เพื่อเก็บ config
import os  # ใช้เรียกค่าจาก environment variable (.env)

load_dotenv()  # โหลด .env จาก root directory


# Step 2
def get_db_connection():
    connect = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASS"),
        database=os.getenv("DB_DATABASE"),
    )
    return connect


app = FastAPI()


# Step 1 ทดสอบ (GET)
@app.get("/")
def read_root():
    return {"Hello": "Hello World"}


@app.get("/cat")
def read_cat():
    return {"Hello": "Cat"}


@app.get("/items/{id}")
def read_items(id: int):
    return {"imems": id}


# Step 2 อ่านข้อมูลทั้งหมด (GET)
@app.get("/device")
def get_device():
    connect = get_db_connection()
    cursor = connect.cursor()
    query = "SELECT * FROM device"
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    connect.close()

    device = []
    for row in rows:
        device.append(
            {"DEVICE_ID": row[0], "DEVICE_CODE": row[1], "DEVICE_NAME": row[2]}
        )
    return device


# Step 3 เพิ่มข้อมูล (POST)
class Device(BaseModel):
    DEVICE_CODE: int
    DEVICE_NAME: str


@app.post("/device")
def create_device(device: Device):
    connect = get_db_connection()
    cursor = connect.cursor()
    query = """
    INSERT INTO device (DEVICE_CODE, DEVICE_NAME)   
    VALUES (%s, %s)  
    """

    cursor.execute(query, (device.DEVICE_CODE, device.DEVICE_NAME))

    connect.commit()
    DEVICE_ID = cursor.lastrowid
    cursor.close()
    connect.close()

    return {"id": DEVICE_ID}


# Step 4 ลบข้อมูล (DELETE)
@app.delete("/device/{device_id}")
def delete_device(device_id: int):
    connect = get_db_connection()
    cursor = connect.cursor()

    # ตรวจสอบ device_id
    select_query = "SELECT * FROM device WHERE DEVICE_ID = %s"
    cursor.execute(select_query, (device_id,))
    result = cursor.fetchone()

    # ไม่พบ device_id
    if result is None:
        cursor.close()
        connect.close()
        return {"error": "ไม่พบ device_id"}
    # พบ device_id
    delete_query = "DELETE FROM device WHERE DEVICE_ID = %s"
    cursor.execute(delete_query, (device_id,))
    connect.commit()

    cursor.close()
    connect.close()
    return {"message": f"DEVICE_ID {device_id} ลบข้อมูลสำเร็จ"}


# Step 5 อัปเดตข้อมูล (PUT)
@app.put("/device/{device_id}")
def update_device(device_id: int, device: Device):
    connect = get_db_connection()
    cursor = connect.cursor()

    # ตรวจสอบ device มีหรือไม่
    select_query = "SELECT * FROM device WHERE DEVICE_ID = %s"
    cursor.execute(select_query, (device_id,))
    result = cursor.fetchone()

    if result is None:
        cursor.close()
        connect.close()
        return {"error": "ไม่พบ Device"}

    # อัปเดตย้อมูล
    update_query = """
       UPDATE device
       SET DEVICE_CODE = %s, DEVICE_NAME = %s
       WHERE DEVICE_ID = %s
    """
    cursor.execute(update_query, (device.DEVICE_CODE, device.DEVICE_NAME, device_id))
    connect.commit()

    cursor.close()
    connect.close()
    return {"message": f"Device_ID {device_id} อัปเดตเรียบร้อยแล้ว"}
