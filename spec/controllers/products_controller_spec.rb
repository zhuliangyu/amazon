require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "#show" do
    it "render show erb page" do
      product=FactoryGirl.create(:product)
      get :show, params: {id: product.id}
      expect(response).to(render_template(:show))
    end

    it "sets an instance variable with the campaign whose id is passed'" do

      p=FactoryGirl.create(:product)
      get :show, params: {id: p.id}
      expect(assigns("p")).to(eq(p))
    end

  end

  describe "#index" do
    it "render the index page" do
      # product_arr=[]
      # 10.times do
      #   product=FactoryGirl.create(:product)
      #   product_arr<<product
      #
      # end
      get :index
      expect(response).to(render_template(:index))
    end


    it "sets an instance variable with the campaign whose id is passed'" do

      product_arr=[]

      10.times do
        product=FactoryGirl.create(:product)
        product_arr<<product

      end

      get :index

      expect(assigns(:ps)).to(eq(product_arr))


    end


  end

  describe "#destroy" do
    it "render the destroy page" do
      p=FactoryGirl.create(:product)
      delete :destroy, params: {id: p.id}
      expect(response).to(redirect_to(products_path))
    end

    it "sets an instance variable with the campaign whose id is passed'" do
      before=Product.count
      p=FactoryGirl.create(:product)
      p=Product.last
      delete :destroy, params: {id: p.id}
      after=Product.count
      expect(before).to(eq(after))
    end


  end

  describe "#new" do
    it "render the new page" do
      get :new
      expect(response).to(render_template(:new))
    end

    it 'instantiates a new product object' do
      get :new
      expect(assigns(:p)).to(be_a_new(Product))
    end

  end

  describe "#edit" do
    it "render the edit page" do
      p=FactoryGirl.create(:product)
      get :edit, params: {id: p.id}
      expect(response).to(render_template(:edit))
    end

    it "set an instance " do
      p=FactoryGirl.create(:product)
      get :edit,params:{id: p.id}
      expect(assigns(:p)).to(eq(p))



    end





  end

  describe "#update" do
    it "render the update page" do
      p=FactoryGirl.create(:product)
      patch :update, params: {id: p.id, product: {title: "qqqqqq", description: "qqqqqq", price: 999}}
      # expect(response).to(redirect_to product_path(Product.last))
      expect(response).to(redirect_to product_path(p.id))
    end

    it "updates the object" do
      p=FactoryGirl.create(:product)
      patch :update, params: {id: p.id, product: {title: "qqqqqq", description: "qqqqqq", price: 999}
      }
      # ,sales_price:800,created_at:p.created_at,updated_at:p.updated_at
      expect(p.reload.title).to(eq("qqqqqq"))

    end


  end

  describe "#create" do
    it "renders the create page" do
      p=FactoryGirl.create(:product)
      post :create, params: {product: attributes_for(:product)}
      expect(response).to(redirect_to product_path(Product.last))

    end

    it 'saves a record to the database' do
      count_before = Product.count
      post :create, params: {product: attributes_for(:product)}

      count_after = Product.count
      expect(count_after).to eq(count_before + 1)
    end

  end

end
