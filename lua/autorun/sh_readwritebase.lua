local _rwb=[[
______               _ _    _      _ _      ______                
| ___ \             | | |  | |    (_) |     | ___ \               
| |_/ /___  __ _  __| | |  | |_ __ _| |_ ___| |_/ / __ _ ___  ___ 
|    // _ \/ _` |/ _` | |/\| | '__| | __/ _ \ ___ \/ _` / __|/ _ \
| |\ \  __/ (_| | (_| \  /\  / |  | | ||  __/ |_/ / (_| \__ \  __/
\_| \_\___|\__,_|\__,_|\/  \/|_|  |_|\__\___\____/ \__,_|___/\___|

 Easy Tool For Loading and Saving Table & Array Data into Files
 ______________________________________________________________
 --------------------------------------------------------------
By Reism # https://steamcommunity.com/profiles/76561198097203962/

]]


ReadWriteBase = ReadWriteBase or {}
RWB = RWB or {}

ReadWriteBase.Core = ReadWriteBase.Core or {}

--[ Writebase Core Functios ] --
ReadWriteBase.Core.Read = _G.file.Read
ReadWriteBase.Core.Write = _G.file.Write
ReadWriteBase.Core.Valid = _G.file.Exists
ReadWriteBase.Core.Format_JTT = _G.util.JSONToTable
ReadWriteBase.Core.Format_TTJ = _G.util.TableToJSON
ReadWriteBase.Core.Data_Compress = _G.util.Compress
ReadWriteBase.Core.Data_Decompress = _G.util.Decompress

function ReadWriteBase.WriteData( file, data )              -- // Write Data
    if !type(data) == "table" then return end
    local WriteData = tostring( ReadWriteBase["Core"].Data_Compress( ReadWriteBase["Core"].Format_TTJ(data, true) ) )
    ReadWriteBase["Core"].Write( file, WriteData )
end

function ReadWriteBase.ReadData( file,  directory )         -- // Read Data
    if !ReadWriteBase["Core"].Valid( file, directory ) then return nil end
    local data = ReadWriteBase["Core"].Data_Decompress( ReadWriteBase["Core"].Read( file, directory ) )
    local results = ReadWriteBase["Core"].Format_JTT( data )
    return results
end


ReadWriteBase.ReadFile = ReadWriteBase.ReadData
ReadWriteBase.WriteFile = ReadWriteBase.WriteData

RWB.ReadFile = ReadWriteBase.ReadData
RWB.WriteFile = ReadWriteBase.WriteData
RWB.ReadData = ReadWriteBase.ReadData
RWB.WriteData = ReadWriteBase.WriteData

print(_rwb)
