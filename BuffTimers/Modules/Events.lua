BuffTimers.eventUpdateActive = false

function BuffTimers.EventAddOnLoaded(event, addonName)
  if addonName == BuffTimers.name then
    EVENT_MANAGER:UnregisterForEvent(BuffTimers.name, EVENT_ADD_ON_LOADED)
    BuffTimers:SettingsLoad()
    BuffTimers:SettingsBuildMenu()
    BuffTimers:WindowInitialize()
    if BuffTimers.settings.notification.enable then
      BuffTimers:NotificationInitialize()
    end
    EVENT_MANAGER:RegisterForEvent(BuffTimers.name, EVENT_EFFECT_CHANGED, BuffTimers.EventEffectChanged)
  end
end

function BuffTimers.EventEffectChanged(eventCode, changeType, effectSlot, effectName, unitTag, beginTime, endTime, stackCount, iconName, buffType, effectType, abilityType, statusEffectType, unitName, unitId, abilityId, sourceType)
  local barNumber
  if sourceType == COMBAT_UNIT_TYPE_PLAYER then
    if BuffTimers.debug then
      BuffTimers:DebugEvent(changeType, effectName, beginTime, endTime, abilityId)
    end
    if changeType == EFFECT_RESULT_GAINED then
      barNumber = BuffTimers.settings.buffNames[effectName]
      if barNumber then
        BuffTimers:WindowStart(barNumber, beginTime, endTime, iconName)
      end
      barNumber = BuffTimers.groupBuffsAbilityId[abilityId]
      if barNumber then
        BuffTimers:WindowStartGroupBuff(barNumber, beginTime, endTime)
      end
    end
  end
  if sourceType == COMBAT_UNIT_TYPE_GROUP then
    if changeType == EFFECT_RESULT_GAINED then
      barNumber = BuffTimers.groupBuffsAbilityId[abilityId]
      if barNumber then
        BuffTimers:WindowStartGroupBuff(barNumber, beginTime, endTime)
      end
    end
  end
end

function BuffTimers.EventUpdate()
  for k, v in pairs(BuffTimers.activeBars) do
    BuffTimers:WindowRefresh(k, v)
  end
  if BuffTimers.settings.notification.enable then
    BuffTimers:NotificationRefresh()
  end
  if (#BuffTimers.notifications == 0) and (table.maxn(BuffTimers.activeBars) == 0) then
    EVENT_MANAGER:UnregisterForUpdate(BuffTimers.name)
    BuffTimers.eventUpdateActive = false
  end
end
