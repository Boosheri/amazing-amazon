require 'rails_helper'

RSpec.describe NewsArticlesController, type: :controller do

  describe "GET #new" do

    it "renders new template" do
      get :new
      expect(response).to(render_template(:new))
    end

    it "set an instance variable for a new news article" do
      get :new
      expect(assigns(:news_article)).to(be_a_new(NewsArticle))
    end
  end
  
  describe "POST #create" do
    context 'with valid parameters' do
      def valid_request
        post :create, params: {
          news_article: FactoryBot.attributes_for(:news_article)
        }
      end

      it 'creates a new article in the db' do
        count_before = NewsArticle.count
        valid_request
        count_after = NewsArticle.count
        count_after = count_before + 1
      end
      
      it "redirects to show" do
        valid_request
        expect(response).to(redirect_to news_articles_path(NewsArticle.last))
      end
    end

      context 'with invalid parameters' do

        def invalid_request
          post :create, params: {
            news_article: FactoryBot.attributes_for(:news_article, title: '')
          }
        end

        it 'shouldnt create a new article in the db' do
        count_before = NewsArticle.count
        invalid_request
        count_after = NewsArticle.count
        expect(count_after).to eq(count_before)
        end
      
        it 'redirects to the show page' do
          expect(response).to render_template(:new)
        end
      end
    

  end

end
