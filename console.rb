require('pry-byebug')
require_relative('models/bounty')



bounty1 = Bounty.new({
  'name' => 'Rocket',
  'last_known_location' => 'Mars',
  'homeworld' => 'Halfworld',
  'bounty_value' => '100'
  })

bounty2 = Bounty.new({
  'name' => 'Groot',
  'last_known_location' => 'Mars',
  'homeworld' => 'Planet X',
  'bounty_value' => '200'
})

bounty3 = Bounty.new({
  'name' => 'Gamora',
  'last_known_location' => 'Soulworld',
  'homeworld' => 'Unknown',
  'bounty_value' => '300'
})


bounty4 = Bounty.new({
  'name' => 'Peter Quill',
  'last_known_location' => 'Unknown',
  'homeworld' => 'Earth',
  'bounty_value' => '500'
})


bounty5 = Bounty.new({
  'name' => 'Madonna',
  'last_known_location' => 'London, England',
  'homeworld' => 'Venus',
  'bounty_value' => '10'
})

found_bounty = Bounty.find(10)
bounties = Bounty.all()

binding.pry
nil
