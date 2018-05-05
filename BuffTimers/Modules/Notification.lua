BuffTimers.notifications = {}
BuffTimers.notificationStored = {}

function BuffTimers:NotificationInitialize()
  if self.settings.notification.enable then
    self:NotificationCreate()
    self:NotificationApplySettings()
  end
end

function BuffTimers:NotificationApplySettings()
  if self.settings.notification.enable then
    self.notification:ClearAnchors()
    self.notification:SetAnchor(TOP, GuiRoot, TOPLEFT, self.settings.notification.offset.x, self.settings.notification.offset.y)
    self.notification:SetMovable(not self.settings.notification.locked)
    self.notification:SetMouseEnabled(not self.settings.notification.locked)
    self.notification.label:SetColor(unpack(self.settings.notification.color))
  end
end

function BuffTimers:NotificationCreate()
  if self.settings.notification.enable then
    self.notification = WINDOW_MANAGER:CreateTopLevelWindow('BuffTimersNotification')
    self.notification:SetHandler('OnMoveStop', function() self:NotificationMoved() end)
    if self.settings.notification.offset.x == 0 then
      self.notification:SetAnchor(CENTER, GuiRoot, CENTER, 0, -100)
      self.settings.notification.offset.x = self.notification:GetLeft()
      self.settings.notification.offset.y = self.notification:GetTop()
      self.notification:ClearAnchors()
    end
    self.notification:SetClampedToScreen(true)
    self.notification:SetResizeToFitDescendents(true)

    self.notification.label = WINDOW_MANAGER:CreateControl('$(parent)Label', self.notification, CT_LABEL)
    self.notification.label:SetAnchor(TOP, self.notification, TOP, 0,0)
    self.notification.label:SetVerticalAlignment(1)
    self.notification.label:SetHorizontalAlignment(1)
    self.notification.label:SetFont('ZoFontCallout3')
  end
end

function BuffTimers:NotificationMoved()
  if self.settings.notification.enable then
    self.settings.notification.offset.x = self.notification:GetLeft() + (self.notification:GetWidth() / 2)
    self.settings.notification.offset.y = self.notification:GetTop()
  end
end

function BuffTimers:NotificationPush(barNumber, endTime)
  if self.settings.notification.enable then
    local nofiticationData
    if barNumber > self.settings.numberBars then
      nofiticationData = self.settings.groupBuffData[barNumber]
    else
      nofiticationData = self.settings.barData[barNumber]
    end
    if (endTime - GetFrameTimeSeconds()) < nofiticationData.notification.threshold then
      if not self.notificationStored[barNumber] then
        self.notificationStored[barNumber] = true
        PlaySound(nofiticationData.notification.sound)
        if nofiticationData.notification.text then
          local text = ''
          local time = GetFrameTimeSeconds() + self.settings.notification.duration
          if nofiticationData.notification.customText == "" then
            text = nofiticationData.buffName
          else
            text = nofiticationData.notification.customText
          end
          table.insert(self.notifications, {text, time})
        end
      end
    end
  end
end

function BuffTimers:NotificationRefresh()
  if self.settings.notification.enable then
    while (#self.notifications > 0) and (self.notifications[1][2] < GetFrameTimeSeconds()) do
      table.remove(self.notifications, 1)
    end
    if #self.notifications > 0 then
      local text = {}
      for i=1, #self.notifications do
        table.insert(text, self.notifications[i][1])
      end
      self.notification.label:SetText(table.concat(text, "\n"))
      self.notification:SetHidden(false)
    else
      self.notification:SetHidden(self.settings.notification.locked)
    end
  end
end
