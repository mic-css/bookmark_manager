require 'spec_helper'

describe User do
  let(:user) do
    User.create(email: 'hello@mymail.com',
                password: '123example',
                password_confirmation: '123example')
  end

  context 'when given a valid email and password' do
    it 'authenticates the user' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end
  end

  context 'when given an incorrect password' do
    it 'does not authenticate the user' do
      authenticated_user = User.authenticate(user.email, 'incorrect123')
      expect(authenticated_user).to be_nil
    end
  end
end
