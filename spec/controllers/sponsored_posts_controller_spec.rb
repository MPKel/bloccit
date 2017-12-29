require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }

   let(:my_spost) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { topic_id: my_topic.id, id: my_spost.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { topic_id: my_topic.id, id: my_spost.id }
      expect(response).to render_template :show
    end

    it "assigns my_spost to @sponsored_post" do
      get :show, params: { topic_id: my_topic.id, id: my_spost.id }
      expect(assigns(:sponsored_post)).to eq(my_spost)
    end
  end



  describe "GET #new" do
    it "returns http success" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, params: { topic_id: my_topic.id }
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new, params: { topic_id: my_topic.id }
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { topic_id: my_topic.id, id: my_spost.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(response).to render_template :edit
    end

    it "assigns post to be updated to @spost" do
      get :edit, params: { topic_id: my_topic.id, id: my_spost.id }

      post_instance = assigns(:sponsored_post)

      expect(post_instance.id).to eq my_spost.id
      expect(post_instance.title).to eq my_spost.title
      expect(post_instance.body).to eq my_spost.body
    end
  end

  describe "POST create" do
    it "increases the number of SponsoredPost by 1" do
      expect{ post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number } } }.to change(SponsoredPost,:count).by(1)
    end

    it "assigns the new sponsored post to @spost" do
      post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number } }
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end

    it "redirects to the new post" do
      post :create, params: { topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number } }
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end


  describe "PUT update" do
    it "updates sponsored post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = RandomData.random_number

      put :update, params: { topic_id: my_topic.id, id: my_spost.id, sponsored_post: {title: new_title, body: new_body, price: new_price } }

      updated_spost = assigns(:sponsored_post)
      expect(updated_spost.id).to eq my_spost.id
      expect(updated_spost.title).to eq new_title
      expect(updated_spost.body).to eq new_body
      expect(updated_spost.price).to eq new_price
    end

    it "redirects to the updated sponsored post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = RandomData.random_number

      put :update, params: { topic_id: my_topic.id, id: my_spost.id, sponsored_post: {title: new_title, body: new_body, price: new_price } }
      expect(response).to redirect_to [my_topic, my_spost]
    end
  end

  describe "DELETE destroy" do
    it "deletes the sponsored post" do
      delete :destroy, params: { topic_id: my_topic.id, id: my_spost.id }

      count = SponsoredPost.where({id: my_spost.id}).size
      expect(count).to eq 0
    end

    it "redirects to topics show" do
      delete :destroy, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(response).to redirect_to my_topic
    end
  end

end
