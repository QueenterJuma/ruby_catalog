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

  describe '#list_music_albums' do
    it 'lists all music albums' do
      genre = Genre.new('Rock')
      music_album1 = MusicAlbum.new(genre, 'John Doe', 'Label 1', DateTime.now, true)
      music_album2 = MusicAlbum.new(genre, 'Jane Smith', 'Label 2', DateTime.now, false)
      app.instance_variable_get(:@music_albums).push(music_album1, music_album2)

      expected_output = "ID: #{music_album1.id}\nGenre: #{genre}\nAuthor: John Doe\nLabel: Label 1\nPublish Date: #{music_album1.publish_date}\nOn Spotify: true\nCan be archived? #{music_album1.can_be_archived?}\n-----------------------------------\nID: #{music_album2.id}\nGenre: #{genre}\nAuthor: Jane Smith\nLabel: Label 2\nPublish Date: #{music_album2.publish_date}\nOn Spotify: false\nCan be archived? #{music_album2.can_be_archived?}\n-----------------------------------\n"

      expect { app.list_music_albums }.to output(expected_output).to_stdout
    end
  end
end
