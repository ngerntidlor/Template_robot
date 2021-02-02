# Testcase ทำหน้าที่ในการเก็บ Testcase โดยอาจจะแบ่งตาม Module หรือ Feature ของ Filename Testcase โดยควรเอา Test step จาก Test case มาเขียน
*** setting ***
# Example ใช้สำหรับ Import library ,เรียกใช้ไฟล์ไหนต้องกำหนดให้ครบ และถูกต้อง [ใช้ได้สำหรับไฟล์นี้เท่านั้น]
Library             ExcelLibrary
Library             Collections
Library             SeleniumLibrary   
Resource            ../Keyword/CommonKeyword.robot  #  [ใช้สำหรับเรียกไปยังไฟล์อื่น]
Suite Setup         Open Browser Desktop Mode    https://uat.areegator.com/login  # [ใช้สำหรับสั่งให้ทำงานก่อนจพ รันเทสเคสในไฟล์นี้]
Test setup          Open Browser Desktop Mode    https://uat.areegator.com/login   # [ใช้สำหรับสั่งให้ทำงานก่อนจะ รันเทสเคสโดย ทุกเคสจะต้องรัน Test setpup ทุกครั้ง]
Suite Teardown      Close All Browsers          # [ใช้สำหรับสั่งให้ทำงานหลังจาก รันเทสเคสทั้งหมดในไฟล์จบแล้ว]
Test Teardown       Close All Browsers          # [ใช้สำหรับสั่งให้ทำงานหลังจาก รันเทสเคสนั้นๆจบแล้ว]

***Variables***
# Example ใช้สำหรับกำหนดตัวแปรกลางที่ทุก Keyword ไฟล์นี้สามารถเรียกใช้ได้  [ใช้ได้สำหรับไฟล์นี้เท่านั้น]
# ${timeout}        30s
# ${file_path}    ${CURDIR}${/}Resource${/}uat${/}TestData${/}PrepareDate    

*** test case ***
# Test case คือ ข้อที่เราจะเทส ซึ่งต้องประกอบไปด้วย Step การทำงานต้องสอดคล้องกับใน Test case ที่เขียน เพื่อสามารถ Tracking ได้
# Test case ที่ควรทำคือ ต้องสามารถตรวจสอบ หรืออาจจะบได้ภายในข้อเดียวกัน ควรเป็น Test case ที่ทำการ Test manual มาแล้ว
TC_aree_010_01_01     # Testcase ID จาก File Testcase ที่ทำ Manual Test
    [Documentation]   Login Areegator web   # เขียนอธิบาย รายละเอียดของ Test Case 
    [Tags]    UAT    SP010    Login    # เอา Tag ที่เขียนใน Testcase มาแปะ  Tag มีความหมายว่า ข้อนี้ทำเกี่ยวกับอะไร, ทำที่ Sprint เท่าไร , Feature อะไร, Regression (สื่งที่สามารุถ Tag ได้จากในนี้ )
#  Test step
    Open Browser Desktop Mode    https://uat.areegator.com/login   # Step การทำงาน โดยระบบจะแสดง จะดึง Keyword หรือ wording ของ Library มาใช้งาน แต่อย่าลืมวว่าต้องระบุ Library ที่ Setting ด้วย
    Input Username On Login Page    Kanokb25
    Input Password On Login Page    kanok12345
    Click Button Login On Areegator Admin
    
TC_aree_010_01_02     #Testcase ID จาก File Testcase ที่ทำ Manual Test
    # Go to    https://uat.areegator.com/login
    [Documentation]   Login Areegator web   # เขียนอธิบาย รายละเอียดของ Test Case 
    [Tags]    UAT    SP010    Login    # เอา Tag ที่เขียนใน Testcase มาแปะ  Tag มีความหมายว่า ข้อนี้ทำเกี่ยวกับอะไร, ทำที่ Sprint เท่าไร , Feature อะไร , Status testcase ,Regression เป็นต้น (สิ่งที่สามารุถ Tag ได้จากในนี้ )
    Click Element On Page    //div[@id="InsuranceSales"]




























***Keywords***
Read Excel For Prepare Data
    [Documentation]    Read data from excel file (.xlsx)
    ${file_path}    Get File Path For PrepareData
    #${AllTestData}    ReadAllTestData   Y:${/}Areegator New Project${/}QA${/}PrepareDate${/}Renew.xlsx    New Requirement
    ${AllTestData}    ReadAllTestData   ${file_path}${/}Renew.xlsx    New Requirement
    Log List    ${AllTestData}
    Set Global Variable     ${AllTestData}
    Open Browser Desktop Mode    ${url_admin}     #headlesschrome    
    Login On Areegator Web    ${user_admin}    ${password_admin}
    Click To Special Quote Menu


Insurance Detail
    [Documentation]    For Prepare data Renew
    [Arguments]    ${AllDataInsurance}     
  
    Click To Insurance Premium Menu
    ${SearchAgentStatus}    Search And Select Agent Profile    ${AllDataInsurance[0]}
    Return From Keyword If    '${SearchAgentStatus}' == 'True'   #BuiltIn.  #ถ้าคีเวิดนี้เป็นจริงจะไม่ทำข้างล่างต่อ
    Insert Data Special Quote For Renew    ${AllDataInsurance}

Insert Data Special Quote For Renew
    [Documentation]    Go to the Track Customer Tab then input data for tracking customer
    [Arguments]    ${AllDataInsurance}
    Click Continue Button
    Input First Name                        ${AllDataInsurance[1]}      ${AllDataInsurance[2]}
    Input Last Name                         ${AllDataInsurance[2]}
    Input Mobile Phone                      ${AllDataInsurance[3]}
    Input Car Prefix                        ${AllDataInsurance[4]}
    Input Car License No                    ${AllDataInsurance[5]}
    Select Value On Quote Type Special      ${AllDataInsurance[6]}     ${AllDataInsurance[9]}
    Search And Select PropertieID           ${AllDataInsurance[9]}     ${AllDataInsurance[7]}    
    Select Value On Car PropertieID         ${AllDataInsurance[9]}
    Click Continue Button
    Check Car Prefix Car License No Duplicate      ${AllDataInsurance}  
    
Check Car Prefix Car License No Duplicate
    [Documentation]    For Prepare data Renew
    [Arguments]    ${AllDataInsurance}
    ${SearchDuplicate}    Check Prefix Car License No Duplicate    ${AllDataInsurance}
    Return From Keyword If   '${SearchDuplicate}' == 'True'   #${SearchDuplicate}==${TRUE}    #ถ้าคีเวิดนี้เป็นจริงจะไม่ทำข้างล่างต่อ
    Insert Data Special Quote         ${AllDataInsurance}
    #Write Excel Cell	    row_num=   col_num=     value=     sheet_name=None
    #Save Excel Document  	filename=${file_path}${/}Renew.xlsx	


Insert Data Special Quote   
    [Arguments]     ${AllDataInsurance}
    Select Value On Car Brand               ${AllDataInsurance[10]}   
    Select Value On Car Model               ${AllDataInsurance[11]}
    Select Value On Car Year                ${AllDataInsurance[7]}      ${AllDataInsurance[13]}     
    Select Value On Car Sub Model           ${AllDataInsurance[12]}
    Select Radio on Driver                  ${AllDataInsurance[14]}     ${AllDataInsurance[15]}
    Select Value On Car Province            ${AllDataInsurance[16]}
    Select Claim Type                       ${AllDataInsurance[19]}
    Select Radio with Payment               ${AllDataInsurance[17]}     ${AllDataInsurance[18]}
    Select Expired Insurance                ${AllDataInsurance[39]}  
    Select Value On Insurance Company       ${AllDataInsurance[21]}
    Select Insurance Type Special           ${AllDataInsurance[7]}      ${AllDataInsurance}    ${AllDataInsurance[22]}    
    Verify Create Purchase Order Is Success


Select Radio On Insurance Class 1
    [Documentation]    Select radio in insurance class 1st
    [Arguments]    ${AllDataInsurance}
    Radio For Select Insurance Type             ${AllDataInsurance[22]}
    # Check List To Extra Service                 ${AllDataInsurance[7]}
    Check List To Extra Service Clear           ${AllDataInsurance}
    Verify Contain Text                         ${InsPrice}    20s
    Input Price For Other Life Person           ${AllDataInsurance[25]}
    Input Price For Other Life Person Event     ${AllDataInsurance[26]}
    Input Price For Other Asset                 ${AllDataInsurance[27]}
    Input Price For External Excess             ${AllDataInsurance[23]}
    Input Price For Owner Auto Coverage         ${AllDataInsurance[28]}
    Input Price For Excess                      ${AllDataInsurance[24]}
    Input Price For Owner Fire Coverage         ${AllDataInsurance[29]}
    Input Price For Owner Accident              ${AllDataInsurance[30]}
    Input Price For Owner Accident Driver       ${AllDataInsurance[31]}
    Input Price For Owner Accident Follower     ${AllDataInsurance[32]}
    Input Price For Owner Hospital Fee          ${AllDataInsurance[33]}
    Input Price For Owner Hospital Fee Driver   ${AllDataInsurance[34]}
    Input Price For Owner Hospital Fee Follower    ${AllDataInsurance[35]}
    Input Price For Owner Driver Quity Fee      ${AllDataInsurance[36]}
    ${AllDataInsurance[37]}    Convert To String    ${AllDataInsurance[37]} 
    Input Price For Insurance Premium               ${AllDataInsurance[37]}

Select Radio On Insurance Class 2 Plus
    [Documentation]    Select radio in insurance class 2nd
    [Arguments]    ${AllDataInsurance}
    Radio For Select Insurance Type             ${AllDataInsurance[22]}
    # Check List To Extra Service                 ${AllDataInsurance[7]}
    Check List To Extra Service Clear           ${AllDataInsurance}
    Verify Contain Text                         ${InsPrice}    20s
    Input Price For Other Life Person           ${AllDataInsurance[25]}
    Input Price For Other Life Person Event     ${AllDataInsurance[26]}
    Input Price For Other Asset                 ${AllDataInsurance[27]}
    Input Price For External Excess             ${AllDataInsurance[23]}
    Input Price For Owner Auto Coverage         ${AllDataInsurance[28]}
    Input Price For Excess                      ${AllDataInsurance[24]}
    Input Price For Owner Fire Coverage         ${AllDataInsurance[29]}
    Input Price For Owner Accident              ${AllDataInsurance[30]}
    Input Price For Owner Accident Driver       ${AllDataInsurance[31]}
    Input Price For Owner Accident Follower     ${AllDataInsurance[32]}
    Input Price For Owner Hospital Fee          ${AllDataInsurance[33]}
    Input Price For Owner Hospital Fee Driver   ${AllDataInsurance[34]}
    Input Price For Owner Hospital Fee Follower    ${AllDataInsurance[35]}
    Input Price For Owner Driver Quity Fee      ${AllDataInsurance[36]}
    ${AllDataInsurance[37]}    Convert To String    ${AllDataInsurance[37]} 
    Input Price For Insurance Premium               ${AllDataInsurance[37]}

Select Radio On Insurance Class 2
    [Documentation]    Select radio in insurance class 2nd
    [Arguments]    ${AllDataInsurance}
    Radio For Select Insurance Type             ${AllDataInsurance[22]}
    #Check List To Extra Service                 ${AllDataInsurance[7]}
    Check List To Extra Service Clear           ${AllDataInsurance}
    Verify Contain Text                         ${InsPrice}    20s
    Input Price For Other Life Person           ${AllDataInsurance[25]}
    Input Price For Other Life Person Event     ${AllDataInsurance[26]}
    Input Price For Other Asset                 ${AllDataInsurance[27]}
    Input Price For External Excess             ${AllDataInsurance[23]}
    #Input Price For Owner Auto Coverage         ${AllDataInsurance[28]}
    Input Price For Excess                      ${AllDataInsurance[24]}
    Input Price For Owner Fire Coverage         ${AllDataInsurance[29]}
    Input Price For Owner Accident              ${AllDataInsurance[30]}
    Input Price For Owner Accident Driver       ${AllDataInsurance[31]}
    Input Price For Owner Accident Follower     ${AllDataInsurance[32]}
    Input Price For Owner Hospital Fee          ${AllDataInsurance[33]}
    Input Price For Owner Hospital Fee Driver   ${AllDataInsurance[34]}
    Input Price For Owner Hospital Fee Follower    ${AllDataInsurance[35]}
    Input Price For Owner Driver Quity Fee      ${AllDataInsurance[36]}
    ${AllDataInsurance[37]}    Convert To String    ${AllDataInsurance[37]} 
    Input Price For Insurance Premium               ${AllDataInsurance[37]}

Select Radio On Insurance Class 3 Plus
    [Documentation]    Select radio in insurance class 3rd plus
    [Arguments]    ${AllDataInsurance}
    Radio For Select Insurance Type             ${AllDataInsurance[22]}
    # Check List To Extra Service                 ${AllDataInsurance[7]}
    Check List To Extra Service Clear           ${AllDataInsurance}
    Verify Contain Text                         ${InsPrice}    20s
    Input Price For Other Life Person           ${AllDataInsurance[25]}
    Input Price For Other Life Person Event     ${AllDataInsurance[26]}
    Input Price For Other Asset                 ${AllDataInsurance[27]}
    Input Price For External Excess             ${AllDataInsurance[23]}
    Input Price For Owner Auto Coverage         ${AllDataInsurance[28]}
    Input Price For Excess                      ${AllDataInsurance[24]}
    #Input Price For Owner Fire Coverage         ${AllDataInsurance[29]}
    Input Price For Owner Accident              ${AllDataInsurance[30]}
    Input Price For Owner Accident Driver       ${AllDataInsurance[31]}
    Input Price For Owner Accident Follower     ${AllDataInsurance[32]}
    Input Price For Owner Hospital Fee          ${AllDataInsurance[33]}
    Input Price For Owner Hospital Fee Driver   ${AllDataInsurance[34]}
    Input Price For Owner Hospital Fee Follower    ${AllDataInsurance[35]}
    Input Price For Owner Driver Quity Fee      ${AllDataInsurance[36]}
    ${AllDataInsurance[37]}    Convert To String    ${AllDataInsurance[37]} 
    Input Price For Insurance Premium               ${AllDataInsurance[37]}

Select Radio On Insurance Class 3
    [Documentation]    Select radio in insurance class 3rd
    [Arguments]    ${AllDataInsurance}
    Radio For Select Insurance Type             ${AllDataInsurance[22]}
    # Check List To Extra Service                 ${AllDataInsurance[7]}
    Check List To Extra Service Clear           ${AllDataInsurance}
    Verify Contain Text                         ${InsPrice}    20s
    Input Price For Other Life Person           ${AllDataInsurance[25]}
    Input Price For Other Life Person Event     ${AllDataInsurance[26]}
    Input Price For Other Asset                 ${AllDataInsurance[27]}
    Input Price For External Excess             ${AllDataInsurance[23]}
    #Input Price For Owner Auto Coverage         ${AllDataInsurance[28]}
    Input Price For Excess                      ${AllDataInsurance[24]}
    #Input Price For Owner Fire Coverage         ${AllDataInsurance[29]}
    Input Price For Owner Accident              ${AllDataInsurance[30]}
    Input Price For Owner Accident Driver       ${AllDataInsurance[31]}
    Input Price For Owner Accident Follower     ${AllDataInsurance[32]}
    Input Price For Owner Hospital Fee          ${AllDataInsurance[33]}
    Input Price For Owner Hospital Fee Driver   ${AllDataInsurance[34]}
    Input Price For Owner Hospital Fee Follower    ${AllDataInsurance[35]}
    Input Price For Owner Driver Quity Fee      ${AllDataInsurance[36]}
    ${AllDataInsurance[37]}    Convert To String    ${AllDataInsurance[37]} 
    Input Price For Insurance Premium               ${AllDataInsurance[37]}



Select Radio On Insurance one
    [Documentation]    Select radio in insurance class 11st
    [Arguments]    ${AllDataInsurance}   
    Radio For Select Insurance Type             ${AllDataInsurance[22]}
    #Verify Car TypeID                          ${AllDataInsurance[7]} 
    Check List To Extra Service Clear           ${AllDataInsurance}
    Verify Contain Text                         ${InsPrice}    20s
    Input Price For Other Life Person           ${AllDataInsurance[25]}
    Input Price For Other Life Person Event     ${AllDataInsurance[26]}
    Input Price For Other Asset                 ${AllDataInsurance[27]}
    Input Price For External Excess             ${AllDataInsurance[23]}
    Input Price For Owner Auto Coverage         ${AllDataInsurance[28]}
    Input Price For Excess                      ${AllDataInsurance[24]}
    Input Price For Owner Fire Coverage         ${AllDataInsurance[29]}
    #Input Price For Owner Accident              ${AllDataInsurance[30]}
    #Input Price For Owner Accident Driver       ${AllDataInsurance[31]}
    #Input Price For Owner Accident Follower     ${AllDataInsurance[32]}
    #Input Price For Owner Hospital Fee          ${AllDataInsurance[33]}
    #Input Price For Owner Hospital Fee Driver   ${AllDataInsurance[34]}
    #Input Price For Owner Hospital Fee Follower    ${AllDataInsurance[35]}
    #Input Price For Owner Driver Quity Fee      ${AllDataInsurance[36]}
    ${AllDataInsurance[37]}    Convert To String    ${AllDataInsurance[37]} 
    Input Price For Insurance Premium               ${AllDataInsurance[37]}


Select Radio On Insurance TwoPlus
    [Documentation]    Select radio in insurance class 2+st
    [Arguments]    ${AllDataInsurance}   
    Radio For Select Insurance Type             ${AllDataInsurance[22]}
    #Verify Car TypeID                           ${AllDataInsurance[7]}
    Check List To Extra Service Clear           ${AllDataInsurance}
    Verify Contain Text                         ${InsPrice}    20s
    Input Price For Other Life Person           ${AllDataInsurance[25]}
    Input Price For Other Life Person Event     ${AllDataInsurance[26]}
    Input Price For Other Asset                 ${AllDataInsurance[27]}
    Input Price For External Excess             ${AllDataInsurance[23]}
    Input Price For Owner Auto Coverage         ${AllDataInsurance[28]}
    Input Price For Excess                      ${AllDataInsurance[24]}
    Input Price For Owner Fire Coverage         ${AllDataInsurance[29]}
    #Input Price For Owner Accident              ${AllDataInsurance[30]}
    #Input Price For Owner Accident Driver       ${AllDataInsurance[31]}
    #Input Price For Owner Accident Follower     ${AllDataInsurance[32]}
    #Input Price For Owner Hospital Fee          ${AllDataInsurance[33]}
    #Input Price For Owner Hospital Fee Driver   ${AllDataInsurance[34]}
    #Input Price For Owner Hospital Fee Follower    ${AllDataInsurance[35]}
    #Input Price For Owner Driver Quity Fee      ${AllDataInsurance[36]}
    ${AllDataInsurance[37]}    Convert To String    ${AllDataInsurance[37]} 
    Input Price For Insurance Premium               ${AllDataInsurance[37]}








