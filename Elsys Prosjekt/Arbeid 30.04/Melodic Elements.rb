w = 4.0
h = w/2.0
h_ = h*1.5
q = h/2.0
q_ = q*1.5
e = q/2.0
e_ = e*1.5
s = e/2.0
s_ = s*1.5

#Only Thing
melody_list = [[:E, w], [:Ds, h], [:Gs, e], [:Fs, e], [:E, e], [:Ds, e], [:Cs, q_], [:Ds, q_], [:E, q], [:Ds, h], [:E, q], [:Ds, q]]
chord_list = [[chord(:Cs, :m), w],[chord(:B, :M), w],[chord(:A, :M), h],[chord(:B, :M), h],[chord(:Gs, :m), w]]
#Faktisk Mgp
melody_list = [[:C5, e_], [:C5, e_], [:C5, e_], [:B4, e_], [:B4, e_], [:C5, e_],[:C5, e_], [:C5, e_], [:C5, e_], [:B4, e_], [:B4, e_], [:C5, e_],[:D5, e_], [:D5, e_], [:D5, e_], [:B4, e_], [:B4, e_], [:C5, e_],  [:C5, e_], [:C5, e_], [:C5, e_], [:B4, e_], [:B4, e_], [:C5, e_]]
chord_list = [[chord(:A, :m), w], [chord(:F, :M), w], [chord(:G, :M), w], [chord(:F, :M), w]]
#Going Inn
melody_list = [[0, h_], [:Gs5, s], [:Fs5, s], [:E5, s], [:Cs5, s], [:C5, w], [0, h_], [:Gs4, s], [:A5, s], [:C5, s], [:Cs5, s], [:C5, w], [0, h_], [:Cs5, s], [:Ds5, s], [:E5, s], [:A5, s], [:Gs5, w], [0, h_], [:Fs4, s], [:Gs4, s], [:A4, s], [:G4, s], [:G4, w]]
chord_list = [[chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:Gs, :M), w], [chord(:D, :M), h], [chord(:Bs, :M), h], [chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:F, :m), w], [chord(:F, :M), h], [chord(:A, :M), h]]
#Latin Song
melody_list = [[:C5, e], [:C5, e], [:Bb4, s], [:C5, e], [:G4, s+s], [:F4, s], [:G4, e+q], [:Eb5, e], [:Eb5, e], [:D5, s], [:Eb5, e], [:D5, s+s], [:Bb4, s], [:C5, e+q], [:G5, e], [:G5, e], [:F5, s], [:Eb5, e], [:C5, s+s], [:Bb4, s], [:C5, e+q], [0, q], [0, s], [:G4, s], [:C5, s], [:D5, s], [:Eb5, e], [:F5, s], [:D5, s+s], [:Eb5, s], [:C5, e], [0, q], [0, s], [:Bb4, s], [:Eb4, s], [:F5, s], [:G5, e], [:Ab5, s], [:F5, s+s], [:G5, s], [:Eb5, e], [:Eb5, q_], [:F5, e], [:D5, q_], [:Eb5, e], [:C5, w]]
chord_list=[[chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), w], [chord(:Eb, :M), h], [chord(:G, :M), h],[chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), h], [chord(:G, :M), h], [chord(:C , :m), w]]
#Rap Song
chord_list = [[chord(:Cs, :m), w], [chord(:Fs, :m), w], [chord(:Cs, :m), w], [chord(:Gs3, :m, invert:1), h], [chord(:B3, :M), h]]
