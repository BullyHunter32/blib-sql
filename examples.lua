local SQL = bLib.SQL

SQL.CreateTable("bLib_Money", "steamid TEXT", "amount NUMBER")

SQL.InsertValues("bLib_Money", "steamid , amount" , Entity(1):SteamID64() , 500 ) 
--[[
    bLib_Money = name of table
    "steamid , amount " = the columns you want to insert
    Entity(1):SteamID64() = the data i want to put inside the steamid column
    500 = the data i want to put inside the amount column next to the steamid
-]]

