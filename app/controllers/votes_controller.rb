class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_vote, :authorize_user!, :only: [:create, :destroy]
  
  def create
    review = Review.find params[:review_id]
    vote = Vote.new user: current_user, review: review, is_up: params[:is_up]
    if !can?(:vote, review)
      redirect_to review.product, alert: "can't vote"
    elsif vote.save
      redirect_to review.product, notice: 'voted'
    else
      redirect_to review.product, alert: 'Not Voted'
    end
  end
  
  def update
      find_vote
    if vote.is_up
    vote.is_up = false
    vote.update(is_up: false)
    else
      vote.update(is_up: true)
    end
    redirect_to vote.review.product

    end
  end

  def destroy
    find_vote
      vote.destroy
      redirect_to vote.review.product, notice: 'Vote removed'
    else
      redirect_to vote.review.product, alert: "can't delete vote"
    end
  end

  private
  
  def find_vote
    @vote = Vote.find params[:id]

  def authorize_user!
    redirect_to @vote.review.product unless can? (:crud, @vote)
  end

end
