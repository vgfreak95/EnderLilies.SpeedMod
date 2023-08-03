-- EnderLilies SpeedMod
-- author @VGFreak95
-- This is a mod that makes you go fast by pressing F2!


-- Modify this variable to change the speed of Lily according to her baseSpeeds * multiplier
local speedMultiplier = 5
local speedKey = Key.F2



local speedToggle = false

--- Change the speed of Lily according to the multiplier
function SpeedLily(multiplier)
  local lily = FindFirstOf("BP_p0000_Lily_C")
  if lily:IsValid() then
    local movement = lily.CharacterMovement
    if speedToggle then
      print("Lily is speeding...")
      movement.MaxRunSpeed = 500 * multiplier
      movement.MaxAcceleration = 2048 * multiplier
      movement.MaxWalkSpeed = 100 * multiplier

    -- Revert to default speeds
    else
      movement.MaxRunSpeed = 500
      movement.MaxAcceleration = 2048
      movement.MaxWalkSpeed = 100
      print("Stopped the toggle")
    end
  else
    print("Lily hasn't spawned yet...")
  end
end

--- Toggles the Speed Mod
function ToggleSpeed()
  print("Toggling speed..." .. tostring(speedToggle))
  speedToggle = not speedToggle
  SpeedLily(speedMultiplier)
end

RegisterKeyBind(speedKey, ToggleSpeed)
