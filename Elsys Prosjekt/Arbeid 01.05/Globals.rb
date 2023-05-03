#All global variables should be defined and initialized here.
#When adding a variable here, it should have a clear description of its function

Glob_BPM = 120

Prev_state_list = ["0","0","0","0","0","0","0","0"]
State_list = ["0","0","0","0","0","0","0","0"] #A list over all current states
States_length = 7 #The length of each state that is sent from the arduino to sonic pi

Current_section_inst = "" #The states of instrumetns relevant to current section

Section_ring = (ring 1,2,3)#A ring that tracks what section the song is in
#1 - intro, 2 - verse, 3 - chorus

Sec_idx = -1 #An indx that keeps track of where in the Section_ring the song is.
#Indicates the next section of the song, set to -1 for song to start at intro

Current_section = 1 #A variable that indicates what section the song is in:
#0 - pasue, 1 - intro, 2 - verse, 3 - chorus, Initialize to 3 for it to start at intro

Section_beats = 32 #Amount of beats per section

Beat_ring = (range 1,Section_beats+1,1) #A ring that keeps track of what beat the song is in

Beat_idx = -1 #And index that keeps track of the Beat_ring position

Current_beat = 0 #indicates the current beat of the song.

Replay_klick = false
Pause_klick = false
Go_back = false
Go_fwd = false

def bass_func()
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
    return [[:A3, 0.75], [:A3, 0.75 ], [:A3, 0.75], [:A3, 0.75], [:A3, 0.5 ], [:A3, 0.5], [:F2, 0.75], [:F2, 0.75 ], [:F2, 0.75], [:F2, 0.75], [:F2, 0.5 ], [:F2, 0.5], [:G2, 0.75], [:G2, 0.75 ], [:G2, 0.75], [:G2, 0.75], [:G2, 0.5 ], [:G2, 0.5], [:F2, 0.75], [:F2, 0.75 ], [:F2, 0.75], [:F2, 0.75], [:F2, 0.5 ], [:F2, 0.4]]
  elsif State_list[0][4..6] == "010" #Going Inn
    return [[:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.50], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.5], [:A3, 0.75], [:A3, 0.75 ], [:A3, 0.5],[:Fs3, 0.75], [:Fs3, 0.75 ], [:Fs3, 0.5], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.5], [:Gs3, 0.75], [:Gs3, 0.75 ], [:G2, 0.5], [:D3, 0.75], [:D3, 0.75 ],[:D3, 0.5], [:Bs3, 0.75], [:Bs3, 0.75 ], [:Bs3, 0.5], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.50], [:Gs3, 0.75], [:Gs3, 0.75 ], [:Gs3, 0.5], [:A3, 0.75], [:A3, 0.75 ], [:A3, 0.5], [:Fs3, 0.75], [:Fs3, 0.75 ], [:Fs3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:F3, 0.75],[:F3, 0.75 ], [:F2, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:A3, 0.75], [:A3, 0.75 ], [:A3, 0.4]]
  elsif State_list[0][4..6] == "011" #Latin Vocals
    return [[:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:Ab3, 0.75], [:Ab3, 0.75 ], [:Ab3, 0.5], [:Ab3, 0.75], [:Ab3, 0.75 ], [:Ab3, 0.5], [:Eb3, 0.75], [:Eb3, 0.75 ], [:Eb3, 0.5], [:G3, 0.75], [:G3, 0.75 ], [:G3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:F3, 0.75], [:F3, 0.75 ], [:F3, 0.5], [:Ab3, 0.75], [:Ab3, 0.75 ], [:Ab3, 0.5], [:G3, 0.75], [:G3, 0.75 ], [:G3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.5], [:C3, 0.75], [:C3, 0.75 ], [:C3, 0.4]]
  elsif State_list[0][4..6] == "100" #Only Thing
    return [[:Cs3, 0.75], [:Cs3, 0.75 ], [:Cs3, 0.5], [:Cs3, 0.75], [:Cs3, 0.75 ], [:Cs3, 0.5], [:B2, 0.75], [:B2, 0.75 ], [:B2, 0.5], [:B2, 0.75], [:B2, 0.75 ], [:B2, 0.5], [:A3, 0.75], [:A2, 0.75 ], [:A2, 0.5], [:B2, 0.75], [:B2, 0.75 ], [:B2, 0.5], [:Gs3, 0.75], [:Gs2, 0.75 ], [:Gs2, 0.5], [:Gs2, 0.75], [:Gs2, 0.75 ], [:Gs2, 0.4]]
  elsif State_list[0][4..6] == "101" #Rap Song
    return [[:Cs3, w], [:Fs3, w], [:Cs3, w], [:Gs3, h], [:B3, h]]
  end
end

def chord_func()
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
    return [[chord(:A, :m), w], [chord(:F, :M), w], [chord(:G, :M), w], [chord(:F, :M), 3.9]]
  elsif State_list[0][4..6] == "010" #Going Inn
    return [[chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:Gs, :M), w], [chord(:D, :M), h], [chord(:Bs, :M), h], [chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:F, :m), w], [chord(:F, :M), h], [chord(:A, :M), 1.9]]
  elsif State_list[0][4..6] == "011" #Latin Vocals
    return [[chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), w], [chord(:Eb, :M), h], [chord(:G, :M), h], [chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), h], [chord(:G, :M), h], [chord(:C , :m), 3.9]]
  elsif State_list[0][4..6] == "100" #Only Thing
    return [[chord(:Cs, :m), w],[chord(:B, :M), w],[chord(:A, :M), h],[chord(:B, :M), h],[chord(:Gs, :m), 3.9]]
  elsif State_list[0][4..6] == "101" #Rap Song
    return [[chord(:Cs, :m), w], [chord(:Fs, :m), w], [chord(:Cs, :m), w], [chord(:Gs3, :m, invert:1), h], [chord(:B3, :M), 1.9]]
  end
end


def melody_func()
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
    return [[:C5, 0.75], [:C5, 0.75], [:C5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.5],[:C5, 0.75], [:C5, 0.75], [:C5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.5],[:D5, 0.75], [:D5, 0.75], [:D5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.5],  [:C5, 0.75], [:C5, 0.75], [:C5, 0.75], [:B4, 0.75], [:B4, 0.5], [:C5, 0.4]]
  elsif State_list[0][4..6] == "010" #Going Inn
    return [[0, h_+w], [:Gs5, s], [:Fs5, s], [:E5, s], [:Cs5, s], [:C5, w], [0, h_], [:Gs4, s], [:A5, s], [:C5, s], [:Cs5, s], [:C5, w], [0, h_], [:Cs5, s], [:Ds5, s], [:E5, s], [:A5, s], [:Gs5, w], [0, h_], [:Fs4, s], [:Gs4, s], [:A4, s], [:G4, s], [:G4, 3.9]]
  elsif State_list[0][4..6] == "011" #Latin Vocals
    return [[0,w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w],[:Eb5, e], [:Eb5, e], [:D5, s], [:Eb5, e], [:D5, s+s], [:Bb4, s], [:C5, e+q], [0, w],[:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:G5, e], [:G5, e], [:F5, s], [:Eb5, e], [:C5, s+s], [:Bb4, s], [:C5, e+q], [0, q], [0, s], [:G4, s], [:C5, s], [:D5, s], [:Eb5, e], [:F5, s], [:D5, s+s], [:Eb5, s], [:C5, e], [0, w], [0, q], [0, s], [:Bb4, s], [:Eb4, s], [:F5, s], [:G5, e], [:Ab5, s], [:F5, s+s], [:G5, s], [:Eb5, e], [:Eb5, q_], [:F5, e], [:D5, q_], [:Eb5, e], [:C5, w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:G5, e], [:G5, e], [:F5, s], [:Eb5, e], [:C5, s+s], [:Bb4, s], [:C5, e+q], [0,w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:Eb5, e], [:Eb5, e], [:D5, s], [:Eb5, e], [:D5, s+s], [:Bb4, s], [:C5, e+q], [0, w], [:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [0, w], [:G5, e], [:G5, e], [:F5, s], [:Eb5, e], [:C5, s+s], [:Bb4, s], [:C5, e+q]]
  elsif State_list[0][4..6] == "100" #Only Thing
    return [[:E, w], [:Ds, h], [:Gs, e], [:Fs, e], [:E, e], [:Ds, e], [:Cs, q_], [:Ds, q_], [:E, q], [:Ds, h], [:E, q], [:Ds, 0.9]]
  elsif State_list[0][4..6] == "101" #Rap Song
    return [[:Cs4, q_], [:Gs4, e], [:A4, q], [:Gs4, q], [:Fs4, q_], [:Gs4, e], [:E4, q], [:Ds4, q], [:Cs4, q_], [:Gs4, e], [:A4, q], [:Gs4, q], [:B4, q_], [:Gs4, e], [:B4, q], [:Cs4, 0.9]]
  end
end

def sec_idx()
  if Current_section == 1
    return [6, 0, 6]
  elsif Current_section == 2
    return [6, 7, 13]
  elsif Current_section == 3
    return [7, 0, 6]
  end
end

define :update_BPM do
  if State_list[0][4..6] == "001" #Faktisk MGP
    Glob_BPM = 128
  elsif State_list[0][4..6] == "010" #Going Inn
    Glob_BPM = 125
  elsif State_list[0][4..6] == "011" #Latin Vocals
    Glob_BPM = 105
  elsif State_list[0][4..6] == "100" #Only Thing
    Glob_BPM = 108
  elsif State_list[0][4..6] == "101" #Rap Song
    Glob_BPM = 95
  end
end

def vowel_func(idx, a, b)
  val = State_list[idx][a..b]
  print "Val:"
  print val
  val = val.to_i(2)
  if val >= 64
    return 0
  else
    return 1 - val*1.0/64.0
  end
end

def distort_func(idx, a, b)
  val = State_list[idx][a..b]
  val = val.to_i(2)
  if val >= 64
    return val/63.0 - 64.0/63.0
  else
    return 0
  end
end

def reverb_func(idx, a, b)
  val = State_list[idx][a..b]
  val = val.to_i(2)
  if val >= 64
    return val/63.0 - 64.0/63.0
  else
    return 1 - val*1.0/64.0
  end
end

def ping_func(idx, a, b)
  val = State_list[idx][a..b]
  val = val.to_i(2)
  if val >= 64
    return val/63.0 - 64.0/63.0
  else
    return 0
  end
end

def eqH_func(idx, a, b)
  val = State_list[idx][a..b]
  val = val.to_i(2)
  if val >= 64
    return val/63.0 - 64.0/63.0
  else
    return 0
  end
end

def eqL_func(idx, a, b)
  val = State_list[idx][a..b]
  val = val.to_i(2)
  if val >= 64
    return 0
  else
    return 1 - val*1.0/64.0
  end
end

def LP_func(idx, a, b)
  val = State_list[idx][a..b]
  val = val.to_i(2)
  if val >= 64
    return 0
  else
    return 1 - val*1.0/64.0
  end
end

def HP_func(idx, a, b)
  val = State_list[idx][a..b]
  val = val.to_i(2)
  if val >= 64
    return val/63.0 - 64.0/63.0
  else
    return 0
  end
end

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

def drum_player(play_list, loc, my_vowel, my_ping, my_reverb, my_distort)
  idx = 0
  print State_list[5][7..13]
  while idx < play_list.length()
    sec_list = sec_idx
    #with_fx :reverb, mix: reverb_func(5, 7, 13), damp: 0.5, room: 0.6 do
    #with_fx :distortion, mix: distort_func(5, 7, 13), distort: 0.8 do
    #control my_ping, mix: ping_func(sec_list[0], sec_list[1], sec_list[2])
    #control my_vowel, mix: vowel_func(5, 7, 13)
    #control my_reverb, mix: reverb_func(5, 7, 13)
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

def chord_player(play_list, my_vowel, my_reverb, my_distort, i, a, b, atk = 0, dec = 0, sus = 0, sus_lvl = 1, rel = 1, amp = 1)
  idx = 0
  while idx < play_list.length()
    #with_fx :reverb, mix: reverb_func(i, a, b), damp: 0.5, room: 0.6 do
    #with_fx :vowel, mix: vowel_func(i, a, b) do
    #with_fx :distortion, mix: distort_func(i, a, b), distort: 0.8 do
    #control my_vowel, mix: vowel_func(4, 7, 13)
    #control my_reverb, mix: reverb_func(4, 7, 13)
    #control my_distort, mix: distort_func(4, 7, 13)
    play play_list[idx][0], sustain: play_list[idx][1], attack: atk, decay: dec, sustain_level: sus_lvl, release: rel, amp: amp
    sleep play_list[idx][1]
    idx += 1
  end
  #end
  #end
  #end
end

def melody_player(play_list, my_vowel, my_reverb, my_distort,  i, a, b, atk = 0, dec = 0, sus = 0, sus_lvl = 1, rel = 1, amp = 1)
  idx = 0
  while idx < play_list.length()
    #with_fx :reverb, mix: reverb_func(i, a, b), damp: 0.3, room: 0.2 do
    #with_fx :vowel, mix: vowel_func(i, a, b) do
    #with_fx :distortion, mix: distort_func(i, a, b), distort: 0.8 do
    #control my_vowel, mix: vowel_func(4, 0, 6)
    #control my_reverb, mix: reverb_func(4, 0, 6)
    #control my_distort, mix: distort_func(4, 0, 6)
    play play_list[idx][0], sustain: play_list[idx][1], attack: atk, decay: dec, sustain_level: sus_lvl, release: rel, amp: amp
    sleep play_list[idx][1]
    idx += 1
  end
  #end
  #end
  #end
end