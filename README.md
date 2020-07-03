# alien_project
#There are three distinct experiments and each involves 2-3 datasets. Some of these have been already merged in the cleanup process.

The COBE lab_final folder contains the raw dataset for the game plays (AG_plays_cobe) as well as the survey data. 
Due to the fact that some of the lab participants failed to provide the correct game id, which would allow us to match survey and game play data, part the matching was done by a RA  using timestamps. In addition, more so in the lab then on Mturk, quite a few participants chose to play the game repeatedly. We have only analyzed the first session for each participant. 
cobegame.csv is the cleaned up and merge dataset that will be used subequently. 
the mturk final folder contains the survey data and the gameplays corresponding to the mturk id

the cog sci final folder contains the cog_ability_cobe_game_data file which has the 3 datasets combined.

MATLAB folder
i have used matlab to code the search moves and while much of the analysis has been redone, those scripts have been reused. use 'create_searchstrategies.m' to compute hamming distance and feedback variables, as well as model based and interdependence vars. for convenience write the new data using 'write_game_file.m'. note that for cog sci data i have simply appended the original file. 

once all steps above are completed, you should be able to read the data into r using 'data_load.r'. All scripts pertaining to the environment are called in 'setup_and_data_load.nb'
