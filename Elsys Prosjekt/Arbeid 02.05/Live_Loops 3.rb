live_loop :Tracker do
  use_bpm Glob_BPM
  
  
  next_sec = false
  print State_list[0][0]
  if State_list[0][0] == "0"
    
    #Tracker thread
    tracker_thread = in_thread do
      sleep 31.9
      next_sec = true
      cue :kill
    end
    
    vocal_thread = in_thread  do
      vocal_player
    end
    
    sync :vocal_played
    
    
    
    #Instrument trheads
    drum_thread = in_thread  do
      drum_player
    end
    bass_thread = in_thread  do
      bass_player
    end
    chord_thread = in_thread  do
      chord_player
    end
    lead_thread = in_thread  do
      melody_player
    end
    
    
    
    
    
    
    sync :kill
    if drum_thread.alive?
      drum_thread.kill()
    end
    if chord_thread.alive?
      chord_thread.kill()
    end
    if bass_thread.alive?
      bass_thread.kill()
    end
    if lead_thread.alive?
      lead_thread.kill()
    end
    if tracker_thread.alive?
      tracker_thread.kill()
    end
    
    if next_sec == true || State_list[0][2] == "0"
      Current_section = (Current_section % 3) + 1
    elsif State_list[0][3] == "0"
      if Current_section == 1
        Current_section = 1
      elsif Current_section == 2
        Current_section = 1
      elsif Current_section == 3
        Current_section = 2
      end
    end
    control $vocal_player, amp: 0
    if vocal_thread.alive?
      vocal_thread.kill()
    end
    #if Prev_state_list[4..6] != State_list[4..6]
    #  Current_section = 1
    #end
    sleep 0.1
    
    print "Current_section: "
    print Current_section
    
  end
  
  if State_list[0][0] == "1"
    sleep 1
  end
  
end

live_loop :Update_Loop do
  detect_MIDI
  
  update_BPM
  
  if State_list[0][1] == "0"
    Replay_klick = !Replay_klick
  end
  
  if should_kill
    #print "Cued Kill"
    cue :kill
  end
  sleep 0.5
end

def drum_player
  a = 0
  if State_list[Current_section][8..10] == "001" #Foor on the floor
    drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/4 on the floor"
    drum_list = [[2, 0.5], [1, 0.5], [2, 0], [0, 0.5], [1, 0.5]]
    a = 16
  elsif State_list[Current_section][8..10] == "010" #Latin drums
    drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Latin Drums"
    drum_list = [[0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.25], [1, 0.5], [1, 0.25], [0, 0.5], [1, 0.5]]
    a = 4
  elsif State_list[Current_section][8..10] == "011" #Rock drums
    drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Rock Drums"
    drum_list = [[0,0],[1,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5]]
    a = 4
  elsif State_list[Current_section][8..10] == "100" #Slow drums
    drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Slow Drums"
    drum_list = [[0,2],[1,1],[0,2],[0,1],[1,2]]
    a = 4
  elsif State_list[Current_section][8..10] == "101" #Clap drums
    drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Claps"
    drum_list = [[1,0],[2,0.5],[1,0.5],[1,0],[0,0.5],[1,0],[2,0.5],[1,0.5],[1,0.25],[1,0],[0,0.25],[1,0],[2,0.5],[1,0], [0,0.5]]
    a = 8
  end
  if a != 0
    a.times do
      idx = 0
      with_fx :ping_pong do |ping|
        with_fx :krush do |vowel|
          with_fx :hpf, mix: 0.4 do
            with_fx :eq, high_shelf: 0 do
              while idx < drum_list.length()
                sec_list = sec_idx
                control ping, mix: ping_func(Current_section + 5, 0, 6)
                control vowel, mix: vowel_func(5, 7, 13)
                sample drums, drum_list[idx][0], amp: 2
                while drum_list[idx][1] == 0
                  idx += 1
                  sample drums, drum_list[idx][0], amp: 2
                end
                sleep drum_list[idx][1]
                idx += 1
              end
            end
          end
        end
      end
    end
  end
  
end

def vocal_player
  
  
  if State_list[0][4..6] == "001" #Faktisk MGP
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Faktisk MGP"
    $vocal_player = sample vocals, Current_section - 1
  elsif State_list[0][4..6] == "010" #Going Inn
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Going Inn"
    $vocal_player = sample vocals, Current_section - 1, amp: 3
  elsif State_list[0][4..6] == "011" #Latin Vocals
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Latin Vocal"
    $vocal_player = sample vocals, Current_section - 1, amp: 3
  elsif State_list[0][4..6] == "100" #Only Thing
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Only Thing"
    $vocal_player = sample vocals, Current_section - 1, amp: 10
  elsif State_list[0][4..6] == "101" #Rap Song
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Rap Vocal"
    $vocal_player = sample vocals, Current_section - 1, amp: 3
  end
  
  cue :vocal_played
  
  sync :kill
  
end

def bass_player
  
  w = 4.0
  h = w/2.0
  h_ = h*1.5
  q = h/2.0
  q_ = q*1.5
  e = q/2.0
  e_ = e*1.5
  s = e/2.0
  s_ = s*1.5
  with_fx :ping_pong do |bass_ping|
    with_fx :ixi_techno, cutoff_min: 40 do |bass_vowel|
      with_fx :hpf, cutoff: 60, mix: 0.5 do
        loop do
          if State_list[0][4..6] == "001" #Faktisk MGP
            bass_list =  [[:A3, 0.75], [:A3, 0.75 ], [:A3, 0.75], [:A3, 0.75], [:A3, 0.5 ], [:A3, 0.5], [:F2, 0.75], [:F2, 0.75 ], [:F2, 0.75], [:F2, 0.75], [:F2, 0.5 ], [:F2, 0.5], [:G2, 0.75], [:G2, 0.75 ], [:G2, 0.75], [:G2, 0.75], [:G2, 0.5 ], [:G2, 0.5], [:F2, 0.75], [:F2, 0.75 ], [:F2, 0.75], [:F2, 0.75], [:F2, 0.5 ], [:F2, 0.5]]
          elsif State_list[0][4..6] == "010" #Going Inn
            bass_list = [[:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.50], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.5], [:A3, 0.75], [:A3, 0.75 ], [:A3, 0.5],[:Fs3, 0.75], [:Fs3, 0.75 ], [:Fs3, 0.5], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.5], [:Gs3, 0.75], [:Gs3, 0.75 ], [:G2, 0.5], [:D3, 0.75], [:D3, 0.75 ],[:D3, 0.5], [:Bs3, 0.75], [:Bs3, 0.75 ], [:Bs3, 0.5], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.50], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.5], [:A3, 0.75], [:A3, 0.75 ], [:A3, 0.5], [:Fs3, 0.75], [:Fs3, 0.75 ], [:Fs3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:F3, 0.75],[:F3, 0.75 ], [:F2, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:A3, 0.75], [:A3, 0.75 ], [:A3, 0.5]]
          elsif State_list[0][4..6] == "011" #Latin Vocals
            bass_list = [[:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:Ab3, 0.75], [:Ab3, 0.75 ], [:Ab3, 0.5], [:Ab3, 0.75], [:Ab3, 0.75 ], [:Ab3, 0.5], [:Eb3, 0.75], [:Eb3, 0.75 ], [:Eb3, 0.5], [:G3, 0.75], [:G3, 0.75 ], [:G3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:Ab3, 0.75], [:Ab3, 0.75 ], [:Ab3, 0.5], [:G3, 0.75], [:G3, 0.75 ], [:G3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5]]
          elsif State_list[0][4..6] == "100" #Only Thing
            bass_list = [[:Cs3, 0.75], [:Cs3, 0.75 ], [:Cs3, 0.5], [:Cs3, 0.75], [:Cs3, 0.75 ], [:Cs3, 0.5], [:B2, 0.75], [:B2, 0.75 ], [:B2, 0.5], [:B2, 0.75], [:B2, 0.75 ], [:B2, 0.5], [:A3, 0.75], [:A2, 0.75 ], [:A2, 0.5], [:B2, 0.75], [:B2, 0.75 ], [:B2, 0.5], [:Gs3, 0.75], [:Gs2, 0.75 ], [:Gs2, 0.5], [:Gs2, 0.75], [:Gs2, 0.75 ], [:Gs2, 0.5]]
          elsif State_list[0][4..6] == "101" #Rap Song
            bass_list = [[:Cs3, w], [:Fs3, w], [:Cs3, w], [:Gs3, h], [:B3, h]]
          end
          
          if State_list[Current_section][11..13] == "001"
            use_synth :sine
            instrument_player(bass_list,bass_ping, bass_vowel, 5, 0, 6, 0, 0, 0, 1, 0, 0.7)
          elsif State_list[Current_section][11..13] == "010"
            use_synth :dtri
            instrument_player(bass_list,bass_ping, bass_vowel, 5, 0, 6, 0, 0, 0, 1, 0, 0.7)
          elsif State_list[Current_section][11..13] == "011"
            #sample :bd_808
            #with_fx :distortion, distort: 0.7 do
            use_synth :bass_foundation
            instrument_player(bass_list,bass_ping, bass_vowel, 5, 0, 6, 0, 0, 0, 1, 0,0.7)
            #end
          elsif State_list[Current_section][11..13] == "100"
            use_synth :fm
            instrument_player(bass_list,bass_ping, bass_vowel, 5, 0, 6, 0, 0, 0, 1, 0, 0.7)
          elsif State_list[Current_section][11..13] == "101"
            use_synth :pretty_bell
            instrument_player(bass_list,bass_ping, bass_vowel, 5, 0, 6, 0, 0, 0, 1, 0, 0.7)
          else
            sync :kill
          end
        end
      end
    end
  end
end

def melody_player
  
  w = 4.0
  h = w/2.0
  h_ = h*1.5
  q = h/2.0
  q_ = q*1.5
  e = q/2.0
  e_ = e*1.5
  s = e/2.0
  s_ = s*1.5
  
  if State_list[0][4..6] == "001" #Faktisk MGP
    melody_list = [[:C5, 0.75], [:C5, 0.75], [:C5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.5],[:C5, 0.75], [:C5, 0.75], [:C5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.5],[:D5, 0.75], [:D5, 0.75], [:D5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.5],  [:C5, 0.75], [:C5, 0.75], [:C5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.5]]
  elsif State_list[0][4..6] == "010" #Going Inn
    melody_list = [[0, h_+w], [:Gs5, s], [:Fs5, s], [:E5, s], [:Cs5, s], [:C5, w], [0, h_], [:Gs4, s], [:A5, s], [:C5, s], [:Cs5, s], [:C5, w], [0, h_], [:Cs5, s], [:Ds5, s], [:E5, s], [:A5, s], [:Gs5, w], [0, h_], [:Fs4, s], [:Gs4, s], [:A4, s], [:G4, s], [:G4, 4]]
  elsif State_list[0][4..6] == "011" #Latin Vocals
    melody_list = [[0,w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w],[:Eb5, e], [:Eb5, e], [:D5, s], [:Eb5, e], [:D5, s+s], [:Bb4, s], [:C5, e+q], [0, w],[:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:G5, e], [:G5, e], [:F5, s], [:Eb5, e], [:C5, s+s], [:Bb4, s], [:C5, e+q], [0, q], [0, s], [:G4, s], [:C5, s], [:D5, s], [:Eb5, e], [:F5, s], [:D5, s+s], [:Eb5, s], [:C5, e], [0, w], [0, q], [0, s], [:Bb4, s], [:Eb4, s], [:F5, s], [:G5, e], [:Ab5, s], [:F5, s+s], [:G5, s], [:Eb5, e], [:Eb5, q_], [:F5, e], [:D5, q_], [:Eb5, e], [:C5, w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:G5, e], [:G5, e], [:F5, s], [:Eb5, e], [:C5, s+s], [:Bb4, s], [:C5, e+q], [0,w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:Eb5, e], [:Eb5, e], [:D5, s], [:Eb5, e], [:D5, s+s], [:Bb4, s], [:C5, e+q], [0, w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:G5, e], [:G5, e], [:F5, s], [:Eb5, e], [:C5, s+s], [:Bb4, s], [:C5, e+q]]
  elsif State_list[0][4..6] == "100" #Only Thing
    melody_list = [[:E, w], [:Ds, h], [:Gs, e], [:Fs, e], [:E, e], [:Ds, e], [:Cs, q_], [:Ds, q_], [:E, q], [:Ds, h], [:E, q], [:Ds, 1]]
  elsif State_list[0][4..6] == "101" #Rap Song
    melody_list = [[:Cs4, q_], [:Gs4, e], [:A4, q], [:Gs4, q], [:Fs4, q_], [:Gs4, e], [:E4, q], [:Ds4, q], [:Cs4, q_], [:Gs4, e], [:A4, q], [:Gs4, q], [:B4, q_], [:Gs4, e], [:B4, q], [:Cs4, 1]]
  end
  with_fx :ping_pong do |chord_ping|
    with_fx :distortion, distort: 0.6 do |lead_vowel|
      loop do
        if State_list[Current_section][4..6] == "001"
          use_synth :piano
          instrument_player(melody_list, chord_ping, lead_vowel, 4, 0, 6,0,0,0,1,1)
        elsif State_list[Current_section][4..6] == "010"
          use_synth :tech_saws
          instrument_player(melody_list, chord_ping, lead_vowel, 4, 0, 6, 0, 0, 0, 1, 0.3, 0.1)
        elsif State_list[Current_section][4..6] == "011"
          with_fx :reverb, damp: 1 do
            with_fx :hpf, cutoff: 40 do
              use_synth :kalimba
              instrument_player(melody_list, chord_ping, lead_vowel, 4, 0, 6, 0, 0.5, 0, 0.05, 1, 5)
            end
          end
        elsif State_list[Current_section][4..6] == "100" #Faktisk MGP
          with_fx :ixi_techno, phase: 1, res: 0.5, mix: 0 do
            use_synth :dsaw
            instrument_player(melody_list, chord_ping, lead_vowel, 4, 0, 6, 0.5, 0, 0, 1, 0.5, 0.3)
          end
        elsif State_list[Current_section][4..6] == "101" #Rap Chords
          use_synth :hollow
          instrument_player(melody_list, chord_ping, lead_vowel, 4, 0, 6, 0, 0, 0, 1, 1, 2)
        else
          sync :kill
        end
      end
    end
  end
  
end

def chord_player
  
  w = 4.0
  h = w/2.0
  h_ = h*1.5
  q = h/2.0
  q_ = q*1.5
  e = q/2.0
  e_ = e*1.5
  s = e/2.0
  s_ = s*1.5
  
  if State_list[0][4..6] == "001" #Faktisk MGP
    chord_list = [[chord(:A, :m), w], [chord(:F, :M), w], [chord(:G, :M), w], [chord(:F, :M), 4]]
  elsif State_list[0][4..6] == "010" #Going Inn
    chord_list = [[chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:Gs, :M), w], [chord(:D, :M), h], [chord(:Bs, :M), h], [chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:F, :m), w], [chord(:F, :M), h], [chord(:A, :M), 2]]
  elsif State_list[0][4..6] == "011" #Latin Vocals
    chord_list = [[chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), w], [chord(:Eb, :M), h], [chord(:G, :M), h], [chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), h], [chord(:G, :M), h], [chord(:C , :m), 4]]
  elsif State_list[0][4..6] == "100" #Only Thing
    chord_list = [[chord(:Cs, :m), w],[chord(:B, :M), w],[chord(:A, :M), h],[chord(:B, :M), h],[chord(:Gs, :m), 4]]
  elsif State_list[0][4..6] == "101" #Rap Song
    chord_list = [[chord(:Cs, :m), w], [chord(:Fs, :m), w], [chord(:Cs, :m), w], [chord(:Gs3, :m, invert:1), h], [chord(:B3, :M), 2]]
  end
  with_fx :ping_pong do |melody_ping|
    with_fx :distortion, distort: 0.6 do |chord_vowel|
      loop do
        if State_list[Current_section][1..3] == "001"
          use_synth :piano
          instrument_player(chord_list, melody_ping, chord_vowel, 4, 7, 13)
        elsif State_list[Current_section][1..3] == "010"
          use_synth :tech_saws
          instrument_player(chord_list, melody_ping, chord_vowel, 4, 7, 13, 0, 0, 0, 1, 0.3, 0.3)
        elsif State_list[Current_section][1..3] == "011"
          #with_fx :reverb, damp: 1 do
          #with_fx :hpf, cutoff: 40 do
          use_synth :kalimba
          instrument_player(chord_list, melody_ping, chord_vowel, 4, 7, 13, 0, 0.5, 0, 0.05, 1, 5)
          #end
          #end
        elsif State_list[Current_section][1..3] == "100"
          #with_fx :distortion, distort: 0.5 do
          #with_fx :hpf, cutoff: 40 do
          use_synth :pluck
          instrument_player(chord_list, melody_ping, chord_vowel, 4, 7, 13, 0,0,0,1,1,5)
          #end
          #end
        elsif State_list[Current_section][1..3] == "101"
          use_synth :piano
          instrument_player(chord_list, melody_ping, chord_vowel, 4, 7, 13, 0,0,0,1,1,2)
        else
          sync :kill
        end
      end
    end
  end
end

def instrument_player(play_list, fx1, fx2, i, a, b, atk = 0, dec = 0, sus = 0, sus_lvl = 1, rel = 1, amp = 1)
  idx = 0
  while idx < play_list.length
    play play_list[idx][0], sustain: play_list[idx][1], release: rel, amp: amp
    control fx1, mix: ping_func(Current_section + 5, 0, 6)
    control fx2, mix: vowel_func(i, a, b)
    sleep play_list[idx][1]
    idx += 1
  end
end
