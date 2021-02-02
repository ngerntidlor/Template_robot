# Keyword = ทำหน้าที่เก็บ Function หรือ ชุดคำสั่งที่เราเขียนขึ้นมาเพื่อง่ายในการงาน กรณ๊ที่ Testcase มีการเรียกใช้งาน
*** Settings ***
# Example ใช้สำหรับ Import library ,เรียกใช้ไฟล์ไหนต้องกำหนดให้ครบ และถูกต้อง [ใช้ได้สำหรับไฟล์นี้เท่านั้น]
# Library     SeleniumLibrary                                   [ต้องเขียนถูกต้อง Format ตาม framework]
# Library           RequestsLibrary
# Library           ExcelLibrary
# Library           String
# Library           Collections
# Library           BuiltIn
# Resource        ../Resource/Locator/LoginPageLocator.robot    [ใช้สำหรับเรียกไปยังไฟล์อื่น]

*** Variables ***
# Example ใช้สำหรับกำหนดตัวแปรกลางที่ทุก Keyword ไฟล์นี้สามารถเรียกใช้ได้  [ใช้ได้สำหรับไฟล์นี้เท่านั้น]
# ${timeout}        30s

*** Keywords ***
# Example ใช้สำหรับสร้าง Function หรือ Keyword เพื่อำเอาไปใช้ในส่วนของ Keyword เอง หรือ Testcase เพื่อกรณีมีการแก้ไข จะได้แก้ไขเพียงแค่ 1 จุด
# Open Browser Desktop Mode [บรรทัดนี้ >> ชื่อ Keyword]
#     [Documentation]    Open browser chrome on Web (Chrome)   [บรรทัดนี้ >> เขียนคำอธิบายของ Keyword นี้ว่าสามารถนำไปเกี่ยวกับอะไร ทำอะไร เป็นต้น]
#     [Arguments]    ${url}    ${browser}=chrome    [บรรทัดนี้ >> ตัวแปรที่ ที่ Keyword นี้ต้องรับค่าเข้ามา หรือ ถ้ามี Keyword หรือ Testcase ที่เรียกใช้จะต้องกำหนด ตัวแปรด้วย]
#     Open Browser    ${url}   ${browser}   [บรรทัดนี้ >> คำสั่งในการทำงาน อาจจะเป็นคำสั่งที่อยู่ใน Library ของ Robot framework หรือ เป็น Keyword ที่เราสร้างขึ้นมาเอง และทำการเรียกใช้ค่า]
#     Maximize Browser Window   [บรรทัดนี้ >> คำสั่งในการทำงาน อาจจะเป็นคำสั่งที่อยู่ใน Library ของ Robot framework หรือ เป็น Keyword ที่เราสร้างขึ้นมาเอง และทำการเรียกใช้ค่า]
#     Go To    ${url}    [บรรทัดนี้ >> คำสั่งในการทำงาน อาจจะเป็นคำสั่งที่อยู่ใน Library ของ Robot framework หรือ เป็น Keyword ที่เราสร้างขึ้นมาเอง และทำการเรียกใช้ค่า]


*** Standard code  ***
# Variables กรณีที่เป็นตัวแปรเรียกใช้งานให้เขียนเล็กทั้งหมด ${timeout}
# Variables เก็บ Element ${typeObject_ชื่อ}  ต้องตั้งชื่อ ไม่ซ้ำ
# Variables เก็ยดาต้า ควรต้องชื่อเป็น carmel ${UserData}
# การตั้งชื่อ Keyword ควรตั้งชื่อ ตัวแรกของคำเป็นตัวใหญ่   Open Browser
