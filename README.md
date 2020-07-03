# alien_project
#There are three distinct experiments and each involves 2-3 datasets. Some of these have been already merged in the cleanup process. 

# Raw data

The 'Lab_final' folder contains the raw dataset for the game plays (AG_plays_cobe) as well as the survey data. 
Due to the fact that some of the lab participants failed to provide the correct game id, which would allow us to match survey and game play data, part the matching was done by a RA  using timestamps. In addition, more so in the lab then on Mturk, quite a few participants chose to play the game repeatedly. We have only analyzed the first session for each participant. cobegame.csv is the cleaned up and merge dataset (use R scripts/read_cobe_games.R, if you want to generate it from the raw data) that will be used subequently. 

The 'Mturk final' folder contains the survey data and the gameplays corresponding to the mturk id

The 'Cog ability final' folder contains the cog_ability_cobe_game_data file which has the 3 datasets combined. 

# MATLAB scripts

Ww have used matlab to code the search moves. use 'create_searchstrategies.m' to compute hamming distance and feedback variables, as well as model based and interdependence vars. for convenience write the new data using 'write_game_file.m'. Note that for cog sci data i have simply appended the original file. 

# R scripts
Once all steps above are completed, you should be able to read the data into r using 'data_load.r'. All scripts pertaining to the environment are called in 'setup_and_data_load.Rmd'. Analyses can be run using 'Cleaned_up_analysis.Rmd'. 
