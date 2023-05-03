w = 4.0
h = w/2.0
h_ = h*1.5
q = h/2.0
q_ = q*1.5
e = q/2.0
e_ = e*1.5
s = e/2.0
s_ = s*1.5

'
#Only thing i want
play_pattern_timed [:E], [w]
play_pattern_timed [:Ds, :Gs, :Fs, :E, :Ds], [h, e, e, e, e]
play_pattern_timed [:Cs, :Ds, :E], [q_, q_, q]
play_pattern_timed [:Ds, :E, :Ds], [h, q, q]

#Faktisk MGP
play_pattern_timed [:C5, :C5, :C5, :B4, :B4, :C5], [e_, e_, e_, e_, e, e]
play_pattern_timed [:C5, :C5, :C5, :B4, :B4, :C5], [e_, e_, e_, e_, e, e]
play_pattern_timed [:D5, :D5, :D5, :B4, :B4, :C5], [e_, e_, e_, e_, e, e]
play_pattern_timed [:C5, :C5, :C5, :B4, :B4, :C5], [e_, e_, e_, e_, e, e]

#Going on
play_pattern_timed [0, :Gs5, :Fs5, :E5, :Cs5], [h_, s, s, s, s]
play_pattern_timed [:Ds5], [w]

play_pattern_timed [0, :Gs4, :A4, :C5, :Cs5], [h_, s, s, s, s]
play_pattern_timed [:C5], [w]

play_pattern_timed [0, :Cs5, :Ds5, :E5, :A5], [h_, s, s, s, s]
play_pattern_timed [:Gs5], [w]

play_pattern_timed [0, :Fs4, :Gs4, :A4, :G4], [h_, s, s, s, s]
play_pattern_timed [:Gs4], [w]

#Latin
play_pattern_timed [:C5, :C5, :Bb4, :C5, :G4, :F4, :G4], [e, e, s, e, s+s, s, e+q]
play_pattern_timed [:Eb5, :Eb5, :D5, :Eb5, :D5, :Bb4, :C5], [e, e, s, e, s+s, s, e+q]
play_pattern_timed [:G5, :G5, :F5, :Eb5, :C5, :Bb4, :C5], [e, e, s, e, s+s, s, e+q]

play_pattern_timed [0, 0, :G4, :C5, :D5, :Eb5, :F5, :D5, :Eb5, :C5], [q, s, s, s, s, e, s, s+s, s, e]
play_pattern_timed [0, 0, :Bb4, :Eb5, :F5, :G5, :Ab5, :F5, :G5, :Eb5], [q, s, s, s, s, e, s, s+s, s, e]
play_pattern_timed [:Eb5, :F5, :D5, :Eb5], [q_, e, q_, e]
play_pattern_timed [:C5], [w]
'
#Clap, four on the floor
#play_pattern_timed [:C, :C, :C, :C], [q, q, q, q]

#Slow drums
#play_pattern_timed [:C, :C, :G, :C], [q, q+e, e, q]

#Rock
#play_pattern_timed [:C, :C, :C, :C, :C, :C, :C, :C], [e, e, e, e, e, e, e, e]

#Latin
#play_pattern_timed [:C2, :G2, :C3, :G2, :C2], [q_, s+e, e+e_, s+e, e]
'
#Only thing
##Four on the floor
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2], [q, q, q, q]
play_pattern_timed [:B1, :B1, :B1, :B1], [q, q, q, q]
play_pattern_timed [:A1, :A1, :B1, :B1], [q, q, q, q]
play_pattern_timed [:Gs1, :Gs1, :Gs1, :Gs1], [q, q, q, q]

##Slow drums
play_pattern_timed [:Cs2, :Cs2, :Gs2, :Cs2], [q, q+e, e, q]
play_pattern_timed [:B1, :B1, :Fs2, :B1], [q, q+e, e, q]
play_pattern_timed [:A1, :A1, :B1, :B1], [q, q+e, e, q]
play_pattern_timed [:Gs1, :Gs1, :Cs2, :Gs1], [q, q+e, e, q]

#Rock
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:B1, :B1, :B1, :B1, :B1, :B1, :B1, :B1], [e, e, e, e, e, e, e, e]
play_pattern_timed [:A1, :A1, :A1, :A1, :B1, :B1, :B1, :B1], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Gs1, :Gs1, :Gs1, :Gs1, :Gs1, :Gs1, :Gs1, :Gs1], [e, e, e, e, e, e, e, e]

##Latin
play_pattern_timed [:Cs2, :Gs2, :Cs3, :Gs2, :Cs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:B1, :Fs2, :B2, :Fs2, :B2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:A1, :Cs2, :B1, :Fs2, :B1], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Gs1, :Cs2, :Gs2, :Cs2, :Gs1], [e_, s+e, e+e_, s+e, e]
'
'
#Faktisk MGP-låt
##Four on the floor
play_pattern_timed [:A2, :A2, :A2, :A2], [q, q, q, q]
play_pattern_timed [:F2, :F2, :F2, :F2], [q, q, q, q]
play_pattern_timed [:G2, :G2, :G2, :G2], [q, q, q, q]
play_pattern_timed [:F2, :F2, :F2, :F2], [q, q, q, q]

##Slow drums
play_pattern_timed [:A2, :A2, :E2, :A2], [q, q+e, e, q]
play_pattern_timed [:F2, :F2, :C2, :F2], [q, q+e, e, q]
play_pattern_timed [:G2, :G2, :D2, :G2], [q, q+e, e, q]
play_pattern_timed [:F2, :F2, :C2, :F2], [q, q+e, e, q]

#Rock
play_pattern_timed [:A2, :A2, :A2, :A2, :A2, :A2, :A2, :A2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:F2, :F2, :F2, :F2, :F2, :F2, :F2, :F2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:G2, :G2, :G2, :G2, :G2, :G2, :G2, :G2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:F2, :F2, :F2, :F2, :F2, :F2, :F2, :F2], [e, e, e, e, e, e, e, e]

##Latin
play_pattern_timed [:Cs2, :Gs2, :Cs3, :Gs2, :Cs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:B1, :Fs2, :B2, :Fs2, :B2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:A1, :Cs2, :B1, :Fs2, :B1], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Gs1, :Cs2, :Gs2, :Cs2, :Gs1], [e_, s+e, e+e_, s+e, e]
'
'
#Rap
##Four on the floor
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2], [q, q, q, q]
play_pattern_timed [:Fs2, :Fs2, :Fs2, :Fs2], [q, q, q, q]
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2], [q, q, q, q]
play_pattern_timed [:Gs2, :Gs2, :B1, :B1], [q, q, q, q]

##Slow drums
play_pattern_timed [:Cs2, :Cs2, :Gs2, :Cs2], [q, q+e, e, q]
play_pattern_timed [:Fs2, :Fs2, :Cs2, :Fs2], [q, q+e, e, q]
play_pattern_timed [:Cs2, :Cs2, :Gs2, :Cs2], [q, q+e, e, q]
play_pattern_timed [:Gs2, :Gs2, :Cs2, :B1], [q, q+e, e, q]

#Rock
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Gs2, :Gs2, :Gs2, :Gs2, :B1, :B1, :B1, :B1], [e, e, e, e, e, e, e, e]

##Latin
play_pattern_timed [:Cs2, :Gs2, :Cs3, :Gs2, :Cs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Fs2, :Cs3, :Fs3, :Cs3, :Fs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Cs2, :Gs2, :Cs3, :Gs2, :Cs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Gs2, :Ds3, :B2, :Fs2, :B2], [e_, s+e, e+e_, s+e, e]
'
'
#Going in
##Four on the floor
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2], [q, q, q, q]
play_pattern_timed [:Fs2, :Fs2, :Fs2, :Fs2], [q, q, q, q]
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2], [q, q, q, q]
play_pattern_timed [:Gs2, :Gs2, :B1, :B1], [q, q, q, q]

##Slow drums
play_pattern_timed [:Cs2, :Cs2, :Gs2, :Cs2], [q, q+e, e, q]
play_pattern_timed [:Fs2, :Fs2, :Cs2, :Fs2], [q, q+e, e, q]
play_pattern_timed [:Cs2, :Cs2, :Gs2, :Cs2], [q, q+e, e, q]
play_pattern_timed [:Gs2, :Gs2, :Cs2, :B1], [q, q+e, e, q]

#Rock
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2, :Fs2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2, :Cs2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Gs2, :Gs2, :Gs2, :Gs2, :B1, :B1, :B1, :B1], [e, e, e, e, e, e, e, e]

##Latin
play_pattern_timed [:Cs2, :Gs2, :Cs3, :Gs2, :Cs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Fs2, :Cs3, :Fs3, :Cs3, :Fs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Cs2, :Gs2, :Cs3, :Gs2, :Cs2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Gs2, :Ds3, :B2, :Fs2, :B2], [e_, s+e, e+e_, s+e, e]
'

#Latin
##Four on the floor
play_pattern_timed [:C2, :C2, :C2, :C2], [q, q, q, q]
play_pattern_timed [:F2, :F2, :F2, :F2], [q, q, q, q]
play_pattern_timed [:Ab2, :Ab2, :Ab2, :Ab2], [q, q, q, q]
play_pattern_timed [:Eb2, :Eb2, :G2, :G2], [q, q, q, q]
play_pattern_timed [:C2, :C2, :C2, :C2], [q, q, q, q]
play_pattern_timed [:F2, :F2, :F2, :F2], [q, q, q, q]
play_pattern_timed [:Ab2, :Ab2, :G2, :G2], [q, q, q, q]
play_pattern_timed [:C2, :C2, :C2, :C2], [q, q, q, q]

##Slow drums
play_pattern_timed [:C2, :C2, :G2, :C2], [q, q+e, e, q]
play_pattern_timed [:F2, :F2, :C2, :F2], [q, q+e, e, q]
play_pattern_timed [:Ab2, :Ab2, :Eb2, :Ab2], [q, q+e, e, q]
play_pattern_timed [:Eb2, :Eb2, :G2, :G2], [q, q+e, e, q]
play_pattern_timed [:C2, :C2, :G2, :C2], [q, q+e, e, q]
play_pattern_timed [:F2, :F2, :C2, :F2], [q, q+e, e, q]
play_pattern_timed [:Ab2, :Ab2, :G2, :G2], [q, q+e, e, q]
play_pattern_timed [:C2, :C2, :G2, :C2], [q, q+e, e, q]

#Rock
play_pattern_timed [:C2, :C2, :C2, :C2, :C2, :C2, :C2, :C2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:F2, :F2, :F2, :F2, :F2, :F2, :F2, :F2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Ab2, :Ab2, :Ab2, :Ab2, :Ab2, :Ab2, :Ab2, :Ab2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Eb2, :Eb2, :Eb2, :Eb2, :G2, :G2, :G2, :G2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:C2, :C2, :C2, :C2, :C2, :C2, :C2, :C2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:F2, :F2, :F2, :F2, :F2, :F2, :F2, :F2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:Ab2, :Ab2, :Ab2, :Ab2, :G2, :G2, :G2, :G2], [e, e, e, e, e, e, e, e]
play_pattern_timed [:C2, :C2, :C2, :C2, :C2, :C2, :C2, :C2], [e, e, e, e, e, e, e, e]

##Latin
play_pattern_timed [:C2, :G2, :C3, :G2, :C2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:F2, :C3, :F3, :C3, :F2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Ab2, :Eb3, :Ab3, :Eb3, :Ab2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Eb2, :Bb2, :G2, :C3, :G2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:C2, :G2, :C3, :G2, :C2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:F2, :C3, :F3, :C3, :F2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:Ab2, :Eb3, :G2, :C3, :G2], [e_, s+e, e+e_, s+e, e]
play_pattern_timed [:C2, :G2, :C3, :G2, :C2], [e_, s+e, e+e_, s+e, e]
