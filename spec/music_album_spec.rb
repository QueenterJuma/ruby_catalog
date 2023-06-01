require_relative '../item'
require_relative '../music_album'
require_relative '../genre'
require_relative '../app'
require 'json'
require 'date'

RSpec.describe App do
  let(:app) { App.new }

  describe '#add_music_album' do
    it 'adds a music album to the collection' do
      allow(app).to receive(:gets).and_return('Rock', 'John Doe', 'Label', '2023-05-30', 'true')

      app.add_music_album

      expect(app.instance_variable_get(:@music_albums).length).to eq(1)
    end
  end

  describe '#list_genres' do
    it 'lists all genres' do
      genre1 = Genre.new('Rock')
      genre2 = Genre.new('Pop')
      app.instance_variable_get(:@genres).push(genre1, genre2)

      expect { app.list_genres }.to output("Genre: \n'Rock'\n'Pop'\n").to_stdout
    end
  end
end
