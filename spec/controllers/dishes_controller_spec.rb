require "rails_helper"

RSpec.describe DishesController, type: :controller do
  let!(:user){FactoryBot.create :user}
  let!(:restaurant){FactoryBot.create :restaurant, user_id: user.id}
  let!(:dishes){FactoryBot.create_list :dish, 5, restaurant_id: restaurant.id}

  describe "GET #index" do
    before {get :index, params: {res_id: restaurant.id}}
    it "should be success" do
      expect(response).to have_http_status(200)
    end

    it "assigns @dishes" do
      expect(assigns(:dishes)).to eq(dishes)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #edit" do
    before {get :edit, xhr: true, params: {id: dishes[1].id}}

    it "assigns @dish" do
      expect(assigns(:dish)).to eq(dishes[1])
    end

    it "not render edit template" do
      expect(response).to render_template(:edit, format: :js)
    end
  end

  describe "PATCH #update" do
    before do
      patch :update, params: {res_id: restaurant.id, id: dishes[0].id,
        dish: {name: "Pizza đặc biệt"}}
    end

    it "assigns @restaurant" do
      expect(assigns(:restaurant)).to eq(restaurant)
    end

    it "assigns @dish" do
      expect(assigns(:dish)).to eq(dishes[0])
    end

    it "redirect to root url" do
      expect(response).to redirect_to(dishes_url res_id: restaurant.id)
    end

    it "should found" do
      expect(response).to have_http_status(302)
    end
  end
end
