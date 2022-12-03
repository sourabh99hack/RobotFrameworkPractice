*** Settings ***
Documentation       Data Base testing in Robot Framework
Library     DatabaseLibrary



*** Variables ***
${DBName}       robot_fr_test
${DBUser}       robot_fr_test
${DBPassword}     Le@rning9752
${DBHost}       db4free.net
${DBPort}       3306


*** Keywords ***
Connect DB
    connect to database     pymysql      ${DBName}       ${DBUser}       ${DBPassword}      ${DBHost}      ${DBPort}

Disconnect DB
    disconnect from database


*** Test Cases ***
Verify Successful creation of Table
    [documentation]     The test case verifies that user is able to create the database table successfully
    Connect DB
    ${output}=   execute sql string   CREATE TABLE Persons (PersonID int, FirstName varchar(255), Address varchar(255), city varchar(255));
    Should Be Equal As Strings  ${output}       None


Verfy Data Insertion In Table
    [documentation]     The test case verifies that the user is able to insert the data in table successfully
    ${output}=   execute sql script     ./Resources/DB Data/insert.sql
    Should Be Equal As Strings      ${output}   None


