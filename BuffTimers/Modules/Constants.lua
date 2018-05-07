BuffTimers = {
  name    = 'BuffTimers',
  version = '2.18.0',
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
  [38563] = BuffTimers.GROUP_BUFF_WARHORN, -- War Horn I           #TODO: confirm AbilityId
  [46526] = BuffTimers.GROUP_BUFF_WARHORN, -- War Horn II          #TODO: confirm AbilityId
  [46528] = BuffTimers.GROUP_BUFF_WARHORN, -- War Horn III         #TODO: confirm AbilityId
  [46530] = BuffTimers.GROUP_BUFF_WARHORN, -- War Horn IV
  [40224] = BuffTimers.GROUP_BUFF_WARHORN, -- Aggressive Horn I
  [46532] = BuffTimers.GROUP_BUFF_WARHORN, -- Aggressive Horn II
  [46535] = BuffTimers.GROUP_BUFF_WARHORN, -- Aggressive Horn III
  [46538] = BuffTimers.GROUP_BUFF_WARHORN, -- Aggressive Horn IV
  [40221] = BuffTimers.GROUP_BUFF_WARHORN, -- Sturdy Horn I
  [46541] = BuffTimers.GROUP_BUFF_WARHORN, -- Sturdy Horn II
  [46544] = BuffTimers.GROUP_BUFF_WARHORN, -- Sturdy Horn III
  [46547] = BuffTimers.GROUP_BUFF_WARHORN, -- Sturdy Horn IV
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
