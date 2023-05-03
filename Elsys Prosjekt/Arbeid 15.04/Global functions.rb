define :detect_MIDI do
  Prev_state_list = State_list.dup
  for i in 1..8 do
    state1, state2 = sync "/midi:arduino_micro_0:#{i}/note_on"
    state1 = state1.to_s(2)
    state2 = state2.to_s(2)
    while state1.length != States_length do
      state1 = "0" + state1
    end
    while state2.length != States_length do
      state2 =  "0" + state2
    end
    State_list[i-1] = state1 + state2
  end
end

def drum_chooser
  sync :change_inst #Wait untill the tracker gives it the signal to continue
  if State_list[Current_section][10..12] == "001"
    four_on_floor
  elsif State_list[Current_section][10..12] == "010"
    latin_drums
  elsif State_list[Current_section][10..12] == "011"
    rock_drums
  elsif State_list[Current_section][10..12] == "100"
    slow_drums
  elsif State_list[Current_section][10..12] == "101"
    clap_drums
  else
    sync :change
  end
end

#This function detects if there are any changes to the States_list
#Returns true if this is the case. Else it returns false,
#it also cues ":change" witch signifies that there has been a change
def detect_change
  if State_list == Prev_state_list
    return false
  else
    cue :change
    return true
  end
end


#A function that determins if the song should be played or not.
#Returns true if it should play, falseif not
def play_song
  #The song should only play if the play bit is "1" and all boxes are placed in their slots
  if State_list[0][0] == "1" && all_boxes_on
    return true
  else
    return false
  end
end

#A function that detects if all boxes are place in their slots.
#Returns true if that is the case. Returns false if one or more boxes are removed from their slot
def all_boxes_on
  #Checks if any of the instrument boxes are removed. "000" idicates that there is no box there.
  for i in 1..3
    if State_list[i][0..2] == "000" || State_list[i][3..5] == "000" || State_list[i][7..9] == "000" || State_list[i][10..12] == "000"
      return false
    end
  end
  if State_list[0][4..6] == "000"
    return false
  end
  return true
end

#A function that increases the beat counter
define :increase_beat do
  Current_beat = Beat_ring[Beat_idx]
  Beat_idx += 1
  print "Current Beat", Current_beat
end

#Increases the section counter
define :next_section do
  Sec_idx += 1
  Beat_idx = 1
  Current_beat = 1
  Current_section = Section_ring[Sec_idx]
  print "Current Section: ", Current_section
end

#Pauses the song
define :pause_play do
  if !play_song
    Beat_idx = 0
    Sec_idx -= 1
    #Current_section = Current_section - 1
  end
end

#Returns true of the song should loop a section. False else
define :should_loop do
  print State_list[0][1]
  if State_list[0][1] == "1"
    return true
  else
    return false
  end
end

#Returns true if the song should skipforward a section. False else.
define :should_skip do
  if State_list[0][2] == "1"
    return true
  else
    return false
  end
end

#Returns true if the song should skip backwards. False else.
define :should_back do
  if State_list[0][3] == "1"
    return true
  else
    return false
  end
end

#Skips the song forward one section if the requierments are met.
define :skip_forward do
  if should_skip
    Sec_idx +=1
    Current_section = Section_ring[Sec_idx]
    Beat_idx = 0
    Current_beat = Beat_ring[0]
  end
end

#Skips the song backward to the start section if the requierments are met.
#Skips one section back if at start of section
define :skip_backward do
  if should_back && Current_beat > 2
    Beat_idx = 0
    Current_beat = Beat_ring[0]
    Sec_idx -=1
  elsif should_back && Current_beat <= 2
    Beat_idx = 0
    Current_beat = Beat_ring[0]
    Sec_idx -=2
  end
end
