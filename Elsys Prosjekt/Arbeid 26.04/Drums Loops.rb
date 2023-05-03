#Drum Pattern Functions

define :four_on_floor do
  drums = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/4 on the floor"
  a = (ring [2, 0.5], [1, 0.5], [2, 0], [0, 0.5], [1, 0.5])
  sample a[Current_beat][0]
  sleep a[Current_beat][1]
end

define :latin_drums do
  latinLoc = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Latin Drums"
  drum_ring = (ring [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.75], [1, 0.25], [0, 0.5], [1, 0.5], [0, 0.25], [1, 0.5], [1, 0.25], [0, 0.5], [1, 0.5])
  
  
end

define :rock_drums do
  rockLoc = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Rock Drums"
  drum_ring = (ring [0,0],[1,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[1,0],[2,0.5],[3,0],[2,0.5],[1,0],[2,0.5])
  
end


define :slow_drums do
  slowLoc = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Slow Drums"
  drum_ring = (ring [0,2],[1,1],[0,2],[0,1],[1,2])
end


define :clap_drums do
  clapLoc = "C:/Users/Espen van Beuzekom/Documents/Skule/Elsys Prosjekt/Samples/Drums Loops/Claps"
  drum_ring = (ring [1,0],[2,0.5],[1,0.5],[1,0],[0,0.5],[1,0],[2,0.5],[1,0.5],[1,0.25],[1,0],[0,0.25],[1,0],[2,0.5],[1,0], [0,0.5])
               
               
               sample clapLoc, 1
               sleep 0.5
               sample clapLoc, 1
               sleep 0.25
               sample clapLoc, 1
               sample clapLoc, 0
               sleep 0.25
               sample clapLoc, 1
               sample clapLoc, 2
               sleep 0.5
               sample clapLoc, 1
               sample clapLoc, 0
               sleep 0.5
               end
               
               