class QuestionController < ApplicationController
  def index
    @user = User.create(:total_score => 0)
  end

  def show
    @question = Question.first(:order => "RANDOM()")
    @user = User.find(params[:user_id])
  end

  def update_score
    user = User.find(params[:user_id])
    answer = Answer.find(params[:answer_id])
    user.total_score += answer.score
    user.save!
    redirect_to question_show_path(:user_id => user.id)
  end
end
