class Player
  attr_reader :name, :score
  
  def initialize(name)
    @name = name.upcase
    @score = 0
  end
  
end

class Game

  Struct.new("Question",:question,:correct_answer,:wrong1, :wrong2, :wrong3)
  
  attr_reader :questions
  
  def initialize
    @questions = Array.new
    load_questions
  end
  
  def load_questions
    @questions << Struct::Question.new("Who is the son of God?","Jesus","Paul","John","Noah")
    @questions << Struct::Question.new("Who annointed Jesus with Oil?","Mary","Martha","Sarah","Rebekah")
  end
  
  def random_question
    @questions.sample
  end
  
end


Shoes.app do
  background orange..blue
  stack {
    title "Welcome To Bible Quiz"
    # Move to under the title

    @num_teams_para = para "How many teams?"
    @num_teams = edit_line
    @num_teams.focus
    @teams_button = button "OK"
    @teams = Array.new

    @teams_button.click {
      number_of_teams = @num_teams.text.to_i
      @num_teams.remove
      @teams_button.remove
      @num_teams_para.remove
      # Ask for a team name for each
      @counter = 1
      stack {
        @team_name_para = para "Enter team #{@counter} name:"
        @team_name = edit_line
        @team_name.focus
        @name_button = button "OK"
        @name_button.click {
           @counter += 1
          case  
          when @counter <= number_of_teams
            @teams << Player.new(@team_name.text)
            @team_name.text = ""
            @team_name_para.replace "Enter team #{@counter} name:"
            @team_name.focus
         # when @counter == number_of_teams
        #    @teams << Player.new(@team_name.text)
        #    @team_name.text = ""
          when @counter > number_of_teams
            @teams << Player.new(@team_name.text)
            @team_name_para.remove
            @team_name.remove
            @name_button.remove
            # Teams have been entered 
            game = Game.new
             stack {
               @question = game.random_question
               @question_para = para "Question #{@question.question}"
               flow {@a1_radio = radio :quest; para "#{@question.correct_answer}"}
               flow {@a2_radio = radio :quest; para "#{@question.wrong1}"}
               flow {@a3_radio = radio :quest; para "#{@question.wrong2}"}
               flow {@a4_radio = radio :quest; para "#{@question.wrong3}"}
               @submit_question = button "Submit"
             }
          end # case
        } # name_button.click
       
      } # stack
    } # @teams_button.click
  } # stack
  
  
  
  
  
  
  
  
end