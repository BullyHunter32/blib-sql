bLib = bLib or {}

-- if u rebrand this im gonna uppercut ur nut
-- kind regards,
-- BullyHunter#5877

-- the sql plugin uses this func here
function bLib:MsgC( txt )
    if SERVER then
        return MsgC(Color(255,69,255), "[bLib][Server] ", Color(255,255,255), txt .. "\n" )
    else
        return MsgC(Color(255,69,255), "[bLib][Client] ", Color(255,255,255), txt .. "\n" )
    end
end
-- now to the sql...

bLib.SQL = {}
local SQL = bLib.SQL
local sql = sql
function SQL.CreateTable( name , ... ) 
    local forcecreate = forcecreate or false
    local params = ""
    local tbl = {...}
    for k , v in ipairs(tbl) do
        params = params .. v
        if k ~= #tbl then
            params = params .. ", "
        end
    end
    sql.Query(("CREATE TABLE IF NOT EXISTS %s( ".. params .. " )"):format( name ))
    bLib:MsgC(("Created new SQL Table\n\tCreated table %s with params( ".. params .. " )"):format( name ))
end

function SQL.InsertValues( name , curparams , ... )
    local params = ""
    local tbl = {...}
    for k , v in ipairs(tbl) do
        params = params .. v
        if k ~= #tbl then
            params = params .. ", "
        end
    end
    sql.Query(("INSERT INTO %s( ".. curparams .. " ) VALUES( %s )"):format( name , params ))
    bLib:MsgC(("Inserted values into SQL Table\n\tInsered into %s, values( %s )"):format( name , params ))
end

function SQL.DeleteTable( name )
    sql.Query("DROP TABLE ".. name )
    bLib:MsgC(("Deleted SQL Table\n\tRemoved %s"):format( name ))
end

function SQL.GetValues( name , what , ... )
    local where = ""
    local tbl = {...}
    for k , v in ipairs(tbl) do
        where = where .. v
        if k ~= #tbl then
            where = where .. " AND "
        end
    end
    local q = sql.Query(("SELECT %s FROM %s WHERE %s "):format(what,name,where)) or false
    bLib:MsgC(("Retrieved values from %s\n\tReturned %s"):format( name, type( q ) ))
    if type(q) == "table" then
        PrintTable( q , 1 )
    end
    return q
end
