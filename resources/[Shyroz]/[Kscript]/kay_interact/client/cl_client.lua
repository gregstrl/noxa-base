--==============================================================
-- kay_interact (client) – version clean
--==============================================================

-- ------------------------------
-- Key codes (FiveM controls)
-- ------------------------------
local KEY = {
  A = 34, B = 29, C = 26, D = 30, E = 46, F = 49, G = 47, H = 74,
  K = 311, L = 7, M = 244, N = 249, P = 199, Q = 44, R = 45, S = 33,
  T = 245, U = 303, V = 0, W = 32, X = 73, Y = 246, Z = 20,

  UpArr = 27, DownArr = 173, LeftArr = 174, RightArr = 175,

  LAlt = 19, F11 = 344,

  NUM1 = 157, NUM2 = 158, NUM3 = 160, NUM4 = 164, NUM5 = 165,
  NUM6 = 159, NUM7 = 161, NUM8 = 162, NUM9 = 163,

  LShift = 21, ESC = 322, F1 = 288, F2 = 289, F3 = 170, F5 = 166,
  F6 = 167, F7 = 168, F8 = 169, F9 = 56, F10 = 57,

  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164,
  ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163,
  ["-"] = 84, ["="] = 83,

  BACKSPACE = 177, TAB = 37, ["]"] = 40, ENTER = 18, CAPS = 137,
  LEFTSHIFT = 21, [","] = 82, ["."] = 81, LEFTCTRL = 36, LEFTALT = 19,
  SPACE = 22, RIGHTCTRL = 70, HOME = 213, PAGEUP = 10, PAGEDOWN = 11,
  DELETE = 178, LEFT = 174, RIGHT = 175, TOP = 27, DOWN = 173,

  NENTER = 201, N4 = 108, N5 = 60, N6 = 107, ["N+"] = 96, ["N-"] = 97,
  N7 = 117, N8 = 61, N9 = 118
}

-- ------------------------------
-- State
-- ------------------------------
local pointsById      = {}        -- [id] = point
local idsByResource   = {}        -- [resourceName] = { id1, id2, ... }
local nextId          = 1

-- DUI / Sprite
local duiObj          = nil       -- dui handle from CreateDui
local txdName         = nil       -- runtime txd name
local txnName         = nil       -- runtime texture name

-- Global toggle (false = actif, true = désactivé) pour compatibilité API existante
local isGloballyDisabled = false

--==============================================================
-- DUI initialisation (une seule fois)
--==============================================================
local function initializeDui()
  if duiObj then return end

  local screenW, screenH = GetActiveScreenResolution()
  local url = ("https://cfx-nui-%s/web/index.html"):format(GetCurrentResourceName())

  duiObj = CreateDui(url, screenW, screenH)
  local duiHandle = GetDuiHandle(duiObj)

  txdName = "dui_global_txd"
  txnName = "dui_global_txt"

  local txd = CreateRuntimeTxd(txdName)
  CreateRuntimeTextureFromDuiHandle(txd, txnName, duiHandle)

  RequestStreamedTextureDict(txdName)
  while not HasStreamedTextureDictLoaded(txdName) do
    Wait(0)
  end
end

--==============================================================
-- API: Créer un point d'interaction
--   opts = {
--     coords = vector3,
--     heading = number?,
--     ped = hashOrModelName?,         -- ex: `joaat("s_m_y_cop_01")` ou "s_m_y_cop_01"
--     scenario = string?,             -- ex: "WORLD_HUMAN_COP_IDLES"
--     dist = number? (default 2.0),
--     key = string?  (default "E", clé dans KEY),
--     message = string? (affiché via DUI),
--     icon = string? (affiché via DUI),
--     onPress = function() end        -- Fonction callback (peut ne pas fonctionner via exports)
--     onPressEvent = string?          -- NOUVEAU: Nom d'événement à trigger au lieu de fonction
--     eventArgs = table?              -- NOUVEAU: Arguments à passer à l'événement
--   }
-- Retourne: id numérique
--==============================================================
local function addInteractionPoint(opts)
  initializeDui()

  local invoking = GetInvokingResource()
  local id = nextId
  nextId = nextId + 1

  opts.id     = id
  opts.active = false
  pointsById[id] = opts

  idsByResource[invoking] = idsByResource[invoking] or {}
  table.insert(idsByResource[invoking], id)

  -- Crée le ped associé (optionnel)
  if opts.ped then
    CreateThread(function()
      local pedModel = opts.ped
      if type(pedModel) == "string" then
        pedModel = GetHashKey(pedModel)
      end

      RequestModel(pedModel)
      while not HasModelLoaded(pedModel) do
        Wait(0)
      end

      local ped = CreatePed(
        4,                      -- pedType
        pedModel,               -- model hash
        opts.coords.x, opts.coords.y, opts.coords.z,
        opts.heading or 0.0,
        false, true
      )
      opts.pedEntity = ped

      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      FreezeEntityPosition(ped, true)

      if opts.scenario then
        TaskStartScenarioInPlace(ped, opts.scenario, 0, true)
      end
    end)
  end

  return id
end

--==============================================================
-- API: Supprimer un point d’interaction via son id
--==============================================================
local function removeInteractionPoint(id)
  local p = pointsById[id]
  if not p then return end

  if p.pedEntity and DoesEntityExist(p.pedEntity) then
    DeleteEntity(p.pedEntity)
  end

  pointsById[id] = nil
end

--==============================================================
-- API: (Export) Activer/Désactiver globalement le système
--   SetActive(true)  -> active l’interaction
--   SetActive(false) -> désactive l’interaction
-- (Pour compatibilité avec ton code original: on stocke l’inverse)
--==============================================================
local function SetActive(enabled)
  isGloballyDisabled = not enabled
end

--==============================================================
-- Nettoyage auto quand une ressource s’arrête
--==============================================================
AddEventHandler("onResourceStop", function(resName)
  local ids = idsByResource[resName]
  if not ids then return end

  for _, id in ipairs(ids) do
    removeInteractionPoint(id)
  end
  idsByResource[resName] = nil
end)

--==============================================================
-- NUI: callback "close" (si utilisé par ta page web)
--==============================================================
RegisterNUICallback("close", function(_, cb)
  Wait(500)
  cb("ok")
end)

--==============================================================
-- Boucle principale d’interaction / affichage
--==============================================================
CreateThread(function()
  while true do
    local sleep = 1000

    if not isGloballyDisabled then
      -- debug léger: nombre de points vivants
      -- print("[kay_interact] points actifs=" .. tostring((function() local c=0 for _ in pairs(pointsById) do c=c+1 end return c end)()))
      local ped = PlayerPedId()
      local pos = GetEntityCoords(ped)
      local nearest = nil

      for _, p in pairs(pointsById) do
        local dist = #(pos - p.coords)
        if not nearest or dist < nearest then nearest = dist end

        local maxDist = p.dist or 2.0
        if dist < maxDist then
          sleep = 0

          -- Ouverture (une seule fois tant qu'on reste dans la zone)
          if not p.active then
            p.active = true
            -- print("[kay_interact] open point id=" .. tostring(p.id))
            SendDuiMessage(duiObj, json.encode({
              type = "open",
              message = p.message,
              key = p.key,
              icon = p.icon
            }))
          end

          -- Détection touche
          local keyCode = KEY[p.key or "E"]
          if keyCode and IsControlJustPressed(0, keyCode) then
            -- NOUVEAU: Support des événements (prioritaire sur les fonctions)
            if p.onPressEvent then
              -- Trigger l'événement avec les arguments fournis
              if p.eventArgs then
                TriggerEvent(p.onPressEvent, table.unpack(p.eventArgs))
              else
                TriggerEvent(p.onPressEvent)
              end
              -- print("[kay_interact] key pressed for id=" .. tostring(p.id) .. " -> event " .. tostring(p.onPressEvent))
            elseif type(p.onPress) == "function" then
              -- Fallback sur fonction callback (peut ne pas marcher via exports)
              p.onPress()
            end
            SendDuiMessage(duiObj, json.encode({ type = "keyPressed" }))
          end

          -- Dessin du sprite au-dessus (offset si ped)
          local offsetZ = p.ped and 1.0 or 0.0
          SetDrawOrigin(p.coords.x, p.coords.y, p.coords.z + offsetZ, 0)
          DrawSprite(txdName, txnName, 0.0, 0.0, 0.5, 0.5, 0.0, 255, 255, 255, 255)
          ClearDrawOrigin()
        else
          -- Sortie de zone -> fermeture
          if p.active then
            p.active = false
            -- print("[kay_interact] close point id=" .. tostring(p.id))
            SendDuiMessage(duiObj, json.encode({ type = "close" }))
          end
        end
      end

      -- LOD de la boucle selon distance la plus proche
      if sleep ~= 0 then
        if nearest and nearest <= 50.0 then
          sleep = 0
        elseif nearest and nearest <= 100.0 then
          sleep = 50
        else
          sleep = 150
        end
      end
    end

    Wait(sleep)
  end
end)

--==============================================================
-- Exports
--==============================================================
exports("addInteractionPoint", addInteractionPoint)
exports("removeInteractionPoint", removeInteractionPoint)
exports("SetActive", SetActive)
