BuffTimers = {
  name    = 'BuffTimers',
  version = '2.18.6',
  author  = 'coolmodi, Uta',
}

BuffTimers.activeBars = {}

BuffTimers.defaultBarData = {
  buffName        = '',
  offset          = {x=200, y=150},
  locked          = false,
  alwaysShow      = true,
  width           = 200,
  height          = 30,
  textSize        = 20,
  reverse         = false,
  colorBar        = {1,0,0,1,0,1,0,1},
  colorEdge       = {0,0,0,1},
  colorBackground = {0.2,0.2,0.2,0.4},
  icon            = {show = true, size = 30, texture = '', customIcon = false, customIconTexture = ''},
  notification    = {threshold = 2, sound = 'none', text = true, customText = ''},
}

BuffTimers.targetEffectTypes = {
  [EFFECT_RESULT_GAINED]  = true,
  [EFFECT_RESULT_UPDATED] = true,
}

BuffTimers.acceptFadeAbilityId = {
  [21007] = true, -- Reflective Scale
  [21014] = true, -- Reflective Plate
  [21017] = true, -- Dragon Fire Scale
  [24574] = true, -- Defensive Rune
  [46327] = true, -- Crystal Fragments Proc
  [79089] = true, -- Varen's Wall
}

BuffTimers.GROUP_BUFF_WARHORN = 21
BuffTimers.GROUP_BUFF_ALKOSH  = 22
BuffTimers.groupBuffs = {
  [1] = {
    name        = 'Alkosh',
    barNumber   = BuffTimers.GROUP_BUFF_ALKOSH,
    iconTexture = '/esoui/art/icons/gear_dromathra_medium_head_a.dds',
  },
  [2] = {
    name        = 'Warhorn',
    barNumber   = BuffTimers.GROUP_BUFF_WARHORN,
    iconTexture = '/esoui/art/icons/ability_ava_003.dds',
  },
}
BuffTimers.groupBuffsAbilityId = {
  [38564] = BuffTimers.GROUP_BUFF_WARHORN, -- War Horn
  [40221] = BuffTimers.GROUP_BUFF_WARHORN, -- Sturdy Horn
  [40224] = BuffTimers.GROUP_BUFF_WARHORN, -- Aggressive Horn
  [76667] = BuffTimers.GROUP_BUFF_ALKOSH,  -- Roar of Alkosh
}

BuffTimers.sounds = {
  'none',
  'Emperor_Coronated_Aldmeri',
  'Emperor_Abdicated',
  'General_Alert_Error',
  'New_Notification',
  'Console_Game_Enter',  
  'Console_Character_Click',
  'Achievement_Awarded',
  'Money_Transact',
  'Lockpicking_lockpick_broke',
  'Lockpicking_force',
  'Voice_Chat_Menu_Channel_Joined',
  'Voice_Chat_Menu_Channel_Left',
  'Voice_Chat_Menu_Channel_Made_Active',
  'Justice_NowKOS',
  'Justice_StateChanged',
  'Justice_NoLongerKOS',
  'Justice_PickpocketBonus',
  'Justice_PickpocketFailed',
}
