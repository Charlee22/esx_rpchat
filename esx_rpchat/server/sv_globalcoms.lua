ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- GPS command
RegisterCommand('gps', function(source, args, raw)
 TriggerClientEvent('esx_rpchat:getCoords', source, source);
end)

RegisterServerEvent('esx_rpchat:showCoord')
AddEventHandler('esx_rpchat:showCoord', function(source, msg)
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:#00ff00">GPS</i></i> | {0}</div>',
        args = { msg }
    })
end)

AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()

    if Config.EnableESXIdentity then name = GetCharacterName(source) end

    TriggerClientEvent('esx_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
  end
end)

RegisterCommand('ozn', function(source,args,raw)
  local xPlayer = ESX.GetPlayerFromId(source)
     local toSay = ''
        for i=1,#args do
     toSay = toSay .. args[i] .. ' ' 
   end  
   if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.45vw; margin: 0.15vw; background-color: rgba(204, 0, 0, 0.9); border-radius: 8px;"><i class="fas fa-bullhorn"></i>  Oznámení: {0}</div>',
        args = { toSay }
    })
  end
end,false)

RegisterCommand('police', function(source, args, rawCommand)
      local xPlayer = ESX.GetPlayerFromId(source)
      local toSay = ''
         for i=1,#args do
      toSay = toSay .. args[i] .. ' ' -- Concats two strings together
    end
  
      if xPlayer.job.name == 'police' then 
      TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:blue">POLICE</i></i> | {0}</div>',
            args = {toSay}
        })
    else 
      TriggerClientEvent('chat:addMessage', source, {
        template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:red">ERROR</i></i> | Musíš pracovat u policie aby jsi mohl použivať přikaz /police</div>',
        args = {}
      })
    end
end, false)

RegisterCommand('sheriff', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = ''
      for i=1,#args do
    toSay = toSay .. args[i] .. ' ' -- Concats two strings together
  end

    if xPlayer.job.name == 'shriff' then 
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:#cc6600">SHRIFF</i></i> | {0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:red">ERROR</i></i> | Musíš pracovat u sheriffu aby jsi mohl použivať přikaz /shriff</div>',
      args = {}
    })
  end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local toSay = ''
      for i=1,#args do
    toSay = toSay .. args[i] .. ' ' -- Concats two strings together
  end

    if xPlayer.job.name == 'ambulance' then 
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:#ff0066">EMS</i></i> | {0}</div>',
          args = {toSay}
      })
  else 
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:red">ERROR</i></i> | Musíš pracovat u ems aby jsi mohl použivať přikaz /ems</div>',
      args = {}
    })
  end
end, false)

RegisterCommand('ad', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local characterName = GetCharacterName(source)
    local phoneNumber = GetCharacterPhoneNumber(source)
    local toSay = ''
        for i=1,#args do
      toSay = toSay .. args[i] .. ' ' -- Concats two strings together
    end

    if xPlayer.get('money') >= 250 then
      TriggerClientEvent('chat:addMessage', -1, {
          template = '<div style="padding: 0.3vw 0.8vw; margin: 0.5vw 0.5vw 0.5vw 0; border-radius:10px; background-color: rgba(67,142,94, 0.6); border-radius: 5px;"><strong style="font-size: 11pt;">[Inzerát] {0} (tel.č: {1}):</strong><br><p style="padding-top: .3vw">{2}</p></div>',
            args = { characterName, phoneNumber, toSay }
        })

      xPlayer.removeMoney(250)

      TriggerClientEvent('chat:addMessage', source, {
        template = '^0[^1PLATBA^0] Za inzerát ste zaplatili 250$',
        args = {}
      })

    else 
      TriggerClientEvent('chat:addMessage', source, {
        template = '^0[^1VAROVANIE^0] Nemáte dostatok financií na zaplatenie inzerátu (250$)',
        args = {}
      })
    end
end, false)


RegisterCommand('me', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendMe', -1, source, name, args, { 255, 0, 0 })
  TriggerClientEvent('3dme:triggerDisplay', -1, args, source)
end)

RegisterCommand('do', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end

  TriggerClientEvent('esx_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
  TriggerClientEvent('3ddo:triggerDisplay', -1, args, source)
end)

-- /DOC COMMAND
RegisterCommand('doc', function(source, args, raw)
  if source == 0 then
    print('esx_rpchat: you can\'t use this command from rcon!')
    return
  end
  if args == nil then
  print('source .. args .. rawCommand')
  return
  end
  args = table.concat(args, ' ')
  local name = GetPlayerName(source)
  if Config.EnableESXIdentity then name = GetCharacterName(source) end
  local counter_doc = 0
  local pocetOpakovani = tonumber(args)
  if pocetOpakovani < 21 then
    while counter_doc < pocetOpakovani do
        counter_doc = counter_doc + 1 
        TriggerClientEvent('esx_rpchat:sendDo2', -1, source, name, counter_doc .. "/" .. pocetOpakovani , { 255, 198, 0 })
        TriggerClientEvent('3ddo2:triggerDisplay', -1, counter_doc .. "/" .. pocetOpakovani, source)
        Citizen.Wait(2000)
    end 
  end
end)