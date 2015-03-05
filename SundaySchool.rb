Shoes.app do
  background orange..blue
  title "Welcome To Bible Quiz"
  # Move to under the title
  para "How many teams?"
  num_teams = edit_line
  teams_button = button "O.K."
  @teams = Array.new
  teams_button.click {
    number_of_teams = num_teams.text.to_i
    # Ask for a team name for each
    counter = 0
    para "Enter team #{counter} name:"
    team_name = edit_line
    name_button = button "O.K."
    name_button.click {
    @teams << team_name.text
    counter += 1
  }
  }
  
  
  
  
  
  
  
  
end