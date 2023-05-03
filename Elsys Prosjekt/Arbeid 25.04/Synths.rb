define :sine_bass do
  s = synth :sine, sustain: 10
  control s, note: 30
end



define :reece_bass do
  s = synth :dtri, sustain: 10
  control s, note: 30
end

define :bass_808 do
  sample :bd_808
  with_fx :distortion, distort: 0.7 do
    
    control s, note: 30
    sleep 1
  end
end

define :acoustic_bass do
  s = synth :fm, release: 0.5
  control s, note: 50
  sleep 1
end

define :slap_bass do
  s = synth :pretty_bell, release: 0.5
  control s, note: 30
  sleep 1
end

define :piano_synth do
  use_synth :piano
  play 60
  sleep 1
end

define :supersaw_synth do
  use_synth :tech_saws
  play 70
end

define :pluck_synth do
  with_fx :reverb, damp: 1 do
    with_fx :hpf, cutoff: 40 do
      s = synth :square, decay: 0.2 ,sustain_level: 0.05, release: 1, cutoff: 70
      control s, note: 65
      sleep 1
    end
  end
end

define :guitar_synth do
  with_fx :distortion, distort: 0.6 do
    with_fx :hpf, cutoff: 40 do
      guitar = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples"
      sample guitar, 0, pitch: 12
    end
  end
end

guitar_synth
