require 'spec_helper'
describe Pbkdf2PasswordHasher do 

  before(:all) do 
    @django_hash = 'pbkdf2_sha256$12000$PEnXGf9dviXF$2soDhu1WB8NSbFDm0w6NEe6OvslVXtiyf4VMiiy9rH0='
  end

  describe 'check_password' do 

    describe "when provided the right password" do 
      it "should validate" do 
        Pbkdf2PasswordHasher::check_password('bite',@django_hash).should be_true
      end
    end

    describe "when NOT provided the right password" do 
      it "should NOT validate" do 
        Pbkdf2PasswordHasher::check_password('false_pass',@django_hash).should be_false
      end
    end

  end

  describe "hash_password" do 

    it "should work" do 
      a = @django_hash.split("$")
      Pbkdf2PasswordHasher.hash_password('bite',a[2],a[1]).should == a[3]
    end

  end

end
