<h1>Welcome to faceit-ruby</h1>
Hello!
This is a implementation for most of the endpoints the Faceit Data v4 api offers, feel free to contribute or fork to fit your application.

<h2>Installation</h2>

<p>Put this in your gemfile:</p>
<p><code>gem 'faceit-ruby', git: 'https://github.com/kallelundgren93/faceit-ruby.git'</code></p>

<p>Then run: </p>
<p><code>bundle install</code></p>

<p>Then create an app on <a href="https://developers.faceit.com/">Developer Faceit</a> to get a apikey, then select to create the apikey for Serverside</p>

<h2>Usage</h2>
<p>First you need to intialize the client:</p>
<p><code>client = Faceit::Client.new api_key: "YOUR-API-KEY"</code></p>

<p>Then you can start working towards the api</p>

<h3>Searches endpoints</h3>

<b><h4>GET /search/organizers Search for organizers</h4></b>

<p><code>client.search_organizers({name: "Swedish Pro League", offset: "0", limit: "2"})</code></p>
<i>Offset and limit is optional.</i>

<p>Example result:</p>
<p><code>=> "Faceit::Response:0x007fca705819b0 @items=[# Faceit::Organizer:0x007fca705819d8 @id="4bba8091-77f3-40a5-a986-715d160e2b53", @name="Swedish Pro League", @partner=true, @avatar="https://d50m6q67g4bn3.cloudfront.net/organizer_avatar/4bba8091-77f3-40a5-a986-715d160e2b53_1528027743156", @games=["csgo"], @countries=["SE"], @active=true, @regions=[]"</code></p>

<p>Getting information</p>
<p><code>res = client.search_organizers({name: "Swedish Pro League", offset: "0", limit: "2"})</code>
  
<p>Extracting it:</p>
<code>res.items.first.avatar</code>

<p>Result:</p>
<code>"https://d50m6q67g4bn3.cloudfront.net/organizer_avatar/4bba8091-77f3-40a5-a986-715d160e2b53_1528027743156"</code>
  

<b><h4>GET /search/players Search for players</h4></b>

<p><code>client.search_players({nickname: "FrekvenZ", offset: "0", limit: "2"})</code></p>
<i>Offset and limit is optional.</i>

<p>Example result:</p>
<p><code>"Faceit::Response:0x007fca701c1848 @items=[#Faceit::Player:0x007fca701c18e8 @id="8ed9d1fa-351c-4cff-86f8-82d907a2e598", @nickname="FrekvenZ", @avatar="https://d50m6q67g4bn3.cloudfront.net/avatars/8ed9d1fa-351c-4cff-86f8-82d907a2e598_1447861864100", @country="se", @games=[{"name"=>"csgo", "skill_level"=>"6"}, {"name"=>"lol_EUW", "skill_level"=>"5"}], @status="AVAILABLE", @verified=false"</code></p>

<p>Getting information</p>
<p><code>res = client.search_players({nickname: "FrekvenZ", offset: "0", limit: "2"})</code>
  
<p>Extracting it:</p>
<p><code>res.items.first.games</code></p>

<p> Result: </p>
<p><code>[{"name"=>"csgo", "skill_level"=>"6"}, {"name"=>"lol_EUW", "skill_level"=>"5"}]</code></p>

<b><h4>GET /search/teams Search for teams</h4></b>
<p><code>client.search_teams({nickname: "Astralis (Astralis)", offset: "0", limit: "2"})</code></p>
<i>Offset and limit is optional.</i>

<p>Example result:</p>
<p><code>Faceit::Response:0x007fca6e061f68 @items=[#Faceit::Team:0x007fca6e0627b0 @id="46367ae8-1345-4482-90e9-3f2e35e137fc", @name="Astralis", @verified=false, @avatar="", @game="csgo", @faceit_url="https://www.faceit.com/{lang}/teams/46367ae8-1345-4482-90e9-3f2e35e137fc", @chat_room_id="team-46367ae8-1345-4482-90e9-3f2e35e137fc">, #<Faceit::Team:0x007fca6e062788 @id="79bcd0c8-c30c-48b3-8796-b329b9b960f6", @name="Astralis", @verified=false, @avatar="https://d50m6q67g4bn3.cloudfront.net/teams_avatars/79bcd0c8-c30c-48b3-8796-b329b9b960f6_1468258988760", @game="dota2", @faceit_url="https://www.faceit.com/{lang}/teams/79bcd0c8-c30c-48b3-8796-b329b9b960f6", @chat_room_id="team-79bcd0c8-c30c-48b3-8796-b329b9b960f6"</code></p>

<p>Getting information</p>
<p><code>res = client.search_teams({nickname: "Astralis (Astralis)", offset: "0", limit: "2"})</code></p>

<p>Extracting it:</p>
<p><code>res.items.first.faceit_url</code></p>

<p> Result: </p>
<p><code>"https://www.faceit.com/{lang}/teams/46367ae8-1345-4482-90e9-3f2e35e137fc"</code></p>

<b><h4>GET /search/tournaments Search for tournaments</h4></b>
<p><code>client.search_tournaments({name: "Weekly", offset: "0", limit: "2"})</code></p>
<i>Offset and limit is optional.</i>

<p>Example result:</p>
<p><code>"Faceit::Response:0x007fca6d1436a8 @items=[#Faceit::Tournament:0x007fca6d1437c0 @id="99a90e8f-d1b9-44cf-a667-898f54bfb387", @competition_type="tournament", @name="Weekly Battle-Cup", @game="dota2", @region="US", @organizer_id="611751d3-099f-4fb0-8e6e-fb6e1cf95d61", @organizer_type="organization", @status="paid", @started_at=1522972800, @prize_type="points", @total_prize="5000", @players_joined=2, @players_checkedin=3, @slots=16>, #<Faceit::Tournament:0x007fca6d1436f8 @id="0d5f846a-74e2-446e-9e24-e010aaf0f208", @competition_type="tournament", @name="Weekly Battle-Cup", @game="dota2", @region="US", @organizer_id="611751d3-099f-4fb0-8e6e-fb6e1cf95d61", @organizer_type="organization", @status="paid", @started_at=1523578500, @prize_type="points", @total_prize="5000", @players_joined=nil, @players_checkedin=2, @slots=16"</code></p>

<p>Getting information</p>
<p><code>res = client.search_tournaments({name: "Weekly", offset: "0", limit: "2"})</code></p>

<p>Extracting it:</p>
<p><code>res.items.first.total_prize</code></p>

<p> Result: </p>
<p><code>"5000"</code></p>
  

