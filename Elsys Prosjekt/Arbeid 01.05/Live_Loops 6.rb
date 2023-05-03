

live_loop :vocal do
  #sync :chord
  
  sync :beat_inc
  use_bpm Glob_BPM
  print "In vocal player"
  thread_waiter = in_thread do
    sleep 31.9
    cue :kill_vocal
  end
  
  if State_list[0][4..6] == "001" #Faktisk MGP
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Faktisk MGP"
    play_vocal(vocals)
  elsif State_list[0][4..6] == "010" #Going Inn
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Going Inn"
    play_vocal(vocals)
  elsif State_list[0][4..6] == "011" #Latin Vocals
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Latin Vocal"
    play_vocal(vocals)
  elsif State_list[0][4..6] == "100" #Only Thing
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Only Thing"
    play_vocal(vocals, 10)
  elsif State_list[0][4..6] == "101" #Rap Song
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Rap Vocal"
    play_vocal(vocals)
    'else
    #sync :change
    sleep 1'
  end
  #Thread.kill(thread_killer)
  Thread.kill(thread_waiter)
  
end


def play_vocal(vocals, amp = 1)
  vocal_player = sample vocals, Current_section - 1, amp: amp
  sync :kill_vocal
  control vocal_player, amp: 0
end

live_loop :bass do
  bass_thread = in_thread do
    loop do
      sync :beat_inc
      use_bpm Glob_BPM
      w = 4.0
      h = w/2.0
      h_ = h*1.5
      q = h/2.0
      q_ = q*1.5
      e = q/2.0
      e_ = e*1.5
      s = e/2.0
      s_ = s*1.5
      
      i = 5
      a = 0
      b = 6
      
      
      print State_list[Current_section][11..13]
      #sync :change_inst #Wait untill the tracker gives it the signal to continue
      bass_list = bass_func
      if State_list[Current_section][11..13] == "001"
        use_synth :sine
        bass_player(bass_list, i, a, b)
      elsif State_list[Current_section][11..13] == "010"
        use_synth :dtri
        bass_player(bass_list, i, a, b)
      elsif State_list[Current_section][11..13] == "011"
        #sample :bd_808
        with_fx :distortion, distort: 0.7 do
          use_synth :bass_foundation
          bass_player(bass_list, i, a, b)
        end
      elsif State_list[Current_section][11..13] == "100" #Faktisk MGP
        use_synth :fm
        bass_player(bass_list, i, a, b)
      elsif State_list[Current_section][11..13] == "101" #Rap Chords
        use_synth :pretty_bell
        bass_player(bass_list, i, a, b)
        'else
        #sync :change
        sleep 1'
      end
    end
  end
  sync :kill
  Thread.kill(bass_thread)
end

def bass_player(play_list, i, a, b, atk = 0, dec = 0, sus = 0, sus_lvl = 1, rel = 0.3, amp = 1)
  idx = 0
  while idx < play_list.length()
    #with_fx :reverb, mix: reverb_func(i, a, b), damp: 0.5, room: 0.6 do
    #with_fx :vowel, mix: vowel_func(i, a, b) do
    #with_fx :distortion, mix: distort_func(i, a, b), distort: 0.8 do
    
    play play_list[idx][0], sustain: play_list[idx][1], attack: atk, decay: dec, sustain_level: sus_lvl, release: rel, amp: amp
    
    sleep play_list[idx][1]
    idx += 1
  end
  #end
  #end
  #end
end

live_loop :melody do
  melody_thread = in_thread do
    loop do
      sync :beat_inc
      use_bpm Glob_BPM
      w = 4.0
      h = w/2.0
      h_ = h*1.5
      q = h/2.0
      q_ = q*1.5
      e = q/2.0
      e_ = e*1.5
      s = e/2.0
      s_ = s*1.5
      
      i = 4
      a = 0
      b = 6
      
      
      #print State_list[Current_section][4..6]
      #sync :change_inst #Wait untill the tracker gives it the signal to continue
      melody_list = melody_func
      if State_list[Current_section][4..6] == "001"
        use_synth :piano
        melody_player(melody_list, i, a, b)
      elsif State_list[Current_section][4..6] == "010"
        use_synth :tech_saws
        melody_player(melody_list, i, a, b, 0, 0, 0, 1, 0.3)
      elsif State_list[Current_section][4..6] == "011"
        with_fx :reverb, damp: 1 do
          with_fx :hpf, cutoff: 40 do
            use_synth :kalimba
            melody_player(melody_list, i, a, b, 0, 0.5, 0, 0.05, 1, 5)
          end
        end
      elsif State_list[Current_section][4..6] == "100" #Faktisk MGP
        with_fx :ixi_techno, phase: 1, res: 0.5, mix: 1 do
          use_synth :dsaw
          melody_player(melody_list, i, a, b, 0.5, 0, 0, 1, 0.5, 0.7)
        end
      elsif State_list[Current_section][4..6] == "101" #Rap Chords
        use_synth :hollow
        melody_player(melody_list, i, a, b, 0, 0, 0, 1, 1, 2)
        'else
        #sync :change
        sleep 1'
      end
    end
  end
  sync :kill
  Thread.kill(melody_thread)
end

def melody_player(play_list, i, a, b, atk = 0, dec = 0, sus = 0, sus_lvl = 1, rel = 1, amp = 1)
  idx = 0
  while idx < play_list.length()
    #with_fx :reverb, mix: reverb_func(i, a, b), damp: 0.3, room: 0.2 do
    #with_fx :vowel, mix: vowel_func(i, a, b) do
    #with_fx :distortion, mix: distort_func(i, a, b), distort: 0.8 do
    play play_list[idx][0], sustain: play_list[idx][1], attack: atk, decay: dec, sustain_level: sus_lvl, release: rel, amp: amp
    sleep play_list[idx][1]
    idx += 1
  end
  #end
  #end
  #end
end

live_loop :chords do
  #sync :continue
  
  
  chord_thread = in_thread do
    loop do
      sync :beat_inc
      use_bpm Glob_BPM
      with_fx :reverb, damp: 0.5, room: 0.6 do |my_reverb|
        with_fx :vowel do |my_vowel|
          with_fx :distortion, distort: 0.8 do |my_distort|
            w = 4.0
            h = w/2.0
            
            i = 4
            a = 7
            b = 13
            
            #sync :change_inst #Wait untill the tracker gives it the signal to continue
            chord_list = chord_func
            if State_list[Current_section][1..3] == "001"
              use_synth :piano
              chord_player(chord_list, i, a, b)
            elsif State_list[Current_section][1..3] == "010"
              use_synth :tech_saws
              chord_player(chord_list, i, a, b, 0, 0, 0, 1, 0.3)
            elsif State_list[Current_section][1..3] == "011"
              with_fx :reverb, damp: 1 do
                with_fx :hpf, cutoff: 40 do
                  use_synth :kalimba
                  chord_player(chord_list, i, a, b, 0, 0.5, 0, 0.05, 1, 5)
                end
              end
            elsif State_list[Current_section][1..3] == "100" #Faktisk MGP
              with_fx :distortion, distort: 0.5 do
                with_fx :hpf, cutoff: 40 do
                  #guitar = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples"
                  #sample guitar, 0, pitch: 12
                  use_synth :pluck
                  chord_player(chord_list, i, a, b)
                end
              end
            elsif State_list[Current_section][1..3] == "101" #Rap Chords
              use_synth :piano
              chord_player(chord_list, i, a, b)
              'else
        #sync :change
        sleep 1'
            end
          end
        end
      end
    end
    
  end
  sync :kill
  Thread.kill(chord_thread)
end

def chord_player(play_list, i, a, b, atk = 0, dec = 0, sus = 0, sus_lvl = 1, rel = 1, amp = 1)
  idx = 0
  while idx < play_list.length()
    #with_fx :reverb, mix: reverb_func(i, a, b), damp: 0.5, room: 0.6 do
    #with_fx :vowel, mix: vowel_func(i, a, b) do
    #with_fx :distortion, mix: distort_func(i, a, b), distort: 0.8 do
    control my_vowel, mix: vowel_func(5, 7, 13)
    control my_reverb, mix: reverb_func(5, 7, 13)
    control my_distort, mix: distort_func(5, 7, 13)
    play play_list[idx][0], sustain: play_list[idx][1], attack: atk, decay: dec, sustain_level: sus_lvl, release: rel, amp: amp
    sleep play_list[idx][1]
    idx += 1
  end
  #end
  #end
  #end
end

live_loop :drums do
  
  
  drum_thread = in_thread do
    loop do
      sync :beat_inc
      use_bpm Glob_BPM
      with_fx :ping_pong, feedback: 0.2, phase: 0.25 do |my_ping|
        with_fx :reverb, damp: 0.5, room: 0.6 do |my_reverb|
          with_fx :vowel do |my_vowel|
            with_fx :distortion, distort: 0.8 do |my_distort|
              #sync :change_inst #Wait untill the tracker gives it the signal to continue
              if State_list[Current_section][8..10] == "001" #Foor on the floor
                drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/4 on the floor"
                drum_list = [[2, 0.5], [1, 0.5], [2, 0], [0, 0.5], [1, 0.4]]
                drum_player(drum_list, drums, my_vowel, my_ping, my_reverb, my_distort)
              elsif State_list[Current_section][8..10] == "010" #Latin drums
                drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Latin Drums"
                drum_list = [[0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.25], [1, 0.5], [1, 0.25], [0, 0.5], [1, 0.4]]
                drum_player(drum_list, drums, my_vowel, my_ping, my_reverb, my_distort)
              elsif State_list[Current_section][8..10] == "011" #Rock drums
                drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Rock Drums"
                drum_list = [[0,0],[1,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.4]]
                drum_player(drum_list, drums, my_vowel, my_ping, my_reverb, my_distort)
              elsif State_list[Current_section][8..10] == "100" #Slow drums
                drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Slow Drums"
                drum_list = [[0,2],[1,1],[0,2],[0,1],[1,1.9]]
                drum_player(drum_list, drums, my_vowel, my_ping, my_reverb, my_distort)
              elsif State_list[Current_section][8..10] == "101" #Clap drums
                drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Claps"
                drum_list = [[1,0],[2,0.5],[1,0.5],[1,0],[0,0.5],[1,0],[2,0.5],[1,0.5],[1,0.25],[1,0],[0,0.25],[1,0],[2,0.5],[1,0], [0,0.4]]
                drum_player(drum_list, drums, my_vowel, my_ping, my_reverb, my_distort)
                'else
        #sync :change
        sleep 1'
              end
            end
          end
        end
      end
    end
  end
  sync :kill
  Thread.kill(drum_thread)
end

def drum_player(play_list, loc, my_vowel, my_ping, my_reverb, my_distort)
  idx = 0
  print State_list[5][7..13]
  while idx < play_list.length()
    sec_list = sec_idx
    #with_fx :reverb, mix: reverb_func(5, 7, 13), damp: 0.5, room: 0.6 do
    #with_fx :distortion, mix: distort_func(5, 7, 13), distort: 0.8 do
    control my_ping, mix: ping_func(sec_list[0], sec_list[1], sec_list[2])
    control my_vowel, mix: vowel_func(5, 7, 13)
    control my_reverb, mix: reverb_func(5, 7, 13)
    control my_distort, mix: distort_func(5, 7, 13)
    sample loc, play_list[idx][0]
    while play_list[idx][1] == 0
      idx += 1
      sample loc, play_list[idx][0]
    end
    sleep play_list[idx][1]
    idx += 1
  end
  #end
  #end
end

define :detect_MIDI do
  for i in 1..8 do
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
end

live_loop :Update_Loop do
  detect_MIDI
  
  #if Time.now > Prev_time + 0.01
  #print State_list[0]
  
  if State_list[0][1] == "0"
    Replay_klick = !Replay_klick
  end
  
  if State_list[0][0] == "0"
    Pause_klick = !Pause_klick
  end
  
  if State_list[0][2] == "0"
    Go_fwd = !Go_fwd
  end
  
  if State_list[0][3] == "0"
    Go_back = !Go_back
  end
  
  #sync :beat_inc
  update_BPM
  if should_kill
    cue :kill
    cue :kill_vocal
    #detect_change
    #pause_play
    #skip_forward
    #skip_backward
  else
    cue :continue
  end
end

#end

define :should_kill do
  #print State_list[Current_section]
  #print Prev_state_list[Current_section]
  if State_list[Current_section] != Prev_state_list[Current_section]
    return true
  elsif State_list[0][4..6] != Prev_state_list[0][4..6] || State_list[0][0] != Prev_state_list[0][0] || State_list[0][2..3] != Prev_state_list[0][2..3]
    return true
  else
    return false
  end
end

live_loop :tracker do
  use_bpm Glob_BPM
  Currrent_beat = 0
  Current_section = 1
  Replay_klick = false
  Pause_klick = false
  Go_back = false
  Go_fwd = false
  
  loop do
    use_bpm Glob_BPM
    Current_beat = 0
    tracker_thread = in_thread do
      
      
      loop do
        cue :beat_inc
        sleep 1
        Current_beat = (Current_beat + 1) % Section_beats
        
        if Current_beat % Section_beats == 0 && !Replay_klick
          Current_section = (Current_section % 3) +1
        end
        
        print Current_beat
        print Current_section
        
        
      end
    end
    sync :kill
    Thread.kill(tracker_thread)
    sleep 1
    
    if Go_back && Current_section > 1
      if Current_beat == 1
        Current_section -= 1
      end
      
      Go_back = false
      print "going back 1"
    end
    
    if Go_fwd && Current_section < 3
      Current_section += 1
      Go_fwd = false
      print "going forward 1"
    end
    
    
    while Pause_klick
      sleep 0.1
    end
  end
end

'
live_loop :tracker do
  use_bpm Glob_BPM
  Beat_ring[0]
  Section_ring[0]
  Currrent_beat = Beat_ring[0]
  Current_section = Section_ring[0]
  Beat_idx = -1
  Section_idx = -1

  loop do
    use_bpm Glob_BPM
    tracker_thread = in_thread do
      loop do
        use_bpm Glob_BPM
        Beat_idx += 1
        Current_beat = Beat_ring[Beat_idx]
        cue :beat_inc
        print Current_beat
        if Current_beat == 1
          Section_idx += 1
          Current_section = Section_ring[Section_idx]
          print Current_section
        end
        sleep 1
      end
    end
    sync :kill
    Thread.kill(tracker_thread)
    Currrent_beat = Beat_ring[0]
    Current_section = Section_ring[Section_idx - 1]
    Beat_idx = -1
    Section_idx -= 1
    sleep 1
  end
end
'




