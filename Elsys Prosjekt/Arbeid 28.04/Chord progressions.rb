live_loop :chords do
  w = 4.0
  h = w/2.0
  h_ = h*1.5
  q = h/2.0
  q_ = q*1.5
  e = q/2.0
  e_ = e*1.5
  s = e/2.0
  #print State_list[Current_section]
  chord_thread = in_thread do
    print [Current_section][4..6]
    loop do
      if State_list[Current_section][4..6] == "001" #Latin Chords
        chord_list=[[chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), w], [chord(:Eb, :M), h], [chord(:G, :M), h],[chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), h], [chord(:G, :M), h], [chord(:C , :m), w]]
        chord_player(chord_list)
      elsif State_list[Current_section][4..6] == "010" #Going Inn
        chord_list = [[chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:Gs, :M), w], [chord(:D, :M), h], [chord(:Bs, :M), h], [chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:F, :m), w], [chord(:F, :M), h], [chord(:A, :M), h]]
        chord_player(chord_list)
      elsif State_list[Current_section][4..6] == "011" #Only Thing
        chord_list = [[chord(:Cs, :m), w],[chord(:B, :M), w],[chord(:A, :M), h],[chord(:B, :M), h],[chord(:Gs, :m), w]]
        chord_player(chord_list)
      elsif State_list[Current_section][4..6] == "100" #Faktisk MGP
        chord_list = [[chord(:A, :m), w], [chord(:F, :M), w], [chord(:G, :M), w], [chord(:F, :M), w]]
        chord_player(chord_list)
      elsif State_list[Current_section][4..6] == "101" #Rap Chords
        chord_list = [[chord(:Cs, :m), w], [chord(:Fs, :m), w], [chord(:Cs, :m), w], [chord(:Gs3, :m, invert:1), h], [chord(:B3, :M), h]]
        chord_player(chord_list)
      else
        #sync :change
        sleep 1
      end
    end
  end
end

def chord_player(play_list)
  idx = 0
  while idx < play_list.length()
    play play_list[idx][0]
    while play_list[idx][1] == 0
      idx += 1
      play play_list[idx][0]
    end
    sleep play_list[idx][1]
    idx += 1
  end
end