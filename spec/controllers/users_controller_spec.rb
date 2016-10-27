require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to(render_template :new)
    end

    it "sets an instance variable of User type" do
      get :new

      expect(assigns(:user)).to be_a_new(User)


    end

  end

  describe "#create" do
    context "with valid parameters" do
      def valid_request
        post :create, params: {user: FactoryGirl.attributes_for(:user)}
      end

      it " created a user in the DB" do
        before=User.count
        valid_request

        after=User.count
        expect(after).to(eq(before+1))

      end
      it "redirects to home page" do
        valid_request
        expect(response).to redirect_to home_path

      end

      it "signs the user in" do
        valid_request
        # user_params= params.require(:user).permit(:first_name,:last_name,:email)

        # p request.parameters.first_name
        expect(session[:user_id]).not_to(eq(nil))


      end
    end

    context "with invalid parameters" do

      def invalid_request
        post :create, params: {user: FactoryGirl.attributes_for(:user, first_name: nil)}
      end

      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)


      end
      it " doesn't create a user in the database" do

        before=User.count
        invalid_request
        after=User.count
        expect(after).to(eq(before))


      end


    end


  end


end
