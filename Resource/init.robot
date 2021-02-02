# ห้ามลบ เพราะ เป็นตัวดึงข้อมูลของ ENV เวลาRun 
*** Settings ***
Resource    ../Resource/Configuration/${ENV}/ServerConfig.robot
Resource    ../Resource/Configuration/${ENV}/UserData.robot.robot
Resource    ../Keyword/Common/CommonKeyword.robot


*** Variables ***
${ENV}   UAT
