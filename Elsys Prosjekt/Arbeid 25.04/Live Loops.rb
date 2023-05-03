#The first method and loop are an examnple of how instruments can be implimented.
#In this case drums. The similarities should help in creating new instruments.

#Defines a method that plays the method drum_chooser. This loop indefinetly
define :drum_thread do
  loop do
    drum_chooser
    play 60
    sleep 1
  end
end

#This live_loop is responisble for playing the drums of the song.
live_loop :drums do
  use_bpm Global_BPM
  #The loops wait for a continue signal cue to proceed with the program.
  sync :continue
  #A thread i made that plays the drum_thread method
  t = in_thread do
    drum_thread
  end
  #The program wait for a cue to kill the thread above. Then kills it.
  sync :kill
  Thread.kill(t)
end

#Defines a method that plays the method drum_chooser. This loop indefinetly
define :vocal_thread do
  loop do
    vocal_chooser
  end
end

#This live_loop is responisble for playing the drums of the song.
live_loop :vocals do
  use_bpm Global_BPM
  #The loops wait for a continue signal cue to proceed with the program.
  sync :continue
  #A thread i made that plays the drum_thread method
  t = in_thread do
    vocal_thread
  end
  #The program wait for a cue to kill the thread above. Then kills it.
  sync :kill
  Thread.kill(t)
end

#Live_loop that is responible for updating the States_list variable with the states
#It also detects if there has been any change to the list since last iteration.
live_loop :Update_Loop do
  detect_MIDI
  detect_change
  update_BPM
  pause_play
  skip_forward
  skip_backward
end

#A Live_loop that waits for a signal "change".
#It then send the kill signal to all instrument loops if the song should stop.
#Else the instruments are told to continue.
live_loop :kill_play do
  sync :change
  if play_song && !should_skip && !should_back
    cue :continue
  else
    cue :kill
  end
end


live_loop :tracker do
  use_bpm Global_BPM
  if play_song
    increase_beat
    if Current_beat == 1 && !should_loop
      next_section
    end
    cue :change_inst
    sleep 1
  else
    sync :change
  end
end


