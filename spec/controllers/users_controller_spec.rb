require "rails_helper"

RSpec.describe UsersController, type: :controller do 
  context "Not Login" do
    describe "GET #new" do
      before do
        get :new
      end

      it "should redirect to login page" do
        expect(response).to render_template(:new)
      end

      it "should found" do
        expect(response).to have_http_status(200)
      end
    end

    describe "POST #create" do
      context "create user successfully" do
        let!(:user) {FactoryBot.create :user}
        
        before do
          post :create, params: {user: FactoryBot.attributes_for(:user)}
        end

        it "create user successfully" do  
          expect(response).to redirect_to(root_url)
        end

        it "flash create user successfully" do  
          expect(flash[:success]).to match(I18n.t("sign_up_successful"))     
        end

        it "test number of user" do
          expect{
            post :create, params: {user: FactoryBot.attributes_for(:user)}
          }.to change(User, :count).by(1)
        end
      end

      context "create user failed" do
        before do
          post :create, params: {user: {name:"", email:"", phone_number: "123456", 
            password: "123456", password_confirmation: "123456" }} 
        end

        it "create user failed" do
          expect(response).to render_template(:new)
        end

        it "flash create user failed" do
          expect(flash[:warning]).to match(I18n.t("fail_sign_up"))
        end
      end
    end
  end
    
  context "Logged in" do
    describe "PATCH #update" do
      let!(:user) {FactoryBot.create :user}
      before do   
        log_in user
      end

      context "update successfully" do
        before do        
          patch :update, params: {id: user.id, user: {name: "mklinh"}}
        end
        
        it "flash update successfully" do
          expect(flash[:success]).to match(I18n.t("user_updated"))
        end

        it "update successfully" do
          expect(User.find(user.id).name).to eq("mklinh")
        end
      end

      context "update failed" do
        before do
          User.find(user.id).update(name: "linh.mk")
          patch :update, params: {id: user.id, user: {name: ""}}
        end
        it "flash update failed" do
          expect(flash[:danger]).to match(I18n.t("user_update_fail"))
        end

        it "update failed" do
          expect(User.find(user.id).name).to eq("linh.mk")
        end
      end
    end
  end
end
