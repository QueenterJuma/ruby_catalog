require_relative '../game/game'

describe Game do
  before :each do
    @game = Game.new('Hockey', '2021-08-10', '2023-04-11', 'y')
  end

  it 'Test for Game instance' do
    expect(@game).to be_instance_of Game
  end

  it 'Test for attribute' do
    expect(@game.name).to eq('Hockey')
  end

  it 'Test for attribute' do
    expect(@game.last_played_at).to eq('2021-08-10')
  end
  
  it 'Test for attribute' do
    expect(@game.publish_date).to eq('2023-04-11')
  end

  it 'Test for attribute' do
    expect(@game.multiplayer).to eq('y')
  end
end
