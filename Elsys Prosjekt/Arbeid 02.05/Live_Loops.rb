live_loop :Tracker do
  
  use_bpm Glob_BPM
  
  next_sec = false
  
  #Tracker thread
  tracker_thread = in_thread do
    sleep 32
    next_sec = true
    cue :kill
  end
  
  #Instrument trheads
  drum_thread = in_thread do
    drum_player
  end
  bass_thread = in_thread do
    #bass_player
  end
  chord_thread = in_thread do
    #chord_player
  end
  lead_thread = in_thread do
    #lead_player
  end
  vocal_thread = in_thread do
    vocal_player
  end
  sync :kill
  Thread.kill(drum_thread)
  Thread.kill(bass_thread)
  Thread.kill(chord_thread)
  Thread.kill(lead_thread)
  
  Thread.kill(tracker_thread)
  if next_sec == true && !Replay_klick
    Current_section = (Current_section % 3) +1
  end
  sleep 0.1 #This pause is to ensure that the vocal is set to 0.
  Thread.kill(vocal_thread)
end

live_loop :Update_Loop do
  detect_MIDI
  
  update_BPM
  
  if should_kill
    cue :kill
  end
end

def drum_player
  loop do
    use_bpm Glob_BPM
    #with_fx :ping_pong, feedback: 0.2, phase: 0.25, mix: 0 do |my_ping|
    #with_fx :reverb, damp: 0.5, room: 0.6, mix: 0 do |my_reverb|
    #with_fx :vowel, mix: 0 do |my_vowel|
    #with_fx :distortion, distort: 0.8, mix: 0 do |my_distort|
    if State_list[Current_section][8..10] == "001" #Foor on the floor
      drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/4 on the floor"
      drum_list = [[2, 0.5], [1, 0.5], [2, 0], [0, 0.5], [1, 0.5]]
    elsif State_list[Current_section][8..10] == "010" #Latin drums
      drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Latin Drums"
      drum_list = [[0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.25], [1, 0.5], [1, 0.25], [0, 0.5], [1, 0.5]]
    elsif State_list[Current_section][8..10] == "011" #Rock drums
      drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Rock Drums"
      drum_list = [[0,0],[1,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5]]
    elsif State_list[Current_section][8..10] == "100" #Slow drums
      drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Slow Drums"
      drum_list = [[0,2],[1,1],[0,2],[0,1],[1,2]]
    elsif State_list[Current_section][8..10] == "101" #Clap drums
      drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Claps"
      drum_list = [[1,0],[2,0.5],[1,0.5],[1,0],[0,0.5],[1,0],[2,0.5],[1,0.5],[1,0.25],[1,0],[0,0.25],[1,0],[2,0.5],[1,0], [0,0.5]]
    end
    
    
    idx = 0
    while idx < drum_list.length()
      sec_list = sec_idx
      #control my_ping, mix: ping_func(sec_list[0], sec_list[1], sec_list[2])
      #control my_vowel, mix: vowel_func(5, 7, 13)
      #control my_reverb, mix: reverb_func(5, 7, 13)
      #control my_distort, mix: distort_func(5, 7, 13)
      sample drums, drum_list[idx][0]
      while drum_list[idx][1] == 0
        idx += 1
        sample drums, drum_list[idx][0]
      end
      sleep drum_list[idx][1]
      idx += 1
    end
    
    #end
    #end
    #end
    #end
  end
end

def vocal_player
  use_bpm Glob_BPM
  
  if State_list[0][4..6] == "001" #Faktisk MGP
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Faktisk MGP"
    vocal_player = sample vocals, Current_section - 1
  elsif State_list[0][4..6] == "010" #Going Inn
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Going Inn"
    vocal_player = sample vocals, Current_section - 1
  elsif State_list[0][4..6] == "011" #Latin Vocals
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Latin Vocal"
    vocal_player = sample vocals, Current_section - 1
  elsif State_list[0][4..6] == "100" #Only Thing
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Only Thing"
    vocal_player = sample vocals, Current_section - 1, amp: 10
  elsif State_list[0][4..6] == "101" #Rap Song
    vocals = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Vocal Exports/Rap Vocal"
    vocal_player = sample vocals, Current_section - 1
  end
  
  sync :kill
  control vocal_player, amp: 0
  
end


