local SQL = bLib.SQL

SQL.CreateTable("bLib_Money", "steamid TEXT", "amount NUMBER") -- name of table then the columsn i want to add, a steamid column which stores TEXT and an amount column which stores numbers

SQL.InsertValues("bLib_Money", "steamid , amount" , Entity(1):SteamID64() , 500 ) 
--[[
    bLib_Money = name of table
    "steamid , amount " = the columns you want to insert to
    Entity(1):SteamID64() = the data i want to put inside the steamid column
    500 = the data i want to put inside the amount column next to the steamid
-]]

local amount = SQL.GetValues("bLib_Money", "amount", "steamid = "..Entity(1):SteamID64() ) -- bear in mind that PLAYER.SteamID64 will return 0 in singleplayer
--[[
    this will return a table of results, or false if it did not return anything
    bLib_Money = table name
    amount = what I want to get from the database
    "steamid = Entity(1):SteamID64()" = the condition.

    basically says, give me the values from the 'amount' column where the steamid is equal to Entity(1):SteamID64(), if no results were given then return false
]]

-- now that i got my 1 piece of data from my table i dont want the table anymore, fuck that hoe

SQL.DeleteTable("bLib_Money") -- bye bye
