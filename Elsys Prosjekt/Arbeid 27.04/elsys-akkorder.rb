#NOTEVERDIER
w = 4.0
h = w/2.0
h_ = h*1.5
q = h/2.0
q_ = q*1.5
e = q/2.0
e_ = e*1.5
s = e/2.0

define :latin_chords do
  chord_ring = (ring [chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), w], [chord(:Eb, :M), h], [chord(:G, :M), h],[chord(:C, :m), w], [chord(:F, :m), w], [chord(:Ab, :M), h], [chord(:G, :M), h], [chord(:C , :m), w])
end

define :going_in_chords do
  chord_ring = (ring [chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:Gs, :M), w], [chord(:D, :M), h], [chord(:Bs, :M), h], [chord(:Gs, :M), w], [chord(:A, :M), h], [chord(:Fs, :m), h], [chord(:F, :m), w], [chord(:F, :M), h], [chord(:A, :M), h])
end

define :only_thing_chords do
  chord_ring = (ring [chord(:Cs, :m), w],[chord(:B, :M), w],[chord(:A, :M), h],[chord(:B, :M), h],[chord(:Gs, :m), w])
end

define :faktisk_mgp_chords do
  chord_ring = (ring [chord(:A, :m), w], [chord(:F, :M), w], [chord(:G, :M), w], [chord(:F, :M), w])
end

define :rap_chords do
  chord_ring =(ring [chord(:Cs, :m), w], [chord(:Fs, :m), w], [chord(:Cs, :m), w], [chord(:Gs3, :m, invert:1), h], [chord(:B3, :M), h])
