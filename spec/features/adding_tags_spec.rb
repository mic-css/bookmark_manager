require 'spec_helper'

feature 'Adding tags' do
  context 'when I add a new link' do
    scenario 'I can add a tag' do
      create_link('www.wordpress.com', 'Wordpress', 'blog')
      link = Link.first
      expect(link.tags.map(&:name)).to include('blog')
    end

    scenario 'I can add multiple tags' do
      create_link('www.wordpress.com', 'Wordpress', 'blog cat funny')
      link = Link.first
      expect(link.tags.map(&:name)).to include('blog', 'cat', 'funny')
    end
  end
end
