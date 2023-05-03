#FX variables and functions. These are updated based on the states_list.

#Idea for code:

#In update_loop a function Update_FX is called.
#Here all indiviudal FX varaibles and functions are updated.
#The FX themselves are palced elcewhere in the code where the insturmetns are played.
#They use the updated variables at every time. The varaibels should thus be refrences
#so that they always are updated.

#It should be tested if the FX is updated when it is outside the Live_loop.
#This could save alot of procesing power. Otherwise it should be placed
#inside the live_loop. It might be that the effect is only updated every
#iteration in this case. 

with_fx :reverb do
  live_loop
end
