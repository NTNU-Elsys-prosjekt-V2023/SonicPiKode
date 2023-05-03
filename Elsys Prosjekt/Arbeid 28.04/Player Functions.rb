define :detect_MIDI do
  for i in 2..4 do
    state1, state2 = sync "/midi:arduino_micro_0:#{i}/control_change"
    state1 = state1.to_s(2)
    state2 = state2.to_s(2)
    while state1.length != States_length do
      state1 = "0" + state1
    end
    while state2.length != States_length do
      state2 =  "0" + state2
    end
    Prev_state_list[i-1] = State_list[i-1].dup
    State_list[i-1] = state1 + state2
  end
  cue :change_inst
end

live_loop :Update_Loop do
  detect_MIDI
  cue :change
  #detect_change
  #update_BPM
  #pause_play
  #skip_forward
  #skip_backward
end

define :drum_thread do
  loop do
    drum_chooser
  end
end

live_loop :drums do
  drum_thread = in_thread do
    sync :continue
    loop do
      #sync :change_inst #Wait untill the tracker gives it the signal to continue
      if State_list[Current_section][1..3] == "001" #Foor on the floor
        drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/4 on the floor"
        drum_list = [[2, 0.5], [1, 0.5], [2, 0], [0, 0.5], [1, 0.5]]
        drum_player(drum_list, drums)
      elsif State_list[Current_section][1..3] == "010" #Latin drums
        drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Latin Drums"
        drum_list = [[0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.25], [1, 0.5], [1, 0.25], [0, 0.5], [1, 0.5]]
        drum_player(drum_list, drums)
      elsif State_list[Current_section][1..3] == "011" #Rock drums
        drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Rock Drums"
        drum_list = [[0,0],[1,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5]]
        drum_player(drum_list, drums)
      elsif State_list[Current_section][1..3] == "100" #Slow drums
        drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Slow Drums"
        drum_list = [[0,2],[1,1],[0,2],[0,1],[1,2]]
        drum_player(drum_list, drums)
      elsif State_list[Current_section][1..3] == "101" #Clap drums
        drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Claps"
        drum_list = [[1,0],[2,0.5],[1,0.5],[1,0],[0,0.5],[1,0],[2,0.5],[1,0.5],[1,0.25],[1,0],[0,0.25],[1,0],[2,0.5],[1,0], [0,0.5]]
        drum_player(drum_list, drums)
      else
        #sync :change
        sleep 1
      end
    end
  end
  sync :kill
  Thread.kill(drum_thread)
end

def drum_player(play_list, loc)
  idx = 0
  while idx < play_list.length()
    sample loc, play_list[idx][0]
    while play_list[idx][1] == 0
      idx += 1
      sample loc, play_list[idx][0]
    end
    sleep play_list[idx][1]
    idx += 1
  end
end

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
    sync :continue
    print [Current_section][4..6]
    loop do
      #sync :change_inst #Wait untill the tracker gives it the signal to continue
      chord_list = [[chord(:A, :m), w], [chord(:F, :M), w], [chord(:G, :M), w], [chord(:F, :M), w]]
      if State_list[Current_section][4..6] == "001"
        use_synth :piano
        chord_player(chord_list)
      elsif State_list[Current_section][4..6] == "010"
        use_synth :tech_saws
        chord_player(chord_list, 0, 0, 0, 1, 0.3)
      elsif State_list[Current_section][4..6] == "011"
        with_fx :reverb, damp: 1 do
          with_fx :hpf, cutoff: 40 do
            use_synth :kalimba
            chord_player(chord_list, 0, 0.5, 0, 0.05, 1, 5)
          end
        end
      elsif State_list[Current_section][4..6] == "100" #Faktisk MGP
        with_fx :distortion, distort: 0.5 do
          with_fx :hpf, cutoff: 40 do
            #guitar = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples"
            #sample guitar, 0, pitch: 12
            use_synth :pluck
            chord_player(chord_list)
          end
        end
      elsif State_list[Current_section][4..6] == "101" #Rap Chords
        use_synth :piano
        chord_player(chord_list)
      else
        #sync :change
        sleep 1
      end
    end
  end
  sync :kill
  Thread.kill(chord_thread)
end

def chord_player(play_list, atk = 0, dec = 0, sus = 0, sus_lvl = 1, rel = 1, amp = 1)
  idx = 0
  while idx < play_list.length()
    play play_list[idx][0], sustain: play_list[idx][1], attack: atk, decay: dec, sustain_level: sus_lvl, release: rel, amp: amp
    sleep play_list[idx][1]
    idx += 1
  end
end

#It then send the kill signal to all instrument loops if the song should stop.
#Else the instruments are told to continue.
live_loop :kill_play do
  #sync :change
  if should_kill
    cue :kill
  else
    cue :continue
  end
  sync :change
end

define :should_kill do
  print State_list[Current_section]
  print Prev_state_list[Current_section]
  if State_list[Current_section] != Prev_state_list[Current_section]
    return true
  elsif State_list[0] != Prev_state_list[0]
    return true
  else
    return false
  end
end