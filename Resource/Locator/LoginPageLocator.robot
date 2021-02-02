#Locator ทำหน้าที่ในการเก็บต้วแปร ของ Element บนหน้า Web
*** Variables ***
${txt_username}    //input[@id="susername"]
${txt_password}    //input[@id="spassword"]
${btn_userlogin}    //button[@id="btnLogin"]
${btn_viewprofile}    //button[@class="viewProfile"]
${txt_viewprofile}    //input[@id="textsearch"]


*** Standard code  ***
# Variables กรณีที่เป็นตัวแปรเรียกใช้งานให้เขียนเล็กทั้งหมด ${timeout}
# Variables เก็บ Element ${typeObject_ชื่อ}  ต้องตั้งชื่อ ไม่ซ้ำ
# Variables เก็ยดาต้า ควรต้องชื่อเป็น carmel ${UserData}
# การตั้งชื่อ Keyword ควรตั้งชื่อ ตัวแรกของคำเป็นตัวใหญ่   Open Browser
