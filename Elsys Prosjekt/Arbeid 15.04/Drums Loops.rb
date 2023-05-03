#Drum Pattern Functions
afoiuyds=0

define :four_on_floor do
  drums = "C:/Users/espen/Documents/Projects/Elsysprosjekt/Drums Loops/4 on the floor"
  sample drums, 2
  sleep 0.5
  sample drums, 1
  sleep 0.5
  sample drums, 2
  sample drums, 0
  sleep 0.5
  sample drums, 1
  sleep 0.5
end

define :latin_drums do
  latinLoc = "C:/Users/espen/Documents/Projects/Elsysprosjekt/Drums Loops/Latin Drums"
  sample latinLoc, 0
  sleep 0.75
  sample latinLoc, 1
  sleep 0.25
  sample latinLoc, 0
  sleep 0.5
  sample latinLoc, 1
  sleep 0.5
  
  sample latinLoc, 0
  sleep 0.75
  sample latinLoc, 1
  sleep 0.25
  sample latinLoc, 0
  sleep 0.5
  sample latinLoc, 1
  sleep 0.5
  
  sample latinLoc, 0
  sleep 0.75
  sample latinLoc, 1
  sleep 0.25
  sample latinLoc, 0
  sleep 0.5
  sample latinLoc, 1
  sleep 0.5
  
  sample latinLoc, 0
  sleep 0.25
  sample latinLoc, 1
  sleep 0.5
  sample latinLoc, 1
  sleep 0.25
  sample latinLoc, 0
  sleep 0.5
  sample latinLoc, 1
  sleep 0.5
end

define :rock_drums do
  rockLoc = "C:/Users/espen/Documents/Projects/Elsysprosjekt/Drums Loops/Rock Drums"
  sample rockLoc, 0
  sample rockLoc, 1
  sleep 0.5
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 3
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 1, amp: 0.45
  sample rockLoc, 2
  sleep 0.5
  
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 3
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 3
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 3
  sample rockLoc, 2
  sleep 0.5
  sample rockLoc, 1
  sample rockLoc, 2
  sleep 0.5
end


define :slow_drums do
  slowLoc = "C:/Users/espen/Documents/Projects/Elsysprosjekt/Drums Loops/Slow Drums"
  sample slowLoc, 0
  sleep 2
  sample slowLoc, 1
  sleep 1
  sample slowLoc, 0
  sleep 2
  sample slowLoc, 0
  sleep 1
  sample slowLoc, 1
  sleep 2
end


define :clap_drums do
  clapLoc = "C:/Users/espen/Documents/Projects/Elsysprosjekt/Drums Loops/Claps"
  sample clapLoc, 1
  sample clapLoc, 2
  sleep 0.5
  sample clapLoc, 1
  sleep 0.5
  sample clapLoc, 1
  sample clapLoc, 0
  sleep 0.5
  sample clapLoc, 1
  sample clapLoc, 2
  sleep 0.5
  
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

