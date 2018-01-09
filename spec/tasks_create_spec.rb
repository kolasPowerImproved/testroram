require 'app/controllers/tasks_controller'

describe TasksController do

  describe ".index" do
    context "given an empty list" do
      it "returns nil" do
        expect(TasksController.index)==nil
      end
    end

  end

  describe ".create" do
    context "given 'dsfdf'" do
      it "returns dsfdf" do
        expect(TasksController.create, Task.title.length >= 3 )
      end
    end

  end

end