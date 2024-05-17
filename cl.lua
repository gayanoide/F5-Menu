RegisterKeyMapping('EmyF5', 'Ouvrir le menu Personel', 'keyboard', 'F5')
local lib = exports.ox_lib



lib:registerContext({
    id = 'persomenu',
    title = 'Menu Personnel \n\n Votre ID : '..GetPlayerServerId(PlayerId()),
    options = {
      {
        title = 'GPS rapide',
        description = 'un endroit ou aller ?',
        menu = 'gps_menu',
      },
      {
        title = 'Mes factures', 
        description = 'Payer mes factures',
        onSelect = function()
            --ESX.ShowNotification("~y~ca fonctionne")
            TriggerEvent("okokBilling:ToggleMyInvoices")
        end,
      },
      {
        title = 'Menu Vehicule',
        description = 'Gestion de votre vehicule!',
        menu = 'vehicle_menu',
      },
      {
        title = 'Parametre',
        description = 'Quelque parametre que vous pouvez faire!',
        menu = 'settings_menu',
      },
    }
})







lib:registerContext({
    id = 'gps_menu',
    title = 'GPS',
    menu = 'some_menu1',
    onBack = function()
      --print('Went back!')
    end,
    options = {
      {
        title = Config.lspd.titre,
        description = Config.lspd.desc,      
        image = Config.lspd.image,
        progress = '25',      
        onSelect = function()
            --ESX.ShowNotification("~y~ca fonctionne")
            SetNewWaypoint( -376.32, -234.98, 35.81)
        end,
      },
      {        
        title = Config.sams.titre,
        description = Config.sams.desc,      
        image = Config.sams.image,
        progress = '50',      
        onSelect = function()
            --ESX.ShowNotification("~y~ca fonctionne")
            SetNewWaypoint( 297.89, -583.92, 43.26)
        end,
      },
      {
        title = Config.safd.titre,
        description = Config.safd.desc,      
        image = Config.safd.image,
        progress = '75',      
        onSelect = function()
            --ESX.ShowNotification("~y~ca fonctionne")
            SetNewWaypoint( -660.84, -75.86, 38.59)
        end,
      },
      {
        title = Config.bcso.titre,
        description = Config.bcso.desc,      
        image = Config.bcso.image,
        progress = '100',      
        onSelect = function()
            --ESX.ShowNotification("~y~ca fonctionne")
            SetNewWaypoint( -440.68, 6019.19, 31.49)
        end,
      },
    }
})






lib:registerContext({
  id = 'vehicle_menu',
  title = 'Parametre',
  menu = 'some_menu3',
  onBack = function()
    --print('Went back!')
  end,
  options = {
    {
      title = 'Eteindre le moteur',
      onSelect = function() 
        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId()), false, false, true)
        SetVehicleUndriveable(GetVehiclePedIsIn(PlayerPedId()), false)
      end,
    },
    {
      title = 'Passer en Conducteur',
      onSelect = function() 
        SetPedIntoVehicle(plyPed, plyVehicle, -1)
      end,
    },
    {
      title = 'Gestion des clefs',
      description = 'Menu pour preter / donner les clef de vehicules',
      onSelect = function() 
        
      end,
    }
  }
})







lib:registerContext({
    id = 'settings_menu',
    title = 'Parametre',
    menu = 'some_menu2',
    onBack = function()
      --print('Went back!')
    end,
    options = {
        --[[
      {
        title = 'Activer le mode Cinema',
        onSelect = function()    
            TriggerEvent('es:setMoneyDisplay', 0.0)
            TriggerEvent('esx_status:setDisplay', 0.0)
            TriggerEvent('esx:pauseMenuActive', 0.0)
        end,
      },
      {
        title = 'Desactiver le mode Cinema',
        onSelect = function()    
            TriggerEvent('es:setMoneyDisplay', 1.0)
            TriggerEvent('esx_status:setDisplay', 1.0)
            TriggerEvent('esx:pauseMenuActive', 1.0)
        end,
      },
      ]]--
      {
        title = 'Config HUD',
        onSelect = function()
            ExecuteCommand("hudsettings")
        end,
      },
      {
        title = 'Config Notification',
        onSelect = function()
            ExecuteCommand("notifysettings")
        end,
      },
      --{
      --  title = 'Mode Editor',
      --  onSelect = function()
      --      ExecuteCommand("stream")
      --  end,
      --}
    }
})










































RegisterNetEvent('EmyF5', function(args)
    lib:registerContext({
      id = 'EmyF5',
      title = 'Event menu',
      menu = 'persomenu',
      options = {
        {
          title = 'Event value: '..args.someValue,
        }
    }
})
   
lib:showContext('EmyF5')
end)

RegisterCommand('EmyF5', function()
   lib:showContext('persomenu')
end)