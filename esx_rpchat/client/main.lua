RegisterNetEvent('esx_rpchat:sendMe')
AddEventHandler('esx_rpchat:sendMe', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:yellow">ME</i></i> | {0} -> {1}</div>',
        args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendDo')
AddEventHandler('esx_rpchat:sendDo', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
		template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:#66ccff">DO</i></i> | {0} -> {1}</div>',
        args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendDo2')
AddEventHandler('esx_rpchat:sendDo2', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:#66ccff">DOC</i></i> | {0} -> {1}</div>',
	  args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('esx_rpchat:sendLocalOOC')
AddEventHandler('esx_rpchat:sendLocalOOC', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.40vw; margin: 0.05vw; background-color: rgba(0, 0, 255, 0.0); border-radius: 12px;"><i class=""><i style="color:yellow">HR????</i></i> | {0} -> {1}</div>',
        args = { title, message }
    })
	end
  end
end)

RegisterNetEvent('esx_rpchat:getCoords')
AddEventHandler('esx_rpchat:getCoords', function(player)
	local ped = PlayerPedId()
    local coords = GetEntityCoords(ped, false)
    local heading = GetEntityHeading(ped)

    local message = tostring("X: " .. coords.x .. " Y: " .. coords.y .. " Z: " .. coords.z .. " HEADING: " .. heading)
    TriggerServerEvent('esx_rpchat:showCoord', player, message)

end)

Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/tweet',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/anontwt',  _U('anontwt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/ooc', _U('ooc_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/news', 'Glob??lna inform??cia z frakcie Weazel News (iba pre redaktorov)',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/inzerat', 'odoslanie inzer??tu - stoj?? 250$!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/police', 'Ozn??menie pol??cie - len pre pol??ciu!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  TriggerEvent('chat:addSuggestion', '/ens', 'Ozn??men?? Ambulance - pro ems!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
  --TriggerEvent('chat:addSuggestion', '/sheriff', 'Ozn??menie Sheriff - pro sheriffy!',   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	--TriggerEvent('chat:addSuggestion', '/gps', 'Zobraz?? v??m va??u aktu??lnu poz??ciu (s??radnice XYZ a smer poh??adu)')
	TriggerEvent('chat:addSuggestion', '/doc', 'Napise za vas proces napriklad /doc 1/10 (max 100)', { { name = 'pocet', help = 'pocet opakovani' } } )
  --if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' then
  	--TriggerEvent('chat:addSuggestion', '/bm',   _U('bm_prefix'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		--TriggerEvent('chat:removeSuggestion', '/tweet')
		--TriggerEvent('chat:removeSuggestion', '/me')
		--TriggerEvent('chat:removeSuggestion', '/do')
    TriggerEvent('chat:removeSuggestion', '/bm')
    TriggerEvent('chat:removeSuggestion', '/rk')
    TriggerEvent('chat:removeSuggestion', '/rukojmi')
    TriggerEvent('chat:removeSuggestion', '/nazada')
    TriggerEvent('chat:removeSuggestion', '/narameno')
    TriggerEvent('chat:removeSuggestion', '/givecar')
    TriggerEvent('chat:removeSuggestion', '/givecarplate')
	--	TriggerEvent('chat:removeSuggestion', '/news')
		--TriggerEvent('chat:removeSuggestion', '/inzerat')
		TriggerEvent('chat:removeSuggestion', '/gps')
		--*TriggerEvent('chat:removeSuggestion', '/doc')
	end
end)