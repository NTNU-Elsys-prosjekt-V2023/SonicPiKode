#All global variables should be defined and initialized here.
#When adding a variable here, it should have a clear description of its function

#The global BPM, is updated acording to the vocal that is playing
Global_BPM = 128

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

Section_beats = 8 #Amount of beats per section

Beat_ring = (range 1,Section_beats+1,1) #A ring that keeps track of what beat the song is in

Beat_idx = 0 #And index that keeps track of the Beat_ring position

Current_beat = 0 #indicates the current beat of the song.