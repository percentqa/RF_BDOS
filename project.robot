*** Settings ***
Library           Selenium2Library
Library           Collections

*** Test Cases ***
window
    Open Browser    http://www.baidu.com    chrome
    Maximize Browser Window
    Input Text    kw    马云
    Click Element    su
    sleep    2s
    #点击一条搜索结果后会打开一个新的窗口 （这里点击第一条）
    Click Element    //*[@id="1"]/div/div[1]/a/img
    sleep    2s
    #获得窗口的title
    ${titles}    Get Window Titles
    ${titles2}    Get From List    ${titles}    1
    ${titles1}    Get From List    ${titles}    0
    #切换到第二个窗口
    Select Window    title=${titles2}
    #在这里可以对新打开的窗口进行操作。。。
    #切换回第一个窗口，即搜索页面的250.那个窗口
    Select Window    title=${titles1}
    #在这里可以对第一个搜索窗口进行操作。。。
    #只会关闭当前的窗口，即第一个搜索窗口
    Close Window

打开BD-OS
    Open Browser    http://bdosdowell.com    chrome    ##打开浏览器
    Maximize Browser Window
    sleep    3
    input Text    id=username    superadmin    ##输入用户名
    input Password    id=password    jupiter123    ##输入密码
    input Text    id=authcode    1
    click button    id=login    \    ##登录系统
    sleep    10

project center
    click element    xpath=//*[@id="header"]/ul/li[6]/a/span    \    ##打开项目中心
    input Text    xpath=//*[@id="body"]/div/div[1]/input    lizuohua1    ##输入搜索内容
    sleep    5
    click Element    xpath=//*[@id="body"]/div/div[1]/button    \    ##点击搜索框后面的“查询”按钮
    sleep    3
    Selenium2Library.executeJavascript    window.location.reload();    \    ##刷新浏览器页面
    sleep    2
    Click Element    xpath=//*[@id="body"]/div/div[2]/div/div[1]/table/tbody/tr[2]/td[7]/div/a[1]    \    ##点击“编辑”按钮
    sleep    2
    Double Click Element    xpath=/html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[2]/div[2]/input    ##清空输入框中的内容
    Press Key    xpath=/html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[2]/div[2]/input    \\8
    input text    xpath=/html/body/div[3]/div/div[2]/div/div/div[2]/div/form/div[2]/div[2]/input    test01
    Click Button    xpath=/html/body/div[3]/div/div[2]/div/div/div[2]/div/div/button[1]    \    ##点击“提交按钮
    sleep    2
    Click Element    xpath=//*[@id="body"]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[7]/div/a[2]    \    ##点击“设为默认项目”按钮
    sleep    3
    Click Element    xpath=//*[@id="body"]/div/div[2]/div/div[1]/table/tbody/tr[4]/td[7]/div/a[3]    \    ##点击“删除”按钮
    sleep    3
    Click Element    xpath=/html/body/div[4]/div/div[2]/div/div/div[2]/div[2]/div/button[2]/span
