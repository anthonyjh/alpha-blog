require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
   
   def setup
      @category = Category.create(name: "sports")
   end
   
   #first test-ensure we have all routes and access to those routes
   test "should get categories index" do
      get :index
      assert_response :success  #ensure response is success
   end
   
   test "should get new" do
      get :new
      assert_response :success
   end
   
   test "should get show" do
      get(:show, {'id' => @category.id})  #generate the route for particular category
      assert_response :success
   end
   
end