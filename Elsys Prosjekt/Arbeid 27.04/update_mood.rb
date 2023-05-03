def update_mood
  if State_list[0][4..6] == "001"
    only_thing
  end
  if State_list[0][4..6] == "010"
    faktisk_mgp
  end
  if State_list[0][4..6] == "011"
    rap
  end
  if State_list[0][4..6] == "100"
    latin_chords
  end
  if State_list[0][4..6] == "101"
    going_in
  end
  if State_list[0][4..6] == "000"
    sleep 0.5
  end
end

a = 0





