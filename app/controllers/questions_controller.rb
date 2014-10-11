class QuestionsController < ApplicationController
  
  def index
    @user = User.create(:total_score => 0)
  end

  def show
    @user = User.find_by_id(params[:user_id])
    redirect_to questions_scoreboard_path(:user_id => @user.id, :anchor => "highlight") if @user.questions.count == 6
    @question = Question.random_unanswered_question(@user.id)
    if @question.nil?
      redirect_to questions_scoreboard_path(:user_id => @user.id, :anchor => "highlight")
    end
  end

  def update_score
    user = User.find(params[:user_id])
    answer = Answer.find(params[:answer_id])
    user.total_score += answer.score.to_i
    user.questions << answer.question
    user.save!
    redirect_to questions_show_path(:user_id => user.id)
  end

  # GET /questions/new
  # GET /questions/new.jsonundefined b
  def new
    @questions = Question.all
    @question = Question.new
    @answers = @question.answers.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @questions = Question.all
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save(params[:question])
        format.html { redirect_to new_question_url, notice: 'questions was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to new_question_path, notice: 'questions was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def scoreboard
    @users = User.all_ordered_by_position
    @current_user = User.find(params[:user_id])
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end
end
