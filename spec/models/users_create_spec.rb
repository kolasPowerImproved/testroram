require 'app/models/user'

describe User do

  describe ".full_name" do
    context "given '11', '22'" do
      it "return 11 22" do
        expect(User.full_name)
      end
    end

  end

end