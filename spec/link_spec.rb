require 'link'

describe Link do
  subject{described_class.create(title: 'Makers Academy', url: 'http://www.makersacademy.com/')}

  it{is_expected.to respond_to(:title)}
  it{is_expected.to respond_to(:url)}
  it{is_expected.to respond_to(:id)}
end
