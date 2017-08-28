class VotesController < ApplicationController
  before_action :set_vote, only: [:edit, :destroy, :update]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.new(vote_params)

    if @vote.save
      redirect_to @vote
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @vote.update
      redirect_to @vote
    else
      render 'edit'
    end
  end

  def destroy
    @vote.destroy
    redirect_to votes_path
  end


  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:value, :votable_type, :votable_id)
    end
end
