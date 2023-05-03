def player(ringt, idx, loc)
  sample loc, ringt[idx][0]
  while ringt[idx][1] == 0
    idx += 1
    sample loc, ringt[idx][0]
  end
  sleep ringt[idx][1]
  idx += 1
  return idx
end

dist = 0.01
idx = 0
live_loop :playd do
  drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Claps"
  drum_ring = (ring [1,0],[2,0.5],[1,0.5],[1,0],[0,0.5],[1,0],[2,0.5],[1,0.5],[1,0.25],[1,0],[0,0.25],[1,0],[2,0.5],[1,0], [0,0.5])
  with_fx :distortion, distort: dist do
    idx = player(drum_ring, idx, drums)
  end
end

idx2 = 0
w = 4
h = 2
live_loop :playd2 do
  a = (ring [chord(:Cs, :m), w],[chord(:B, :M), w],[chord(:A, :M), h],[chord(:B, :M), h],[chord(:Gs, :m), w])
  with_fx :distortion, distort: dist do
    use_synth :saw
    #play a[idx2][0], sustain: a[idx2][1], release: 0, decay: 0
    sleep a[idx2][1]
    idx2 += 1
  end
end

live_loop :dad do
  sleep 3
  dist = 0
  sleep 5
  dist = 0.01
end
