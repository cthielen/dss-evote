class BallotsController < ApplicationController
  # GET /ballots
  # GET /ballots.xml
  def index
    @survey = Survey.find(params[:survey_id])
    @ballots = Ballot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ballots }
    end
  end

  # GET /ballots/1
  # GET /ballots/1.xml
  def show
    @ballot = Ballot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ballot }
    end
  end

  # GET /ballots/new
  # GET /ballots/new.xml
  def new
    @survey = Survey.find(params[:survey_id])
    
    @ballot = @survey.ballots.build
    
    #@survey.questions.count.times { @ballot.preferences.build }
    @survey.questions.each do |q|
      @ballot.preferences.build(:question_id => q.id)
    end
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /ballots/1/edit
  def edit
    @ballot = Ballot.find(params[:id])
  end

  # POST /ballots
  # POST /ballots.xml
  def create
    @survey = Survey.find_by_id(params[:survey_id])
    @ballot = @survey.ballots.build(params[:ballot])
    
    @ballot.submitted_on = DateTime.now

    respond_to do |format|
      if @ballot.save
        flash[:notice] = "Ballot was successfully created."
        format.html { redirect_to survey_url(@ballot.survey_id) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /ballots/1
  # PUT /ballots/1.xml
  def update
    @ballot = Ballot.find(params[:id])

    respond_to do |format|
      if @ballot.update_attributes(params[:ballot])
        format.html { redirect_to(@ballot, :notice => 'Ballot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ballot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ballots/1
  # DELETE /ballots/1.xml
  def destroy
    @ballot = Ballot.find(params[:id])
    @ballot.destroy

    respond_to do |format|
      format.html { redirect_to(ballots_url) }
      format.xml  { head :ok }
    end
  end
end
